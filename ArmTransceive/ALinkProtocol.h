/*
 * ALinkProtocal.h
 *
 *  Created on: 2020��2��24��
 *      Author: leogr
 */

#ifndef ALINKPROTOCOL_H_
#define ALINKPROTOCOL_H_

#include <inttypes.h>

#define CarrierFeq 81500 // 81.5Khz TX
#define BitRate 100 // 100 bit per second
#define SampleRate 20000

#define STARTFrameLength 8 // number of bits in start frame
#define IDFrameLength 4 // number of bits in ID frame
#define DATAFrameLength 8 // number of bits in DATA frame
#define CRCFrameLength 8 // number of bits in CRC frame
#define PacketLength (int) (STARTFrameLength+IDFrameLength+DATAFrameLength+CRCFrameLength)

typedef struct{
    uint8_t COMMAND_STATUS;
    uint8_t REQUEST;
    uint8_t SCHEDULER_INFO[14];
} ID;

typedef struct{
    uint8_t ARM;
    uint8_t DISARM;
    uint8_t RECALL;
} COMMAND;

//SCHEDULER
#define SchedulerLength 6
/*
 * SCHEDULER (+ data_buffer):
 *
    1)Last RX Command Status (8 bit ID)
    2)Current Status (AUV):
        -Searching/Navigating
        -Hunting/Targetting
        -Shooting
        -Resetting/Reloading
        -Recalling
    3)INFO Battery (int)
    4)INFO Temperature (int in F or C)
    5)INFO Pressure (units?)
    6)INFO Fish Count (int)
 *
 */

#define StartFrame 0xFA // exact bit sequence for start frame 1111 1010

#endif /* ALINKPROTOCOL_H_ */
