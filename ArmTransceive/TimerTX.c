/*
 * TimerTX.c
 *
 *  Created on: 2020��2��23��
 *      Author: leogr
 */

//TIMER 1 : TX bit modulation


#include <ALinkProtocol.h>
#include <stdint.h>
#include <stdbool.h>

#include "TimerTX.h"

#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "driverlib/timer.h"
#include "inc/hw_memmap.h"
#include "inc/tm4c1294ncpdt.h"
//#include "inc/hw_ints.h"

#include "hwDebug.h"


volatile int ISRcount ;


void timer1Init()
{
    /////// Setup Timer1 to be full width perodic timer running at same frequency as bit rate.

// should work but didn't
    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER1);
    TimerDisable(TIMER1_BASE, TIMER_BOTH);
    TimerConfigure(TIMER1_BASE, TIMER_CFG_PERIODIC);
    TimerLoadSet(TIMER1_BASE, TIMER_A, 120000);
    TimerIntEnable(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
    TimerEnable(TIMER1_BASE, TIMER_BOTH);

    IntEnable(INT_TIMER1A);

//
//    TIMER1_CTL_R = 0;
//
//    TIMER1_CFG_R =0x04 ;// select 32 bit config
//    TIMER1_TAMR_R = 0x02 ; //Set to perodic mode and does not turn on anything
//
//
//    TIMER1_TAILR_R = 54000 ; // set upper bound
//
//    TIMER1_CTL_R = TIMER_CTL_TAEN ; // enables timer A
//
//
//    TIMER1_IMR_R = TIMER_IMR_TATOIM ; // turn on timerA time out interrupt

//    TIMER1_ICR_R = TIMER_ICR_TATOCINT ; // used to clear interrupt status

}

// loaded into timer1-A vector
void t1OF_ISR(void)
{

    ISRcount += 1;
    debugPort ^= 0xff;
    TIMER1_ICR_R = TIMER_ICR_TATOCINT ; // used to clear interrupt status

}

