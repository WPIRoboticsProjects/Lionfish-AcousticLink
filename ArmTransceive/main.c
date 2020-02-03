/**
 */

/* Port Assigement:
 * Port L : Debug
 * Port PF0:PF3 : PWM
 *
 *
 */



// ¡°C:\ti\\TivaWare_C_Series2.1.1.71b¡± set as ${SW_ROOT} needs to be added to compiler path for headers

// "${SW_ROOT}/driverlib/ccs/Debug/driverlib.lib" Pre Compiled TivaWare libs needs to exist in ARM Linker file search Path

#include <stdint.h>
#include <stdbool.h>
#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "inc/tm4c1294ncpdt.h"
#include "driverlib/timer.h"
#include "inc/hw_memmap.h"


#include "hwDebug.h"
#include "pwmDriver.h"


//global variables
uint32_t gSystemClock; // [Hz] system clock frequency

int main(void)
{
    IntMasterDisable();

    // Enable the Floating Point Unit, and permit ISRs to use it
    FPUEnable();
    FPULazyStackingEnable();

    // Initialize the system clock to 120 MHz
    gSystemClock = SysCtlClockFreqSet(SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_480, 120000000);

    debugPinsInit();


    IntMasterEnable();
    pwmInit();

    while(1)
    {
       volatile  int a;
       a+=1;
    }


	return 0;
}
