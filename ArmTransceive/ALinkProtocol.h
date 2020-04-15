/*
 * ALinkProtocal.h
 *
 *  Created on: 2020��2��24��
 *      Author: leogr
 */

#ifndef ALINKPROTOCOL_H_
#define ALINKPROTOCOL_H_

#include <inttypes.h>
#include <stdint.h>

#define CarrierFeq 81500 // 81.5Khz TX
#define BitRate 100 // 100 bit per second
#define SamplesPerBit 10 // 10 sample per bit.
#define SamplePerBreak 0 // 5 sample break period between bits.

extern const uint16_t SampleRate;

#define STARTFrameLength 8 // number of bits in start frame
#define IDFrameLength 4 // number of bits in ID frame
#define DATAFrameLength 8 // number of bits in DATA frame
#define CRCFrameLength 8 // number of bits in CRC frame
extern const uint16_t PacketLength;

typedef struct ID{
    uint8_t ACK;
    uint8_t COMMAND_STATUS;
    uint8_t REQUEST;
    uint8_t SCHEDULER_INFO[14];
} ID;

typedef struct COMMAND{
    uint8_t ARM;
    uint8_t DISARM;
    uint8_t RECALL;
} COMMAND;

ID id;
COMMAND command;

//SCHEDULER
#define SchedulerLength 6
/*
 * DATA BUFFER ORDER: BASED ON ID
 *
    0: LAST SUCESSFUL ID SENT
    1: CURRENT COMMAND STATUS
    2: LAST REQUESTED ID RECIEVED
    3: INFO 1: BATTERY
    4: INFO 2: TEMPERATURE
    5: INFO 3: PRESSURE
    6: INFO 4: FISH COUNT
 *
 */

#define StartFrame 0xFA // exact bit sequence for start frame 1111 1010

#define CRC_MASK                   0b11111111
#define PAYLOAD_MASK       0b1111111100000000
#define ID_MASK        0b11110000000000000000

void init_protocol();
static void init_keys(ID * id_key, COMMAND * command_key);
uint32_t get_data_buffer(uint32_t index);
void set_data_buffer(uint32_t data, uint32_t index);
void or_data_buffer(uint32_t data, uint32_t index);
COMMAND * get_commands();
ID * get_ids();

#endif /* ALINKPROTOCOL_H_ */
