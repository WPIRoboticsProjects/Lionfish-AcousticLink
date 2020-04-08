/*
 * crc8.c
 *
 * Computes a 8-bit CRC
 *
 */
#include "ALinkProtocol.h"
#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

#define GP  0x107   /* x^8 + x^2 + x + 1 */
#define DI  0x07


static unsigned char crc8_table[256];     /* 8-bit table */
static int made_table=0;

static void init_crc8();
uint32_t gen_crc8(uint32_t packet);
void crc8(unsigned char *crc, unsigned char m);
bool verify_crc(uint32_t packet);

static void init_crc8()
/*
 * Should be called before any other crc function.
 */
{
    int i,j;
    unsigned char crc;

    if (!made_table) {
        for (i=0; i<256; i++) {
            crc = i;
            for (j=0; j<8; j++)
                crc = (crc << 1) ^ ((crc & 0x80) ? DI : 0);
            crc8_table[i] = crc & 0xFF;
            /* printf("table[%d] = %d (0x%X)\n", i, crc, crc); */
        }
        made_table=1;
    }
}


void crc8(unsigned char *crc, unsigned char m)
/*
 * For a byte array whose accumulated crc value is stored in *crc, computes
 * resultant crc obtained by appending m to the byte array
 */
{
    if (!made_table)
        init_crc8();

    *crc = crc8_table[(*crc) ^ m];
    *crc &= 0xFF;
}

uint32_t gen_crc8(uint32_t packet){
    unsigned char crc = 0x00;
    unsigned char byte_array[4];
    uint32_t mask = (uint32_t) 0xFF000000; //MSB (8-bit)
    uint8_t i, j = 0;

    //make byte array
    for(i = 3; i; i--){
        uint8_t byte = (uint8_t) ((packet & mask) >> i*8);
        byte_array[j] = (unsigned char) byte;
        mask >>= 8;
        j++;
    }

    //find CRC from top 24 bits (last 8 should be the CRC!!!)
    for(i = 0; i < 4; i++){
        unsigned char byte = byte_array[i];
        crc8(&crc, byte);
    }

    return (packet | crc);
}

bool verify_crc(uint32_t packet){
    unsigned char new_crc, crc = 0x00;
    unsigned char byte_array[4];
    uint32_t mask = (uint32_t) 0xFF000000; //MSB (8-bit)
    uint8_t i, j = 0;

    //make byte array
    for(i = 3; i; i--){
        uint8_t byte = (uint8_t) ((packet & mask) >> ((i-1)*8));
        byte_array[j] = (unsigned char) byte;
        mask >>= 8;
        j++;
    }

    crc = byte_array[3]; //LSB
    byte_array[3] = 0x00; //reset CRC

    //find CRC from top 24 bits (last 8 should be the CRC!!!)
    for(i = 0; i < 3; i++){
        crc8(&new_crc, byte_array[i]);
    }

    if(crc == new_crc){
        return true;
    }else{
        return false ;
    }
    return 0;
}

