/**
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
#include <stdbool.h>
#include <math.h>
#include <float.h>
#include <string.h>
#include "driverlib/fpu.h"
#include "driverlib/sysctl.h"
#include "driverlib/interrupt.h"
#include "driverlib/gpio.h"
#include "inc/tm4c1294ncpdt.h"
#include "driverlib/timer.h"
#include "inc/hw_memmap.h"
#include "buttons.h"
#include "sampling.h"

#include "hwDebug.h"
#include "pwmDriver.h"


#define TX_FREQ 80000 //80Khz TX
#define SAMPLE_RATE 10000 //10Khz Sample Rate
#define BIT_RATE 8 //8 bits per second

#define VIN_RANGE 3.3 // 3.3 V on board
#define ADC_BITS 12 // 12 bit ADC

#define START_BITS 0xAA //start bits 10101010
#define END_BITS 0x55 //end bits 01010101

//Global Variables
uint32_t gSystemClock; // [Hz] system clock frequency
uint32_t gTime = 8345; // time in hundredths of a second
int samples_per_bit = (int) SAMPLE_RATE / BIT_RATE;

//CPU load counters
volatile uint32_t count_unloaded = 0;
volatile uint32_t count_loaded = 0;
float cpu_load = 0.0;

int main(void)
{
    IntMasterDisable();

    // Enable the Floating Point Unit, and permit ISRs to use it
    FPUEnable();
    FPULazyStackingEnable();

    // Initialize the system clock to 120 MHz
    gSystemClock = SysCtlClockFreqSet(SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_480, 120000000);

    // Initialize ADC and Buttons
    ButtonInit();
    SamplingInit();

    pwmInit();
    debugPinsInit();

    ////////////////////////////////////////////////////////////////////////////
    //code for keeping track of CPU load
    //initialize timer 3 in one-shot mode for polled timing
    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER3);
    TimerDisable(TIMER3_BASE, TIMER_BOTH);
    TimerConfigure(TIMER3_BASE, TIMER_CFG_ONE_SHOT);
    TimerLoadSet(TIMER3_BASE, TIMER_A, gSystemClock/100);

    count_unloaded = cpu_load_count(); //poll before int enable

    IntMasterEnable();

    //self-measured *TO DO: adjust if needed for transducer inputs, used to reduce noise
    int ADC_OFFSET = 515;

    uint8_t localBuffer[BUFFER_SIZE]; //local buffer of 8 bits

    //Main Loop
    while(1)
    {

        //Copy BUFFER_SIZE elements to local buffer
        for(int i = 0; i < ADC_BUFFER_SIZE; i++){
            if(gADCBuffer[i] < ADC_OFFSET){
                localBuffer[i] = 0;
            }else if(gADCBuffer[i] >= ADC_OFFSET){
                localBuffer[i] = 1;
            }
        }

        //



        //get buttons state from FIFO
//        char buttons;
//        int buttons_state; //backup
//
//        if (fifo_get(&buttons)){
//            buttons_state = buttons;
//        }else{
//            buttons = ' ';
//        }

        //handle button presses
        //      pause


        //CPU LOAD
        int str_load = (int) (cpu_load*100000.0);
//      snprintf(str, sizeof(str), "CPU Load = 0.%d", str_load); // convert time to string


        count_loaded = cpu_load_count();
        cpu_load = 1.0f - (float)count_loaded/count_unloaded; // compute CPU load
    }
    return 0;
}

/**
 * Function: message_to_binary
 * Arguments:
 *      -char *input: pointer to array of message characters
 *      -int input_length: size of the char array
 *
 * Returns: a integer array of the characters message in binary
 * **/
int * message_to_binary(char *input, int input_length)
{
    int * output = malloc(input_length * 8 * sizeof(int));
    int output_index = 0;

    for (int i = 0; i < input_length; i++) // loop through input characters
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

        for(int i = 0; i < 8; i++){
            output[output_index] = temp_byte[i]; //store in correct order
            output_index++;
        }
    }
    return output;
}

/**
 * Function: binary_to_message
 * Arguments:
 *      -int * binary: pointer to array of binary
 *      -int bin_length: size of the binary array
 *
 * Returns: the char array representation of the binary in ASCII
 * **/
char * binary_to_message(int * binary, int bin_length)
{

}

// FROM INT_LATENCY Example Code
uint32_t cpu_load_count(void)
{
    uint32_t i = 0;
    TimerIntClear(TIMER3_BASE, TIMER_TIMA_TIMEOUT);
    TimerEnable(TIMER3_BASE, TIMER_A); // start one-shot timer
    while (!(TimerIntStatus(TIMER3_BASE, false) & TIMER_TIMA_TIMEOUT))
        i++;
    return i;
}
