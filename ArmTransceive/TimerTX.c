/*
 * TimerTX.c
 *
 *  Created on: 2020��2��23��
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

#include "hwDebug.h"
#include "AlinkProtocol.h"


uint16_t t1OFCount =0;


void timer1Init()
{
    /////// Setup Timer1 to be full width perodic timer running at same frequency as bit rate.

    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER1);
    TimerDisable(TIMER1_BASE, TIMER_BOTH);
    TimerConfigure(TIMER1_BASE, TIMER_CFG_PERIODIC);


    TimerLoadSet(TIMER1_BASE, TIMER_A, 120000000 / SampleRate -1);

    TimerControlTrigger(TIMER1_BASE, TIMER_A, true); // Trigger to call ADC.


    TimerIntEnable(TIMER1_BASE, TIMER_TIMA_TIMEOUT);
    TimerEnable(TIMER1_BASE, TIMER_BOTH);

    IntEnable(INT_TIMER1A);


}

// loaded into timer1-A vector
void t1OF_ISR(void)
{

    TIMER1_ICR_R = TIMER_ICR_TATOCINT ; // used to clear interrupt status
//    this line had to happen first. or this interrupt get double triggered.
    t1OFCount+=1;

}
