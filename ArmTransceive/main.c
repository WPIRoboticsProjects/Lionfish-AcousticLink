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

//PROTOTYPES
void delayMS(int ms);
int * message_to_binary(char *input, int input_length);

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
        send_message(construct_packet(3,0xAA));
        for(t1OFCount =0 ; t1OFCount < 40;)
        {
        }

        pwmOutputEnable();

        for(t1OFCount =0 ; t1OFCount < 1;)
        {
        }
        pwmOutputDisable();

        for(t1OFCount =0 ; t1OFCount < 40;)
        {
        }


        send_message(construct_packet(10,0b00111001));
        for(t1OFCount =0 ; t1OFCount < 40;)
        {
        }

        pwmOutputEnable();

        for(t1OFCount =0 ; t1OFCount < 1;)
        {
        }
        pwmOutputDisable();

        for(t1OFCount =0 ; t1OFCount < 40;)
        {
        }

    }




    //Test for CRC
    uint32_t test_rx = 0x881E500;
    uint32_t crc_test = crc_8(test_rx);
    bool test_check = check_crc(crc_test);

    //Main Loop
    while(1)
    {
        process_adc();

    }
}

//used to delay processes (uneeded?)
void delayMS(int ms) {
    SysCtlDelay( (SysCtlClockGet()/(3*1000))*ms ) ;
}

//converts char message from user into binary
int * message_to_binary(char *input, int input_length) //TODO: FIX FOR uINT32_t
{
    int * output = malloc(input_length * 8 * sizeof(int));
    int output_index = 0;

    int i;
    for (i = 0; i < input_length; i++) // loop through input characters
    {
        int dec = (int) input[i]; // decimal ASCII representation
        int remainder, j = 1; // binary rep of the current character
        int temp_byte[8] = {0,0,0,0,0,0,0,0};
        int temp_index = 7;

        while(dec != 0){ // convert to binary loop
            remainder = dec % 2; //LSB
            temp_byte[temp_index] = remainder; temp_index--; //temp store bit (reversed)
            dec = dec / 2; j *= 10; //iterate
        }

        int k;
        for(k = 0; k < 8; k++){
            output[output_index] = temp_byte[j]; //store in correct order
            output_index++;
        }
    }
    return output;
}
