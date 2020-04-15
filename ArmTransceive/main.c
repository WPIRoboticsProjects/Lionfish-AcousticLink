/**
 */



//--------------------------        PIN ASSIGNMENT       --------------------------//
/* Port L: PL0:PL3: Hardware Debug Pin
 * Port PF0:PF3 : PWM module 0 generator 0 and 1 // note:PF0 is not available on booster back breakout.
 * Port PK4:PK5 : PWM module 0 generator 3
 * Port E:
 * Port N: PN2: Timer1 fake TX pin
 */

//--------------------------        TIMER ASSIGNMENT     --------------------------//
/* TIMER 1 : TX bit modulation
 * TIMER 4 : ADC trigger timer
 *
 */



/* Port Assigement:
 * Port L : Debug
 * Port PF0:PF3 : PWM
 *
 *
 */

// ��C:\ti\\TivaWare_C_Series2.1.1.71b�� set as ${SW_ROOT} needs to be added to compiler path for headers

// "${SW_ROOT}/driverlib/ccs/Debug/driverlib.lib" Pre Compiled TivaWare libs needs to exist in ARM Linker file search Path


#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <math.h>
#include <float.h>
#include <string.h>
#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "driverlib/udma.h"
#include "driverlib/emac.h"
#include "inc/hw_emac.h"
#include "driverlib/adc.h"
#include "driverlib/timer.h"
#include "inc/tm4c1294ncpdt.h"
#include "inc/hw_memmap.h"

#include <ALinkProtocol.h>
#include "Process_TX.h"
#include "Process_RX.h"
#include "sampling.h"
#include "hwDebug.h"
#include "pwmDriver.h"
#include "TimerTX.h"
#include "CRC.h"

//GLOBALS
uint32_t gSystemClock; // [Hz] system clock frequency
uint32_t gTime = 8345; // time in hundredths of a second

int main(void)
{
    IntMasterDisable();

    // Enable the Floating Point Unit, and permit ISRa`````11qqqqqqqqqqqqqq``ws to use it
    FPUEnable();
    FPULazyStackingEnable();

    // Initialize the system clock to 120 MHz
    gSystemClock = SysCtlClockFreqSet(SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_480, 120000000);

    // Initialize
    init_protocol();
    SamplingInit();
    debugPinsInit();
    TXdebugPinInit();

    pwm1Init();
    pwm3Init();
    timer1Init();


    IntMasterEnable();


    //Test for TX
    while(1)
    {
        send_message(construct_packet(1,0x02));

//        process_adc();

        for(t1OFCount =0 ; t1OFCount < 50;)
        {
        }

        send_message(construct_packet(3,0xFF));

//        process_adc();

        for(t1OFCount =0 ; t1OFCount < 50;)
        {
        }

        send_message(construct_packet(2,0x03));

//        process_adc();

        for(t1OFCount =0 ; t1OFCount < 50;)
        {
        }

        send_message(construct_packet(2,0x01));

        process_adc();

        for(t1OFCount =0 ; t1OFCount < 50;)
        {
        }

        process_adc();

        process_adc();



    }
}
