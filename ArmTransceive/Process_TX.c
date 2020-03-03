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


static uint32_t tx_buffer[2048]; //reasonably sized buffer to log sent messages (and to debug)
static uint32_t tx_index = 0;
#define TX_INDEX_WRAP(i) ((i) & (2048-1)) // index wrapping macro

void send_message(uint32_t packet);
uint32_t construct_packet(uint8_t packet_id, uint8_t packet_payload);


//uses the PWM to send a packet of length PacketSize (Protocol)
void send_message(uint32_t packet){
    //Send message
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
