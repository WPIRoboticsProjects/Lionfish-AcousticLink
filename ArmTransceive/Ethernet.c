/*
 * Ethernet.c
 *
 *  Created on: Mar 2, 2020
 *      Author: Nick
 */

#include <ALinkProtocol.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <float.h>
#include <string.h>
#include "driverlib/emac.h"
#include "inc/hw_emac.h"

//mac ADDR's
uint32_t MAC_JETSON, MAC_AUV;

//BASE = EMAC0_BASE;

//config defines
uint32_t max_frame_size;
uint32_t sys_clk, bus_conf;
uint32_t rx_burst, tx_burst;
uint32_t desc_skip_size;

void EthernetInit(){

//    // Enable and reset the MAC.
//    SysCtlPeripheralEnable(SYSCTL_PERIPH_EMAC0);
//    SysCtlPeripheralReset(SYSCTL_PERIPH_EMAC0);
//
//    if(<using internal PHY>)
//    {
//    // Enable and reset the internal PHY.
//    SysCtlPeripheralEnable(SYSCTL_PERIPH_EPHY0);
//    SysCtlPeripheralReset(SYSCTL_PERIPH_EPHY0);
//    }
//
//    // Ensure the MAC is completed its reset.
//    while(!MAP_SysCtlPeripheralReady(SYSCTL_PERIPH_EMAC0))
//    {
//    }
//
//    // Set the PHY type and configuration options.
//    EMACPHYConfigSet(EMAC0_BASE, <config>);
//
//    // Initialize and configure the MAC.
//    EMACInit(EMAC0_BASE, <system clock rate>, <bus config>,
//    <Rx burst size>, <Tx burst size>, <desc skip>);
//
//    EMACConfigSet(EMAC0_BASE, <parameters>);


    //All things for Initing Comm. over Ethernet to Jetson

//    EMACIntDisable(); //disable intterupts
//    EMACIntRegister(); //register handler for rec / transmitting
//
//    //set address of ethernet
//    EMACAddrSet(base, );
//
//    //configure phy
//    EMACPHYConfigSet(base, );
//
//    //configure
//    EMACConfigSet(base,
//                 (EMAC_CONFIG_USE_MACADDR0| //use addr 0
//                            EMAC_CONFIG_IF_GAP_40BITS| //gap of 40 bits between frames
//                            EMAC_CONFIG_3BYTE_PREAMBLE| //3 byte preamble b4 all tx
//                            EMAC_CONFIG_BO_LIMIT_256| //256 random limit delay for resend
//                            EMAC_CONFIG_SA_INSERT| //insert source addr
//                            EMAC_CONFIG_STRIP_CRC),//strip CRC before forwarding
//                 (EMAC_MODE_TX_STORE_FORWARD|//wait for full tx before sending
//                            EMAC_MODE_RX_STORE_FORWARD),//wait for full rx before recieving
//                 max_frame_size);
//
//    //filter frames
//    EMACFrameFilterSet();
//
//    //filter addresses for just JETSON
//    EMACAddrFilterSet();
//
//    //initialize + enable
//    EMACInit();
//    EMACIntEnable();
}


// ISR to handle transmitting
void IntHandler_Trans(void){
//    EMACIntClear();//clear flag

    //set payload of outgoing message

    //send to correct MAC address

}

// ISR to handle recieving
void IntHandler_Rec(void){
//    EMACIntClear();//clear flag

    //recieve payload from Jetson

    //store in correct element of data_buffer

}
