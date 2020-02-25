//CRC-8 CODE

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <inttypes.h>
#include <math.h>
#include <string.h>
#include "crc-8.h"


//returns the packet with generated CRC in LSB
uint32_t generate_packet_crc(uint32_t packet){
    uint8_t buffer[3];
    int i;
    for(i = 0; i < 3; i++){
        uint32_t byte = ((packet & (0xFF << (i*8)) >> (i*8)));
        buffer[i] = (uint8_t) byte;
    }

    uint8_t crc = CRC_CalculateCRC8(buffer, 3);
    uint32_t new_packet = (packet << 8);
    new_packet |= crc;
    return new_packet;
}

//returns true if the packet is CRC error free. returns false if not
bool verify_packet(uint32_t packet){
    uint32_t rem = generate_packet_crc(packet);
    if(rem != 0){
        return false;
    }else{
        return true;
    }
}


//int main(){
//}

