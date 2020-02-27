#ifndef CRC_H_INCLUDED
#define CRC_H_INCLUDED


#include <stdint.h>

#define CRC_8_POLYNOMIAL 0x1Du

uint32_t crc_8(uint32_t packet);
bool check_crc(uint32_t packet);
unsigned char crc8_lsb(unsigned char poly, unsigned char* data, int size);


#endif // CRC_H_INCLUDED
