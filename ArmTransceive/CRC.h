#ifndef CRC_H_INCLUDED
#define CRC_H_INCLUDED

#include <stdint.h>
#include <stdbool.h>

static void init_crc8();
uint32_t gen_crc8(uint32_t packet);
void crc8(unsigned char *crc, unsigned char m);
bool verify_crc(uint32_t packet);


#endif // CRC_H_INCLUDED
