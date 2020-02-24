/*
 * ALinkProtocal.h
 *
 *  Created on: 2020Äê2ÔÂ24ÈÕ
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


#endif /* ALINKPROTOCAL_H_ */
