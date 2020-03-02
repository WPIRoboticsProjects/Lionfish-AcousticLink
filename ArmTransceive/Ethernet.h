/*
 * Ethernet.h
 *
 *  Created on: Mar 2, 2020
 *      Author: Nick
 */

#ifndef ETHERNET_H_
#define ETHERNET_H_

void EthernetInit();
void IntHandler_Rec(void);
void IntHandler_Trans(void){

#endif /* ETHERNET_H_ */

/*
 * The Ethernet MAC driver API consists of 9 groups of functions:
 *
 *
 *
Initialization and configuration of the MAC and PHY are controlled using
     EMACInit(),
     EMACReset(),
     EMACPHYConfigSet(),
     EMACConfigSet(),
     EMACConfigGet(),
     EMACAddrSet(),
     EMACAddrGet() and
     EMACNumAddrGet().


Packet filtering options are set and queried using
    EMACFrameFilterSet(),
    EMACFrameFilterGet(),
    EMACHashFilterSet(),
    EMACHashFilterGet(),
    EMACHashFilterBitCalculate(),
    EMACAddrFilterSet() and
    EMACAddrFilterGet().


Transmit and receive DMA descriptors are managed using
    EMACTxDMAPollDemand(),
    EMACRxDMAPollDemand(),
    EMACRxDMADescriptorListSet(),
    EMACRxDMADescriptorListGet(),
    EMACRxDMACurrentDescriptorGet(),
    EMACRxDMACurrentBufferGet(),
    EMACTxDMADescriptorListSet(),
    EMACTxDMADescriptorListGet(),
    EMACTxDMACurrentDescriptorGet() and
    EMACTxDMACurrentBufferGet().


Overall control of the transmitter and receiver are handled using
    EMACRxWatchdogTimerSet(),
    EMACStatusGet(),
    EMACDMAStateGet(),
    EMACTxFlush(),
    EMACTxEnable(),
    EMACTxDisable(),
    EMACRxEnable() and
    EMACRxDisable().


Interrupt management is controlled using
    EMACIntEnable(),
    EMACIntDisable(),
    EMACIntStatus(),
    EMACIntClear(),
    EMACIntRegister() and
    EMACIntUnregister().


The PHY, either internal or external, is controlled using
    EMACPHYWrite(),
    EMACPHYExtendedWrite(),
    EMACPHYRead(),
    EMACPHYExtendedRead(),
    EMACPHYPowerOff() and
    EMACPHYPowerOn().


IEEE1588, Precision Time Protocol timestamping, the integrated PTPD clock and the PPS output signal are controlled using
    EMACTimestampConfigSet(),
    EMACTimestampConfigGet(),
    EMACTimestampAddendSet(),
    EMACTimestampEnable(),
    EMACTimestampDisable(),
    EMACTimestampSysTimeSet(),
    EMACTimestampSysTimeGet(),
    EMACTimestampSysTimeUpdate(),
    EMACTimestampTargetSet(),
    EMACTimestampTargetIntEnable(),
    EMACTimestampTargetIntDisable(),
    EMACTimestampIntStatus(),
    EMACTimestampPPSSimpleModeSet(),
    EMACTimestampPPSCommandModeSet(),
    EMACTimestampPPSCommand() and
    EMACTimestampPPSPeriodSet().


Control of 802.1Q VLAN packet tagging is handled using
    EMACVLANRxConfigSet(),
    EMACVLANRxConfigGet(),
    EMACVLANTxConfigSet(),
    EMACVLANTxConfigGet(),
    EMACVLANHashFilterBitCalculate(),
    EMACVLANHashFilterSet() and
    EMACVLANHashFilterGet().


Handling of remote wakeup packets and power management options are controlled using
    EMACRemoteWakeUpFrameFilterSet(),
    EMACRemoteWakeUpFrameFilterGet(),
    EMACPowerManagementControlSet(),
    EMACPowerManagementControlGet() and
    EMACPowerManagementStatusGet().
 *
 *
 *
 */
