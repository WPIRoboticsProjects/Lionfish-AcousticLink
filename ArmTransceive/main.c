/**
 */



//--------------------------        PIN ASSIGNMENT       --------------------------//
/* Port L: PL0:PL3: Hardware Debug Pin
 * Port PF0:PF3 : PWM module 0 generator 0 and 1 // note:PF0 is not available on booster back breakout.
 * Port PK4:PK5 : PWM module 0 generator 3
 */

//--------------------------        TIMER ASSIGNMENT     --------------------------//
/* TIMER 1 : TX bit modulation
 * TIMER 2 : ADC trigger timer
 *
 */



/* Port Assigement:
 * Port L : Debug
 * Port PF0:PF3 : PWM
 *
 *
 */

// ��C:\ti\\TivaWare_C_Series2.1.1.71b�� set as ${SW_ROOT} needs to be added to compiler path for headers

// "${SW_ROOT}/driverlib/ccs/Debug/driverlib.lib" Pre Compiled TivaWare libs needs to exist in ARM Linker file search Path


#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <float.h>
#include <string.h>
#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "driverlib/udma.h"
#include "driverlib/emac.h"
#include "inc/hw_emac.h"
#include "driverlib/adc.h"
#include "driverlib/timer.h"
#include "inc/tm4c1294ncpdt.h"
#include "inc/hw_memmap.h"

#include <ALinkProtocol.h>
#include "sampling.h"
#include "hwDebug.h"
#include "pwmDriver.h"
#include "TimerTX.h"
#include "CRC.h"


//PROTOTYPES
void process_raw();
void process_request(uint8_t payload);
void process_command(uint8_t payload);
void process_info(uint8_t payload);
void process_request_info(uint8_t info_payload, uint8_t info_id);
uint32_t construct_packet(uint8_t packet_id, uint8_t packet_payload);
void init_keys(ID * id, COMMAND * command);
bool check_raw_start();
void adjust_threshold(int avg, int max);
void delayMS(int ms);
int * message_to_binary(char *input, int input_length);

#define VIN_RANGE 3.3 // 3.3 V on board
#define ADC_BITS 12 // 12 bit ADC
#define SAMPLE_RATE 5000 //Samples Per Second TODO: delete

//GLOBALS
uint32_t gSystemClock; // [Hz] system clock frequency
uint32_t gTime = 8345; // time in hundredths of a second

int samples_per_bit = (int) ADC_SAMPLING_RATE / BitRate;
int ADC_THRESHOLD = 515; //threshold for 0/1 TODO: measure and change

//holds scheduler data in order
uint8_t data_buffer[16];
int schedule_index = 0;

//store rx_bits messages as a log (debug tool)
uint32_t buffer_log[1024];
int buffer_index = 0;

//used to find 8-bit values for commands/IDs
ID id;
COMMAND command;

//used to verify a response / request sent.
//Will contain an ID if listening for certain response. 0 if not listening
uint8_t ACK_ID;

bool READING, SENDING = false; //reading and sending flags for debug
bool AUV_RECALL = false; //flags for Debug/Jetson
bool AUV_ARM = false; //flags for Debug/Jetson


int main(void)
{
    IntMasterDisable();

    // Enable the Floating Point Unit, and permit ISRa`````11qqqqqqqqqqqqqq``ws to use it
    FPUEnable();
    FPULazyStackingEnable();

    // Initialize the system clock to 120 MHz
    gSystemClock = SysCtlClockFreqSet(SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_480, 120000000);

    // Initialize
    //init_protocol
    init_keys(&id, &command); //set all id/command keys for reference TODO: DELETE
    SamplingInit();
    debugPinsInit();
    pwm1Init();
    pwm3Init();
    timer1Init();

    IntMasterEnable();

    //SAMPLING / MAIN VARIABLES
    uint32_t raw_rx = 0; //variable to store raw bits
    uint16_t crc_mask = (1 << 9) - 1; //binary = 0000 0000 1111 1111

    //Test for CRC
    uint32_t test_rx = 0x881E500;
    uint32_t crc_test = crc_8(test_rx);
    bool test_check = check_crc(crc_test);

    //Main Loop
    while(1)
    {
        //variables for ADC processing / Threshold
        int i;
        int on_count = 0, off_count = 0, buffer_avg = 0, tx_count = 0, curr_max = 0;

        //ADC SAMPLING ROUTINE
        for(i = 0; i < ADC_BUFFER_SIZE; i++)
        {
            buffer_avg += gADCBuffer[i]; //sum up all samples

            if((int) gADCBuffer[i] > curr_max){ //compare curr_max to current sample and adjust
                curr_max = (int) gADCBuffer[i];
            }

            //OFFSET PROCESSING
            if(gADCBuffer[i] < ADC_THRESHOLD){// counts as a 0
                off_count++;
            }else if(gADCBuffer[i] > ADC_THRESHOLD){//counts as a 1
                on_count++;
            }

            //SAMPLE COUNT ROUTINE
            if(off_count >= samples_per_bit){ //found enough samples to process a 0 read
                raw_rx = raw_rx << 1; //shift bits left 1
                off_count = 0;
                tx_count++;
            }else if(on_count >= samples_per_bit){ //found enough samples to process a 1 read
                raw_rx = raw_rx << 1; //shift bits left 1
                raw_rx += 1; //add 1 to LSB
                on_count = 0;
                tx_count++;
            }

            //START BIT CHECKING (only if not reading)
            if((!READING) && check_raw_start(raw_rx)){//current rx has just read the start bits
                READING = true;
                raw_rx &= crc_mask; //everything but the start bits are now 0
                tx_count = 8; //reset count, adjusted for 8 start bits
            }

            //LOGGING + PACKET PROCESS ONCE PACKET LENGTH READ
            if(tx_count >= PacketLength){
                READING = false; //done reading packet

                if(check_crc(raw_rx)){ //check the packed for errors
                    process_raw(raw_rx); //look at packet frame as whole
                }

                //Reset and Log Raw_RX
                buffer_log[buffer_index] = ~raw_rx; //add to log
                buffer_index++;
                if(buffer_index == 1024){
                    buffer_index=0;  //wrap
                }
                raw_rx = 0; //clear
            }


            //TODO: ISR's based on state
            //if we have a message to send, trigger PWM ISR
            //if we have a recieved packet from ETH, ISR triggers
            //if we have a packet to transmit over ETH, ISR triggers
        }

        //AVG RECALC
        buffer_avg = (int) buffer_avg / ADC_BUFFER_SIZE; //average buffer values (Use for Threshold Control?)

        //ADJUST THRESHOLD
        adjust_threshold(buffer_avg, curr_max);
    }
}

//processes command payload and set appropriate pins
void process_command(uint8_t payload) //TODO: send ethernet packet to jetson with payload
{
    uint32_t response; //packet to echo response to

    if((int) payload == (int) command.ARM){
        data_buffer[1] = command.ARM; //update data array
        response = construct_packet(id.COMMAND_STATUS, command.ARM);
        AUV_ARM = true;
        //Ethernet ISR? SEND ARM PAYLOAD
        //PWM ISR to ECHO ACK
    }
    if((int) payload == (int) command.DISARM){
        data_buffer[1] = command.DISARM; //update data array
        response = construct_packet(id.COMMAND_STATUS, command.DISARM);
        AUV_ARM = false;
        //Ethernet ISR? SEND DISARM PAYLOAD
        //PWM ISR to ECHO ACK
    }
    if((int) payload == (int) command.RECALL){
        data_buffer[1] = command.RECALL; //update data array
        response = construct_packet(id.COMMAND_STATUS, command.RECALL);
        AUV_RECALL = true;
        //Ethernet ISR? SEND RECALL PAYLOAD
        //PWM ISR to ECHO ACK
    }

}



//Case: Recieved a packet with an INFO to be handled by the schdulers
//uses scheduler to log payload appropriately
void process_info(uint8_t payload) //TODO: this + Scheduler
{
    data_buffer[schedule_index] = payload;
    schedule_index++;

    if(schedule_index > SchedulerLength){ //wrap
        schedule_index = 0;
    }
}



//Case: recieved a requested packet, which will have the id given by ACK_ID
void process_request_info(uint8_t info_payload, uint8_t info_id) //TODO: this + Scheduler
{
    //the ID is the index + 1 because the first ever ID is 0x01
    int data_index = ((int) info_id) - 1;
    data_buffer[data_index] = info_payload;
}



//use payload to find and resend the information based on the ID
void process_request(uint8_t payload) //TODO: search for ID data and resend (payload contains an ID)
{
    uint8_t request_id = payload;
    uint32_t request_information, ans;

    int i;
    for(i = 0; i < 14; i++){
        if((int) request_id == (int) id.SCHEDULER_INFO[i]){ //resend this information
            request_information = data_buffer[i+2];
            ans = construct_packet(id.SCHEDULER_INFO[i], request_information);
        }else if((int) request_id == (int) id.COMMAND_STATUS){
            request_information = data_buffer[1];
        }
    }
    ACK_ID = request_id; //indicate we are expecting this ID as a response
    //HELP!
    //TODO: trigger PWM ISR to send this message???
}



//uses raw_rx (contains a full packet)
void process_raw(uint32_t packet)
{
    uint32_t payload_mask = ((1 << (DATAFrameLength+1)) - 1) << CRCFrameLength; //binary =  0000 0000 0000 0000 1111 1111 0000 0000
    uint32_t id_mask = ((1 << (IDFrameLength+1)) - 1) << (DATAFrameLength+CRCFrameLength);     //binary =  0000 0000 0000 1111 0000 0000 0000 0000

    //EXTRACT ID AND PAYLOAD OUT
    uint32_t packet_id = (id_mask && packet) >> (DATAFrameLength+CRCFrameLength); //shift id to most significant 4 bit
    uint32_t payload = (payload_mask && packet) >> CRCFrameLength; //shift payload to most significant 8 bit

    //CHECK ID
    if((int) packet_id == (int) id.COMMAND_STATUS){
        if(!ACK_ID){//if ACK_ID is true, it must have had the wrong id of 0 or false. This is the placeholder for: not listening for response
            process_command((uint8_t) payload);//process the message normally
        }else{//listening
            process_request_info((uint8_t) payload, (uint8_t) packet_id);//process as
        }

    }else if((int) packet_id == (int) id.REQUEST){
        process_request((uint8_t) payload);//always one way, never an ACK

    }else{
        if(!ACK_ID){//not listening for info
            process_info((uint8_t) payload);//process as scheduler
        }else if((int) packet_id == (int) ACK_ID){ //if the recieved ID == ACK_ID
            process_request_info((uint8_t) payload, (uint8_t) packet_id);//process as request
        }else{ //listening but not right ID
            process_info((uint8_t) payload);//process as scheduler
        }
    }
}




//check raw rx for start bits
bool check_raw_start(uint32_t packet)
{
    uint8_t bit_xor = (packet ^ (uint8_t) StartFrame);
    return (bit_xor == 0); //if bit_xor == 0, then all bits in rx == start bits
}




//construct a full packet with the 8-bit ID and PAYLOAD
uint32_t construct_packet(uint8_t packet_id, uint8_t packet_payload){
    uint8_t id_mask = ((1 << (IDFrameLength+1)) - 1);     //binary =  1111

    //start frame
    uint32_t ans = StartFrame;
    ans <<= STARTFrameLength;

    //4 bits of packet ID
    ans |= (packet_id & id_mask);
    ans <<= IDFrameLength;

    //8 bits of payload
    ans |= packet_payload;
    ans <<= DATAFrameLength;

    return crc_8(ans); //add crc with crc_8 and return
}




//takes the buffer avg and max and adjusts the current ADC_THRESHOLD
void adjust_threshold(int avg, int max){ //TODO: this
    int prev_offset =  ADC_THRESHOLD;
}

//used to delay processes (uneeded?)
void delayMS(int ms) {
    SysCtlDelay( (SysCtlClockGet()/(3*1000))*ms ) ;
}

//converts char message from user into binary
int * message_to_binary(char *input, int input_length) //TODO: FIX FOR uINT32_t
{
    int * output = malloc(input_length * 8 * sizeof(int));
    int output_index = 0;

    int i;
    for (i = 0; i < input_length; i++) // loop through input characters
    {
        int dec = (int) input[i]; // decimal ASCII representation
        int remainder, j = 1; // binary rep of the current character
        int temp_byte[8] = {0,0,0,0,0,0,0,0};
        int temp_index = 7;

        while(dec != 0){ // convert to binary loop
            remainder = dec % 2; //LSB
            temp_byte[temp_index] = remainder; temp_index--; //temp store bit (reversed)
            dec = dec / 2; j *= 10; //iterate
        }

        int k;
        for(k = 0; k < 8; k++){
            output[output_index] = temp_byte[j]; //store in correct order
            output_index++;
        }
    }
    return output;
}

//init values for COMMAND and ID lookups
void init_keys(ID * id_key, COMMAND * command_key){
    id_key->COMMAND_STATUS = 0x01;
    id_key->REQUEST = 0x02;

    int i, num = 0x03;
    for(i = 0; i < 14; i++){
        id_key->SCHEDULER_INFO[i] = num;
        num ++;
    }

    command_key->ARM = 0x01;
    command_key->DISARM = 0x02;
    command_key->RECALL = 0x03;
}
