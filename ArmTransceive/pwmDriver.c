/*
 * pwmDriver.c
 *
 *  Created on: 2020Äê2ÔÂ3ÈÕ
 *      Author: leogr
 */

#include <stdint.h>
#include <stdbool.h>

#include "pwmDriver.h"


#include <stdint.h>
#include <stdbool.h>
#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "driverlib/pwm.h"
#include "inc/tm4c1294ncpdt.h"
#include "driverlib/timer.h"
#include "inc/hw_memmap.h"

#include "hwDebug.h"

// (120Mhz/2) / (200Khz) = 300
// (120Mhz/2) / (80Khz) = 750
uint16_t tickPeriod = 735;

// Setup PF0:PF3 for pwm output
void pwm1Init()
{
    debugPin0 =1;
    debugPin0 =0;
    debugPin0 =1;


    pwmPinInit();

    //    Enable PWM Module
    SysCtlPeripheralEnable(SYSCTL_PERIPH_PWM0); //    SYSCTL_RCGCPWM_R = (SYSCTL_RCGCPWM_R0);

    // 1/(200Mhz) = 5us
    // Counts = (source feq)/(target feq) ==> (120Mhz/2) / (200Khz) = 300;
    // Prescaler of 2
    PWMClockSet( PWM0_BASE ,  PWM_SYSCLK_DIV_2);

    // PWM0 generator Control
    // mode 0 for down mode , Enable =1 turn on the module
//    PWMGenConfigure(PWM0_BASE , PWM_GEN_0 , PWM_GEN_MODE_DOWN );
    PWM0_1_CTL_R =0 ;


    // A for high during first have, B for high during second half.
    // COMPA LOAD pwmA high, COMPA down, pwmA LOW
    // COMPA Zero pwmB LOW, COMPA down, pwmB HIGH
    PWM0_1_GENA_R = PWM_1_GENA_ACTLOAD_ONE | PWM_1_GENA_ACTCMPAD_ZERO;
    PWM0_1_GENB_R = PWM_1_GENB_ACTZERO_ZERO | PWM_1_GENB_ACTCMPAD_ONE;

    //Sets the period (the function will half the ticks for up-down mode)
    PWM0_1_LOAD_R = tickPeriod ;

    //Sets the Comp number as 50% duty
    PWM0_1_CMPA_R = tickPeriod/2 ;

    // Start the timers in PWM0
    PWM0_CTL_R |= 1;

    // enables the generator
    PWMGenEnable( PWM0_BASE , PWM_GEN_1 ); //     PWM0_1_CTL_R |= 1;

//    turn on the output pins
    pwmOutputEnable();

    debugPin0 =0;
    debugPin0 =1;
}


void pwm3Init()
{
    debugPin0 =1;
    debugPin0 =0;
    debugPin0 =1;


    pwmPinInit();

    //    Enable PWM Module
    SysCtlPeripheralEnable(SYSCTL_PERIPH_PWM0); //    SYSCTL_RCGCPWM_R = (SYSCTL_RCGCPWM_R0);

    // 1/(200Mhz) = 5us
    // Counts = (source feq)/(target feq) ==> (120Mhz/2) / (200Khz) = 300;
    // Prescaler of 2
    PWMClockSet( PWM0_BASE ,  PWM_SYSCLK_DIV_2);

    // PWM0 generator Control
    // mode 0 for down mode , Enable =1 turn on the module
//    PWMGenConfigure(PWM0_BASE , PWM_GEN_0 , PWM_GEN_MODE_DOWN );
    PWM0_3_CTL_R =0 ;


    // A for high during first have, B for high during second half.
    // COMPA LOAD pwmA high, COMPA down, pwmA LOW
    // COMPA Zero pwmB LOW, COMPA down, pwmB HIGH
    PWM0_3_GENA_R = PWM_3_GENA_ACTLOAD_ONE | PWM_3_GENA_ACTCMPAD_ZERO;
    PWM0_3_GENB_R = PWM_3_GENB_ACTZERO_ZERO | PWM_3_GENB_ACTCMPAD_ONE;

    //Sets the period (the function will half the ticks for up-down mode)
    PWM0_3_LOAD_R = tickPeriod ;

    //Sets the Comp number as 50% duty
    PWM0_3_CMPA_R = tickPeriod/2 ;

    // Start the timers in PWM0
    PWM0_CTL_R |= 1;

    // enables the generator
    PWMGenEnable( PWM0_BASE , PWM_GEN_3 ); //     PWM0_1_CTL_R |= 1;

//    turn on the output pins
    pwmOutputEnable();

    debugPin0 =0;
    debugPin0 =1;
}


void pwmPinInit()
{
    // Enable pin and
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOF);
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOK);

//    set Port PF0:PF3 for PWM (alt function, PMC in GPIOPCTL for PWM function
    GPIOPinTypePWM(GPIO_PORTF_BASE , GPIO_PIN_0 | GPIO_PIN_1 |GPIO_PIN_2 | GPIO_PIN_3); // GPIO_PCTL might needs to be set for each pin to be 6 (for pwm)
    GPIOPinTypePWM(GPIO_PORTK_BASE , GPIO_PIN_4 | GPIO_PIN_5); // GPIO


    GPIO_PORTF_AHB_PCTL_R = 0b0110011001100110 ; // set the PMC0:3 all to 6
    GPIO_PORTK_PCTL_R = 0b01100110 << 16 ; // set PMC5 &4 to 6

    // set for higher drive strength
    GPIOPadConfigSet(GPIO_PORTF_BASE , GPIO_PIN_0 | GPIO_PIN_1 |GPIO_PIN_2 | GPIO_PIN_3 , GPIO_STRENGTH_8MA , GPIO_PIN_TYPE_STD);
}

void pwmOutputEnable()
{

    PWM0_ENABLE_R = PWM_ENABLE_PWM0EN | PWM_ENABLE_PWM1EN | PWM_ENABLE_PWM2EN | PWM_ENABLE_PWM3EN  | PWM_ENABLE_PWM6EN |PWM_ENABLE_PWM7EN; // opens up the pair of output pins
}

void pwmOutputDisable()
{
    PWM0_ENABLE_R =0;
}

