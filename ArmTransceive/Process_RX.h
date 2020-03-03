/*
 * Process_RX.h
 *
 *  Created on: Mar 2, 2020
 *      Author: Nick
 */

#ifndef PROCESS_RX_H_
#define PROCESS_RX_H_
#include "ALinkProtocol.h"
#include "Process_TX.h"

void process_adc();
void process_packet_raw(uint32_t packet);
void adjust_threshold(int avg, int max);

#endif /* PROCESS_RX_H_ */
