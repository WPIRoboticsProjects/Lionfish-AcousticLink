/*
 * Process_TX.h
 *
 *  Created on: Mar 2, 2020
 *      Author: Nick
 */

#ifndef PROCESS_TX_H_
#define PROCESS_TX_H_
#include "ALinkProtocol.h"
#include "Process_RX.h"

void send_message(uint32_t packet);

uint32_t construct_packet(uint8_t packet_id, uint8_t packet_payload);


#endif /* PROCESS_TX_H_ */
