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

#include "ALinkProtocal.h"


void timer1Init()
{
    /////// Setup Timer1 to be full width perodic timer running at same frequency as bit rate.

    // configure to be full width period timer count down.
    TimerConfigure(TIMER1_BASE , TIMER_CFG_PERIODIC);



}


