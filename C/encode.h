#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h> 
#include <float.h>
#include <string.h>


//Function Definitions
int * message_to_binary(char *input, int input_length);

/*                             Definitions                                       */

//48K samples every second
#define SAMPLE_RATE 48000 

//1000 bits per second, 1 bit every ms.
#define BIT_RATE 1000 

//at 48K samples per second, and 1000 bits per second, that is 48 samples every bit
#define SAMPLES_PER_BIT SAMPLE_RATE / BIT_RATE 

#define FREQUENCY 15000 // 15kHz
#define DUTY 50 //percent