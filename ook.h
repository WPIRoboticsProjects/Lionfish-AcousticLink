#include <stdio.h>
#include <stdlib.h>
#include <math.h> 
#include <float.h>

//Function Definitions
int * payload_to_bits(int * input, int input_length);
int * message_to_binary(char *input, int input_length);
float * modulate(int * binary, int binary_size);

//Definitions
#define SAMPLE_RATE 48000 //48K samples every second
#define BIT_RATE 1000 //1000 bits per second, 1 bit every ms.
#define SAMPLES_PER_BIT SAMPLE_RATE / BIT_RATE //at 48K samples per second, and 1000 bits per second, that is 48 samples every bit
