/*
 * ALinkProtocol.c
 *
 *  Created on: Mar 2, 2020
 *      Author: Nick
 */

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <float.h>
#include <string.h>

#include "ALinkProtocol.h"
#include "sampling.h"

/*
 * ALL VARIABLES ARE STATIC TO PREVENT BUILD ERRORS FROM DUPLICATE NAMED VARIABLES
 */

//SCHEDULER DATA
//HOLDS DATA RECIEVED AND TO SEND
static uint8_t DATA_BUFFER[16];

static bool READING, SENDING = false; //reading and sending flags for debug
static bool AUV_RECALL = false; //flags for Debug/Jetson
static bool AUV_ARM = false; //flags for Debug/Jetson

//Prototypes:
//static because it is a duplicate in the SRC code right now
void init_protocol();
static void init_keys(ID * id_key, COMMAND * command_key);
uint32_t get_data_buffer(uint32_t index);
void set_data_buffer(uint32_t data, uint32_t index);
void or_data_buffer(uint32_t data, uint32_t index);
COMMAND * get_commands();
ID * get_ids();

void init_protocol(){
    init_keys(&id, &command);
}

uint32_t get_data_buffer(uint32_t index){
    return DATA_BUFFER[index];
}

void set_data_buffer(uint32_t data, uint32_t index){
    DATA_BUFFER[index] = data;
}

void or_data_buffer(uint32_t data, uint32_t index){
    DATA_BUFFER[index] |= data;
}

ID * get_ids(){
    return &id;
}

COMMAND * get_commands(){
    return &command;
}

//init values for COMMAND and ID lookups
static void init_keys(ID * id_key, COMMAND * command_key){
    id_key->ACK = 0x00;
    id_key->COMMAND_STATUS = 0x01;
    id_key->REQUEST = 0x02;

    int i, num = 0x03;
    for(i = 0; i < 15; i++){
        id_key->SCHEDULER_INFO[i] = num;
        num ++;
    }

    command_key->ARM = 0x01;
    command_key->DISARM = 0x02;
    command_key->RECALL = 0x03;
}
