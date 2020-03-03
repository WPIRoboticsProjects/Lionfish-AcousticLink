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


#define SamplesPerBit 10;

extern const uint16_t SampleRate ;

#define SchedulerTimeIn 60 //send scheduler information after 60 seconds no RX/TX

#define STARTFrameLength 8 // number of bits in start frame
#define IDFrameLength 4 // number of bits in ID frame
#define DATAFrameLength 8 // number of bits in DATA frame
#define CRCFrameLength 8 // number of bits in CRC frame
#define PacketLength (int) (STARTFrameLength+IDFrameLength+DATAFrameLength+CRCFrameLength)

typedef struct ID{
    uint8_t ACK;
    uint8_t COMMAND_STATUS;
    uint8_t REQUEST;
    uint8_t * SCHEDULER_INFO[14];
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

#define CRC_MASK     ((1 << (CRCFrameLength+1)) - 1)
#define PAYLOAD_MASK (((1 << (DATAFrameLength+1)) - 1) << CRCFrameLength)
#define ID_MASK      ((1 << (IDFrameLength+1)) - 1) << (DATAFrameLength+CRCFrameLength)

void init_protocol();
static void init_keys(ID * id_key, COMMAND * command_key);
uint32_t get_data_buffer(uint32_t index);
void set_data_buffer(uint32_t data, uint32_t index);
void or_data_buffer(uint32_t data, uint32_t index);
COMMAND * get_commands();
ID * get_ids();

#endif /* ALINKPROTOCOL_H_ */
