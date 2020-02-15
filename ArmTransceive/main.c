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
#include <stdlib.h>
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
uint8_t localBuffer[ADC_BUFFER_SIZE]; //local buffer of 8 bits

//CPU load counters
volatile uint32_t count_unloaded = 0;
volatile uint32_t count_loaded = 0;
float cpu_load = 0.0;

//Function Definitions
char * binary_to_message(int * binary, int bin_length);
int * message_to_binary(char *input, int input_length);
uint32_t cpu_load_count(void);


int main(void)
{
    IntMasterDisable();

    // Enable the Floating Point Unit, and permit ISRs to use it
    FPUEnable();
    FPULazyStackingEnable();

    // Initialize the system clock to 120 MHz
    gSystemClock = SysCtlClockFreqSet(SYSCTL_XTAL_25MHZ | SYSCTL_OSC_MAIN | SYSCTL_USE_PLL | SYSCTL_CFG_VCO_480, 120000000);

    // Initialize ADC and Buttons
    SamplingInit();

    debugPinsInit();

    IntMasterEnable();

    pwm1Init();
    pwm3Init();

    //self-measured *TO DO: adjust if needed for transducer inputs, used to reduce noise
    int ADC_OFFSET = 515;

    //Main Loop
    while(1)
    {

        //Copy BUFFER_SIZE elements to local buffer
        int i;
        for(i = 0; i < ADC_BUFFER_SIZE; i++){
            if(gADCBuffer[i] < ADC_OFFSET){
                localBuffer[i] = 0;
            }else if(gADCBuffer[i] >= ADC_OFFSET){
                localBuffer[i] = 1;
            }
        }

    }
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

    return NULL;
}
