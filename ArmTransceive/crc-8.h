/*
 * crc-8.h
 *
 *  Created on: Feb 25, 2020
 *      Author: Nick
 */

#ifndef CRC_8_H_
#define CRC_8_H_

#include "CRC.h"

bool verify_packet(uint32_t packet);
uint32_t generate_packet_crc(uint32_t packet);


#endif /* CRC_8_H_ */
