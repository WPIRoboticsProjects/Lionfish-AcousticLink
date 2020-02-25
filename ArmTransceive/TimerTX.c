/*
 * TimerTX.c
 *
 *  Created on: 2020Äê2ÔÂ23ÈÕ
 *      Author: leogr
 */

//TIMER 1 : TX bit modulation


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

#include "ALinkProtocal.h"
#include "hwDebug.h"


void timer1Init()
{
    /////// Setup Timer1 to be full width perodic timer running at same frequency as bit rate.

// should work but didn't
//    TimerDisable(TIMER1_BASE, TIMER_A);
//    // configure to be hald width period timer count down using Timer A .
//    TimerConfigure(TIMER1_BASE , TIMER_CFG_SPLIT_PAIR | TIMER_CFG_A_PERIODIC);
//    TimerLoadSet( TIMER1_BASE, TIMER_A , 24000 ) ; // 24000 for 500Hz, no prescale.
//    TimerIntEnable(TIMER1_BASE, TIMER_TIMA_TIMEOUT); //

    TimerDisable(TIMER4_BASE, TIMER_BOTH);
    TimerConfigure(TIMER4_BASE, TIMER_CFG_PERIODIC); //want TIMER_CFG_PERIODIC ?
    TimerLoadSet(TIMER4_BASE, TIMER_A, (120000000/400000) - 1); // 10 ms interval (timeScale/20)



//    TIMER1_CTL_R = 0;
//
//    TIMER1_CFG_R =0x04 ;// select 32 bit config
//    TIMER1_TAMR_R = 0x01 ; //Set to perodic mode and does not turn on anything
//
//    TIMER1_IMR_R = TIMER_IMR_TATOIM ; // turn on timerA time out interrupt
//
//    TIMER1_TAILR_R = 24000 ; // set upper bound
//
//    TIMER1_CTL_R = TIMER_CTL_TAEN ; // enables timer A



//    TIMER1_ICR_R = TIMER_ICR_TATOCINT ; // used to clear interrupt status
//    TimerEnable(TIMER1_BASE , TIMER_A);

}


// loaded into timer1-A vector
void timer1OverFlowISR()
{
    debugPort ^= 0xff;
    TIMER1_ICR_R = TIMER_ICR_TATOCINT ; // used to clear interrupt status

}

