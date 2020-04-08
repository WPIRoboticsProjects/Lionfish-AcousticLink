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
static uint32_t ADC_THRESHOLD = 2048; //threshold for 0/1 TODO: measure and change
static uint32_t curr_max, tx_count, buffer_avg, buffer_sum, on_count, off_count = 0;
bool read_buffer = false; //debug

//Debug + Raw RX Buffer (int)
uint32_t raw_rx;
static uint32_t rx_buffer[2048]; //reasonably sized buffer to log rx messages (and to debug)
static int rx_index = 0;
#define RX_INDEX_WRAP(i) ((i+1) & (2048-1)) // index wrapping macro

#define HighBitTH 6

//PROTOTYPES
void process_adc();
void read_for(uint32_t index, uint32_t length);
void process_packet_raw(uint32_t packet);
void adjust_threshold(int avg, int max);

void process_adc(){
    raw_rx = 0;
    gADCBufferIndex = 0; //start at 0
    uint32_t processing_index = 0;
    uint32_t edge_state = 0;


    uint32_t start_frame_length = ((uint32_t) SamplesPerBit * (uint32_t) STARTFrameLength);
    uint32_t packet_length = ((uint32_t) SamplesPerBit * (uint32_t) PacketLength);

    //look for start bits until processing index is at buffersize - packetlength
    while(processing_index < ((uint32_t) ADC_BUFFER_SIZE - (packet_length + start_frame_length))){

        //edge trigger
        while(!edge_state){
            if(gADCBuffer[processing_index] > ADC_THRESHOLD) //Found a rising edge sample
            {
                edge_state = 1;
            }else if((processing_index + 1) <= (uint32_t) gADCBufferIndex)
            {//next element has been read in from adc already
                processing_index += 1; //advance index if no edge found
            }
        }

        //wait for at least 1 start frame to possibly be sampled by ADC
        while(((uint32_t) gADCBufferIndex - processing_index) <= start_frame_length);

        //read start in
        read_for(processing_index, start_frame_length);

        //xor check
        raw_rx &= (uint32_t) 0xFF;
        uint8_t raw_xor = (raw_rx & (uint8_t) 0xFF);
        uint8_t bit_xor = (raw_xor ^ (uint8_t) StartFrame);

        //if the bit_xor is 0, which is a pass, then !0 --> 1 or true
        if(!bit_xor)
        {
            processing_index += start_frame_length;
            //wait for packet_length * samplesperbit
            while(((uint32_t) gADCBufferIndex - processing_index) <= (packet_length - start_frame_length));

            //read rest of packet
            read_for(processing_index, (packet_length - start_frame_length));

            //check crc
            bool crc_check = verify_crc(raw_rx);
            if(!crc_check){
                process_packet_raw(raw_rx);
                return;
            }
        }else
        {
            processing_index += 1;
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
        for( j = i  ; (((i-j) < SamplesPerBit) && (i < length)) ; i++ )
        {   // check one bit length of samples.
            if(gADCBuffer[i + index] > ADC_THRESHOLD)
            {// reading a 1 sample
                onSample++;
            }
        }
        //check if that's a bit
        if(onSample >= HighBitTH)
        { //found enough samples to be count as a one.
            raw_rx |=1;
            raw_rx = raw_rx << 1; //shift bits left 1
        }else{
            raw_rx = raw_rx << 1; //shift bits left 1
        }
    }
}

void process_packet_raw(uint32_t packet){
    //EXTRACT ID AND PAYLOAD OUT
    uint32_t packet_id = (uint32_t) ((uint32_t) ID_MASK & packet) >> 16;
    uint32_t payload = (uint32_t) ((uint32_t) PAYLOAD_MASK & packet) >> 8;


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
        if(packet_id == i){
            set_data_buffer(payload, id.SCHEDULER_INFO[i-3]);
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
