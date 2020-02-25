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

#define IDFrameLength 8 // number of bits in ID frame
#define DATAFrameLength 8 // number of bits in DATA frame
#define CRCFrameLength 2 // number of bits in CRC section
#define StartFrame 0xFA // exact bit sequence for start frame 1111 1010

#define SchedulerLength 4 //4 different log values; Battery/Status/Temperature/Fish Count
//  SCHEDULER
//      1) Battery Level (integer number)
//      2) AUV Status (Searching-00, Targetting-01, Shot-02, Reloading-03, Recalling-04)
//      3) Temperature (integer number in C)
//      4) Fish Count (integer number)


#endif /* ALINKPROTOCAL_H_ */
