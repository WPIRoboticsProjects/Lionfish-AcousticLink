#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <inttypes.h>
#include <stdbool.h>
#include "CRC.h"


uint32_t crc_8(uint32_t packet){
    uint32_t new_packet = packet;
    unsigned char poly = (unsigned char) CRC_8_POLYNOMIAL;
    unsigned char data[4];
    int i;
    for(i = 4; i; i--){
        data[i] = (unsigned char) ((packet & (0xFF << (i*8))) >> (i*8));
    }

    unsigned char crc = crc8_lsb(poly, data, 4);

    new_packet <<= 4;
    new_packet |= (uint8_t) crc;
    return new_packet;
}

bool check_crc(uint32_t packet){
    bool ans;
    unsigned char poly = (unsigned char) CRC_8_POLYNOMIAL;
    unsigned char data[4];
    int i;
    for(i = 4; i; i--){
        data[i] = (unsigned char) ((packet & (0xFF << (i*8))) >> (i*8));
    }

    unsigned char crc = crc8_lsb(poly, data, 4);

    if((uint8_t) crc == 0){
        ans =  true; //crc was correct when done again
    }else{
        ans =  false;//crc failed
    }
    return ans;
}

unsigned char crc8_lsb(unsigned char poly, unsigned char* data, int size)
{
    unsigned char crc = 0x00;
    int bit;

    while (size--) {
        crc ^= *data++;
        for (bit = 0; bit < 8; bit++) {
            if (crc & 0x01) {
                crc = (crc >> 1) ^ poly;
            } else {
                crc >>= 1;
            }
        }
    }

    return crc;
}

//unsigned char crc8_msb(unsigned char poly, unsigned char* data, int size)
//{
//    unsigned char crc = 0x00;
//    int bit;
//
//    while (size--) {
//        crc ^= *data++;
//        for (bit = 0; bit < 8; bit++) {
//            if (crc & 0x80) {
//                crc = (crc << 1) ^ poly;
//            } else {
//                crc <<= 1;
//            }
//        }
//    }
//
//    return crc;
//}
//
//int main(void)
//{
//    char* data = "Hello World!!!";
//    unsigned char poly;
//
//    // x8 + x4 + x3 + x2 + 1 -> 0x1D
//    poly = 0x1D;
//    printf("%02x\n", crc8_lsb(poly, data, strlen(data)));
//    printf("%02x\n", crc8_msb(poly, data, strlen(data)));
//
//    // x8 + x5 + x4 + 1 -> 0x31
//    poly = 0x31;
//    printf("%02x\n", crc8_lsb(poly, data, strlen(data)));
//    printf("%02x\n", crc8_msb(poly, data, strlen(data)));
//
//    return EXIT_SUCCESS;
//}
