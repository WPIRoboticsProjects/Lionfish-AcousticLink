/*
 * hwDebug.c
 *
 *  Created on: 2019Äê3ÔÂ21ÈÕ
 *      Author: Leo
 */

#include <stdint.h>
#include <stdbool.h>
#include "hwDebug.h"
#include "inc/tm4c1294ncpdt.h"
#include "driverlib/gpio.h"
#include "driverlib/sysctl.h"
#include "inc/hw_memmap.h"


//setup PL0-PL3 as GPIO output for debugging.
void debugPinsInit()
{
    // Pin PC7 will be used to pulse output for external debug.
    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOL);
    GPIOPinTypeGPIOOutput(GPIO_PORTL_BASE, GPIO_PIN_0 | GPIO_PIN_1 |GPIO_PIN_2 | GPIO_PIN_3 ); // PL0 - PL3

    // use these lines to write to the pin
    GPIO_PORTL_DATA_R = 0xff;
    GPIO_PORTL_DATA_R = 0;

    *( GPIO_PORTL_DATA_BITS_R + GPIO_PIN_0 ) = 1 ;
    *( GPIO_PORTL_DATA_BITS_R + GPIO_PIN_0 ) = 0 ;

    debugPin0 = 1;
    debugPin0 = 0;


}



