/*
 * Process_RX.c
 *
 *  Created on: Mar 2, 2020
 *      Author: Nick
 */
#include <stdbool.h>

#include "ALinkProtocol.h"
#include "sampling.h"
#include "CRC.h"
#include "Process_TX.h"

//variables for ADC processing / Threshold
static uint32_t ADC_THRESHOLD = 515; //threshold for 0/1 TODO: measure and change
static uint32_t curr_max, tx_count, buffer_avg, on_count, off_count = 0;

//Debug + Raw RX Buffer (int)
static uint32_t raw_rx;
static uint32_t rx_buffer[2048]; //reasonably sized buffer to log rx messages (and to debug)
static int rx_index = 0;
#define RX_INDEX_WRAP(i) ((i) & (2048-1)) // index wrapping macro


//PROTOTYPES
void process_adc();
static void process_packet_raw(uint32_t packet);
static bool check_raw_start(uint32_t packet);

void process_adc(){
    int i;
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
        if(off_count >= (int)PacketLength){ //found enough samples to process a 0 read
            raw_rx = raw_rx << 1; //shift bits left 1
            off_count = 0;
            tx_count++;
        }else if(on_count >= (int)PacketLength){ //found enough samples to process a 1 read
            raw_rx = raw_rx << 1; //shift bits left 1
            raw_rx += 1; //add 1 to LSB
            on_count = 0;
            tx_count++;
        }

        //START BIT CHECKING (only if not reading)
        if(check_raw_start(raw_rx)){//current rx has just read the start bits
            raw_rx &= CRC_MASK; //everything but the start bits are now 0
            tx_count = 8; //reset count, adjusted for 8 start bits
        }

        //LOGGING + PACKET PROCESS ONCE PACKET LENGTH READ
        if(tx_count >= PacketLength){
            if(check_crc(raw_rx)){ //check the packet for errors
                process_packet_raw(raw_rx); //look at packet frame as whole
            }

            //Reset and Log Raw_RX
            rx_buffer[rx_index] = raw_rx; //add to log
            rx_index = RX_INDEX_WRAP(rx_index);
            raw_rx = 0; //clear
        }
    }

    //AVG RECALC
//    buffer_avg = (int) buffer_avg / ADC_BUFFER_SIZE; //average buffer values (Use for Threshold Control?)

    //ADJUST THRESHOLD
//    adjust_threshold(buffer_avg, curr_max);
}

static void process_packet_raw(uint32_t packet){
    //EXTRACT ID AND PAYLOAD OUT
    uint32_t packet_id = (ID_MASK && packet) >> (DATAFrameLength+CRCFrameLength); //shift id to most significant 4 bit
    uint32_t payload = (PAYLOAD_MASK && packet) >> CRCFrameLength; //shift payload to most significant 8 bit

    if(packet_id == id.REQUEST){ //resend the data buffer of the specific ID in payload
//        process_request((uint8_t) payload);

    }

    if(packet_id == id.COMMAND_STATUS){ //or = the payload to the command status data buffer

    }

    if(packet_id == id.ACK){ //reciever recieved your last message, store this

    }
}

//check raw rx for start bits
static bool check_raw_start(uint32_t packet)
{
    uint8_t bit_xor = (packet ^ (uint8_t) StartFrame);
    return (bit_xor == 0); //if bit_xor == 0, then all bits in rx == start bits
}
