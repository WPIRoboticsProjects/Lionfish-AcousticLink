//CRC-8 CODE

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <inttypes.h>
#include <math.h>
#include <string.h>
#include "CRC.h"


//returns the packet with generated CRC in LSB
uint32_t generate_packet_crc(uint32_t packet){
    uint8_t * buffer[4];
    int i;
    for(i = 0; i < 3; i++){
        buffer[i] = (uint8_t) ((packet & (0xFF << (i*8)) >> (i*8)));
    }

    uint8_t crc = CRC_CalculateCRC8(buffer, (uint8_t) 4);
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
        return false;
    }
}


int main(){
    int packet = 0x88EECE;
    int crc_packet = generate_packet_crc(packet);

    printf("packet: %04x\ncrc_packet: %04x\n", packet, crc_packet);

    if (verify_packet(crc_packet)){
        printf("TRUE!\n");
    }else{
        printf("FALSE!\n");
    }

}

