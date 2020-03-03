/*
 * Process_TX.c
 *
 *  Created on: Mar 2, 2020
 *      Author: Nick
 */
#include <stdint.h>
#include <inttypes.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <float.h>
#include <string.h>

#include "ALinkProtocol.h"
#include "CRC.h"
#include "TimerTX.h"
#include "pwmDriver.h"


static uint32_t tx_buffer[2048]; //reasonably sized buffer to log sent messages (and to debug)
static uint32_t tx_index = 0;
#define TX_INDEX_WRAP(i) ((i) & (2048-1)) // index wrapping macro


void send_message(uint32_t packet);
uint32_t construct_packet(uint8_t packet_id, uint8_t packet_payload);


//uses the PWM to send a packet of length PacketSize (Protocol)
// Big endien order
void send_message(uint32_t packet){
    int16_t i;
//    sending in MSB first
    uint8_t lastBit =0;

    for(i= PacketLength-1 ; i>-1; --i )
    {
        // current bit is one or zero
        uint32_t currentBit  = packet & 1<<i;
        // clock out the break period
        if (currentBit && lastBit)
            // break period high if both data bit are high
            pwmOutputEnable();
        else
            pwmOutputDisable();

        // wait for break period length
        for(t1OFCount =0 ; t1OFCount < SamplePerBreak;)
       {
       }


        if (currentBit)
            pwmOutputEnable();
        else
            pwmOutputDisable();

//        wait for transmit period of this bit.
        t1OFCount =0;
        for(t1OFCount =0 ; t1OFCount < SamplesPerBit;)
       {
       }

        lastBit = currentBit ;
    }

    pwmOutputDisable();

    //Log Packet Locally
    tx_buffer[tx_index] = packet;
    tx_index = TX_INDEX_WRAP(tx_index);
}






//construct a full packet with the 8-bit ID and PAYLOAD
uint32_t construct_packet(uint8_t packet_id, uint8_t packet_payload){
    //start frame
    uint32_t ans = StartFrame;
    ans <<= STARTFrameLength;

    //4 bits of packet ID
    ans |= (packet_id & ID_MASK);
    ans <<= IDFrameLength;

    //8 bits of payload
    ans |= packet_payload;
    ans <<= DATAFrameLength;

    return crc_8(ans); //add crc with crc_8 and return
}
