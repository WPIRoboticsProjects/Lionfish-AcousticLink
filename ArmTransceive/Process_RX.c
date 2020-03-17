/*
 * Process_RX.c
 *
 *  Created on: Mar 2, 2020
 *      Author: Nick
 */
#include <stdbool.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <float.h>
#include <string.h>

#include "ALinkProtocol.h"
#include "sampling.h"
#include "CRC.h"
#include "Process_TX.h"

//variables for ADC processing / Threshold
static uint32_t ADC_THRESHOLD = 50; //threshold for 0/1 TODO: measure and change
static uint32_t curr_max, tx_count, buffer_avg, buffer_sum, on_count, off_count = 0;
bool read_buffer = false; //debug

//Debug + Raw RX Buffer (int)
static uint32_t raw_rx;
static uint32_t rx_buffer[2048]; //reasonably sized buffer to log rx messages (and to debug)
static int rx_index = 0;
#define RX_INDEX_WRAP(i) ((i+1) & (2048-1)) // index wrapping macro

#define HighBitTH SamplesPerBit

//PROTOTYPES
void process_adc();
void read_for(uint32_t index, uint32_t length);
void process_packet_raw(uint32_t packet);
void adjust_threshold(int avg, int max);

void process_adc(){
    raw_rx = 0;
    gADCBufferIndex = 0; //start at 0
    uint32_t processing_index = 0;

    uint32_t start_frame_length = (SamplesPerBit * STARTFrameLength)+1;
    uint32_t packet_length = (SamplesPerBit * PacketLength)+1;

    //look for start bits until processing index is at buffersize - packetlength
    while(processing_index <= ((uint32_t) ADC_BUFFER_SIZE - packet_length)){


        //wait for at least 1 start frame to possibly be sampled by ADC
        while(((uint32_t) gADCBufferIndex - (uint32_t) processing_index) <= start_frame_length);

        raw_rx = 0;
        read_for(processing_index, start_frame_length);
        uint8_t bit_xor = (raw_rx ^ (uint8_t) StartFrame);

        if(!bit_xor){ //read start
            processing_index += start_frame_length + 1; //move to current sample

            //wait for adc to sample for length of rest of packet
            while((gADCBufferIndex - processing_index) < (packet_length-start_frame_length));

            raw_rx &= (uint8_t) 0b11111111; //take only start frame
            read_for(processing_index, ((uint32_t) packet_length-(uint32_t) start_frame_length));

            bool check = verify_crc(raw_rx);//TODO: CRC
            if(!check){
                process_packet_raw(raw_rx);
            }
            raw_rx = 0;
            tx_count = 0;
            off_count = 0;
            on_count = 0; //clear
            return;
        }else{ //did not read start
            processing_index+=1; //progress to most currently processed sample
        }
    }

}

void read_for(uint32_t index, uint32_t length){
    uint32_t i; //Loop through
    uint8_t onSample =0;
    for(i = 0; i < length ; )
    {
        uint8_t j=0 ;
        onSample =0;
        for( j = i  ; (i-j) <SamplesPerBit ; ++i )
        {   // check one bit length of samples.
            if(gADCBuffer[i + index ] > ADC_THRESHOLD)
            {// reading a 1 sample
                onSample++;
            }
        }
        //check if that's a bit
        if(onSample > HighBitTH )
        { //found enough samples to be count as a one.
            raw_rx = raw_rx << 1; //shift bits left 1
            raw_rx |=1;
        }
        else
        { //count as a zero
            raw_rx = raw_rx << 1; //shift bits left 1
        }
    }
}



//void process_adc(){
//    read_buffer = false;
//    int i;
//    //ADC SAMPLING ROUTINE
//    for(i = 0; i < ADC_BUFFER_SIZE; i++)
//    {
//        buffer_sum += gADCBuffer[i]; //sum up all samples
//
//        if((int) gADCBuffer[i] > curr_max){ //compare curr_max to current sample and adjust
//            curr_max = (int) gADCBuffer[i];
//        }
//
//        //OFFSET PROCESSING
//        if(gADCBuffer[i] < ADC_THRESHOLD){// counts as a 0
//            off_count++;
//        }else if(gADCBuffer[i] > ADC_THRESHOLD){//counts as a 1
//            on_count++;
//        }
//
//        //SAMPLE COUNT ROUTINE
//        if(off_count >= (int)PacketLength){ //found enough samples to process a 0 read
//            raw_rx = raw_rx << 1; //shift bits left 1
//            off_count = 0;
//            tx_count++;
//        }else if(on_count >= (int)PacketLength){ //found enough samples to process a 1 read
//            raw_rx = raw_rx << 1; //shift bits left 1
//            raw_rx += 1; //add 1 to LSB
//            on_count = 0;
//            tx_count++;
//        }
//
//        uint8_t bit_xor = (raw_rx ^ (uint8_t) StartFrame);
//
//        //START BIT CHECKING (only if not reading)
//        if((bit_xor == 0)){//current rx has just read the start bits
//            raw_rx &= CRC_MASK; //everything but the start bits are now 0
//            tx_count = 8; //reset count, adjusted for 8 start bits
//        }
//
//        //LOGGING + PACKET PROCESS ONCE PACKET LENGTH READ
//        if(tx_count >= PacketLength){
//            if(check_crc(raw_rx)){ //check the packet for errors
//                process_packet_raw(raw_rx); //look at packet frame as whole
//            }
//            raw_rx = 0;
//            tx_count = 0;
//            off_count = 0;
//            on_count = 0; //clear
//        }
//    }
//
//    //AVG RECALC
//    buffer_avg = (int) buffer_sum / ADC_BUFFER_SIZE; //average buffer values (Use for Threshold Control?)
//
//    //ADJUST THRESHOLD
//    adjust_threshold(buffer_avg, curr_max);
//    read_buffer = true;
//}

void process_packet_raw(uint32_t packet){
    //EXTRACT ID AND PAYLOAD OUT
    uint32_t packet_id = (uint32_t) ((ID_MASK & packet) >> (DATAFrameLength+CRCFrameLength)); //shift id to most significant 4 bit
    uint32_t payload = (uint32_t) ((PAYLOAD_MASK & packet) >> CRCFrameLength); //shift payload to most significant 8 bit


    if(packet_id == id.REQUEST){ //resend the data buffer of the specific ID in payload
        set_data_buffer(payload, id.REQUEST);
        uint8_t new_id = payload;
        uint8_t new_payload = get_data_buffer(new_id);
        uint32_t new_packet = construct_packet(new_id, new_payload);
        send_message(new_packet);
    }

    if(packet_id == id.COMMAND_STATUS){ //or = the payload to the command status data buffer
        or_data_buffer(payload, id.COMMAND_STATUS);
        uint8_t new_id = id.ACK;
        uint8_t new_payload = id.COMMAND_STATUS;
        uint32_t new_packet = construct_packet(new_id, new_payload);
        send_message(new_packet);
    }

    if(packet_id == id.ACK){ //reciever recieved your last message, store this
        set_data_buffer(payload, id.ACK);
    }

    int i;
    for(i = 3; i < 15; i++){
        if(packet_id == id.SCHEDULER_INFO[i]){
            set_data_buffer(payload, id.SCHEDULER_INFO[i]);
            break;
        }
    }

    //Reset and Log Raw_RX
    rx_buffer[rx_index] = packet; //add to log
    rx_index = RX_INDEX_WRAP(rx_index);
}

//takes the buffer avg and max and adjusts the current ADC_THRESHOLD
void adjust_threshold(int avg, int max){ //TODO: this
    int prev_offset =  ADC_THRESHOLD;
}
