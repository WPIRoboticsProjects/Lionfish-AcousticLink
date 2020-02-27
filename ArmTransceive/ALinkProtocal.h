/*
 * ALinkProtocal.h
 *
 *  Created on: 2020��2��24��
 *      Author: leogr
 */

#ifndef ALINKPROTOCAL_H_
#define ALINKPROTOCAL_H_

#define CarrierFeq 81500 // 81.5Khz TX
#define BitRate 100 // 100 bit per second

#define STARTFrameLength 8 // number of bits in start frame
#define IDFrameLength 4 // number of bits in ID frame
#define DATAFrameLength 8 // number of bits in DATA frame
#define CRCFrameLength 2 // number of bits in CRC frame
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
//1) RX Command Status
//2) Prev Command Status
//3) Battery
//4) Temperature
//5) Pressure
//6) Fish Count

//FRAME
#define StartFrame 0xFA // exact bit sequence for start frame 1111 1010


#endif /* ALINKPROTOCAL_H_ */
