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

#include "hwDebug.h"
#include "pwmDriver.h"

#define BUFFER_SIZE 1024
#define ERROR_EMPTY 0
#define ERROR_FULL 0xFF

//global variables
uint32_t gSystemClock; // [Hz] system clock frequency
char fifo_buffer[BUFFER_SIZE]; //to store message queued to transmit
int fifo_head = 0, fifo_tail = 0, count = 0; //transmit fifo global variables

/**
 * Function: transmit_message
 * Arguments:
 *
 * toggles the PWM pin in accordance with the binary message, transmitting the message
 * **/
void transmit_message()
{

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

    //Main Loop
    while(1)
    {
        volatile  int a;
        a+=1;
    }


    return 0;
}

///////////////////////
/*
 * HELPER FUNCTIONS
 */
///////////////////////

// reads a byte from the buffer and return ERROR_EMPTY if buffer empty
char fifoRead()
{
   if (0 == count) return ERROR_EMPTY;
   count --;
   fifo_tail = (fifo_tail + 1) % BUFFER_SIZE;
   return fifo_buffer[fifo_tail];
}

// writes a byte to the buffer if not ERROR_FULL
char fifoWrite(chat val)
{
   if (BUFFER_SIZE == count) return ERROR_FULL;
   count ++;
   fifo_head = (fifo_head) % BUFFER_SIZE;
   return fifo_buffer[fifo_head];
}
