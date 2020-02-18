/**
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
#include "driverlib/adc.h"
#include "driverlib/timer.h"
#include "inc/tm4c1294ncpdt.h"
#include "inc/hw_memmap.h"
//#include "buttons.h"
#include "sampling.h"
#include "hwDebug.h"
#include "pwmDriver.h"

#pragma DATA_ALIGN(gDMAControlTable, 1024) // address alignment required
tDMAControlTable gDMAControlTable[64]; // uDMA control table (global)

#define TX_FREQ 80000 //80Khz TX
#define BIT_RATE 8 //Bits Per Second

#define VIN_RANGE 3.3 // 3.3 V on board
#define ADC_BITS 12 // 12 bit ADC
#define SAMPLE_RATE 5000 //Samples Per Second

#define START_BITS 0xFA //start bits 11111010


//GLOBALS
uint32_t gSystemClock; // [Hz] system clock frequency
uint32_t gTime = 8345; // time in hundredths of a second

int samples_per_bit = (int) SAMPLE_RATE / BIT_RATE;

uint32_t raw_rx = 0; //variable to store received messages
uint32_t buffer_log[1024]; //store rx_bits in 32 bit chunks
int buffer_index = 0; //buffer index

bool READING = false; //boolean flag for READING in bits
bool AUV_RECALL = false; //flags for Jetson
bool AUV_DISARM = false; //flags for Jetson

//FUNC DEFINITIONS
void send_start();
void process_buffer();
void process_raw();
bool check_raw_start();
void tx_message(int * binary_payload, int binary_length);
int * message_to_binary(char *input, int input_length);


int main(void)
{
    IntMasterDisable();

    // Enable the Floating Point Unit, and permit ISRs to use it
    FPUEnable();
    FPULazyStackingEnable();

    // Initialize the system clock to 120 MHz
    gSystemClock = SysCtlClockFreqSet(SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_480, 120000000);

    // Initialize
    SamplingInit();
    debugPinsInit();
    pwm1Init();
    pwm3Init();

    //----------------------------DMA SETUP FOR ADC1---------------------------------------------
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UDMA);
    uDMAEnable();
    uDMAControlBaseSet(gDMAControlTable);
    uDMAChannelAssign(UDMA_CH24_ADC1_0); // assign DMA channel 24 to ADC1 sequence 0
    uDMAChannelAttributeDisable(UDMA_SEC_CHANNEL_ADC10, UDMA_ATTR_ALL);
    // primary DMA channel = first half of the ADC buffer
    uDMAChannelControlSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT,
     UDMA_SIZE_16 | UDMA_SRC_INC_NONE | UDMA_DST_INC_16 | UDMA_ARB_4);
    uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT,
     UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R,
     (void*)&gADCBuffer[0], ADC_BUFFER_SIZE/2);
    // alternate DMA channel = second half of the ADC buffer
    uDMAChannelControlSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT,
     UDMA_SIZE_16 | UDMA_SRC_INC_NONE | UDMA_DST_INC_16 | UDMA_ARB_4);
    uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT,
     UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R,
     (void*)&gADCBuffer[ADC_BUFFER_SIZE/2], ADC_BUFFER_SIZE/2);
    uDMAChannelEnable(UDMA_SEC_CHANNEL_ADC10);

    //ADC SETUP WITH DMA
    ADCSequenceDMAEnable(ADC1_BASE, 0); // enable DMA for ADC1 sequence 0
    ADCIntEnableEx(ADC1_BASE, ADC_INT_DMA_SS0); // enable ADC1 sequence 0 DMA interrupt

    IntMasterEnable();

    //self-measured *TO DO: adjust if needed for transducer inputs, used to reduce noise
    int ADC_OFFSET = 515;
    uint16_t mask = (1 << 9) - 1; //binary = 11111111

    //Main Loop
    while(1)
    {
        int i, on_count, off_count, buffer_avg, tx_count; //variables for ADC processing

        //ADC SAMPLING ROUTINE
        for(i = 0; i < ADC_BUFFER_SIZE; i++)
        {
            buffer_avg += gADCBuffer[i]; //sum up all samples

            //OFFSET PROCESSING
            if(gADCBuffer[i] < ADC_OFFSET){// counts as a 0
                off_count++;
            }else if(gADCBuffer[i] > ADC_OFFSET){//counts as a 1
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
            if((!READING) && check_raw_start()){//current rx has just read the start bits
                raw_rx &= mask; //everything but the start bits are now 0
                tx_count = 8; //reset count, adjusted for 8 start bits
            }

            if(tx_count >= 32){
                process_raw();
                buffer_log[buffer_index] = raw_rx;
                buffer_index++;
                if(buffer_index <= 1024) buffer_index=0;
            }
        }

        buffer_avg = buffer_avg / ADC_BUFFER_SIZE; //average buffer values (Use for Threshold Control?)
    }
}

//uses raw_rx (contains a frame)
void process_raw()
{

}

//check raw rx for start bits
bool check_raw_start()
{
    uint8_t bit_xor = (raw_rx ^ (uint8_t) START_BITS);
    return (bit_xor == 0); //if bit_xor == 0, then all bits in rx == start bits
}

void tx_message(int * binary_payload, int binary_length)
{
    send_start(); //sends START BITS
    int i;
    for(i = 0; i < binary_length; i++){
        if(binary_payload[i] == 1){
            pwmOutputEnable();
            //delay x time
            pwmOutputDisable();
        }else if(binary_payload[i] == 0){
            //delay x time
        }
    }
}

void send_start()
{
    uint8_t bits = (uint8_t) START_BITS;
    int i;
    for(i = 0; i < 8; i++){
        if(bits % 1 == 0){ //LSB is 1
            pwmOutputEnable();
            //delay x time
            pwmOutputDisable();

        }else if(bits % 1 == 1){ //LSB is 0
            //delay x time
        }
        bits = bits >> 1;
    }
}

/**
 * Function: message_to_binary
 * Arguments:
 *      -char *input: pointer to array of message characters
 *      -int input_length: size of the char array
 *
 * Returns: a integer array of the characters message in binary
 * **/
int * message_to_binary(char *input, int input_length)
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
