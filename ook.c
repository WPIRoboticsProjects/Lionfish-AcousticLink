/*
LIONFISH MQP: ACOUSTIC LINK 

ON OFF Keying (OOK) is a modulation techinique where 0 is represented as no signal, 
and 1 is represented by a signle frequency signal. This file has predefined 
variable as well as functions that perform OOK on these variable and prints the results.
*/
#include "ook.h" // reference for defines, includes, etc.

const int freq = 15000; // 15kHz
const double period = (double) (1 / freq);
const int duty = 50; // percent

char message[] = "this is young leaaaaan coming in\0"; // string of message
int message_size = sizeof(message) / sizeof(message[0]);

int main()
{
    int * payload = malloc(message_size * sizeof(int)); //message in binary
    payload = message_to_binary(message, message_size);
    int payload_size = sizeof(payload) / sizeof(payload[0]);

    // int payload_binary_size = payload_size * 8;
    // int * payload_binary = malloc(payload_binary_size * sizeof(int)); //8 bits max for every int in payload
    // payload_binary = payload_to_bits(payload, payload_binary_size);

    printf("message:  ");
    for (int i = 0; i < message_size; i++)
    {
      printf("%d ", payload[i]);
    }

    printf("\n\nmessage length= %d\nbinary length= %d\nsignal length= %d\n\n", message_size, payload_size, payload_size*SAMPLES_PER_BIT);

    printf("\n\nMODULATED\n");

    //binary representation in the form of an OOK signal
    float * modulated = malloc(payload_size * SAMPLES_PER_BIT * sizeof(float)); 
    modulated = modulate(payload, payload_size);

    // for (int j = 0; j < payload_size * SAMPLES_PER_BIT; j++)
    // {
    //   printf("%f ", modulated[j]);
    // }
    return 0;
}

/*Modulate: 
  -Takes in binary int array of message and converts 
  to array of size = SAMPLES_PER_BIT * LENGTH OF BINARY PAYLOAD

  the output array will be in float for precision, but can change.
*/
float * modulate(int * binary, int binary_size)
{
  int signal_size = binary_size * SAMPLES_PER_BIT;
  float * output = malloc(signal_size * sizeof(float));

  for (int i = 0; i < signal_size; i++)
  {
    int chunk = floor(i%48);

    // printf("i: %d\nchunk: %d\nbinary: %d\n", i, chunk, binary[i]);
  }

  return output;
}

// Function to convert the char array of the message constant to a integer binary representation
int * message_to_binary(char *input, int input_length)
{
  printf("input message: %s\n\n", input);
  int * output = malloc(input_length * sizeof(int));

  for (int i = 0; i < input_length; i++) // loop through input characters
  {
    int dec = (int) input[i]; // decimal ASCII representation
    int remainder, bin = 0, j = 1; // binary rep of the current character

    while(dec != 0){ // convert to binary loop
      remainder = dec % 2; //bit
      dec = dec / 2;
      bin = bin + (remainder*j);
      j *= 10;
    }
    output[i] = bin;
  }
  return output;
}

// Function to convert the int array of the payload to an array of individual bits
/*
    loop through each byte
    start at element 8
    fill from last digit up
    *end at 0*
    advance to +16
    fill from last digit up 
    *end at 8*
*/
// int * payload_to_bits(int * input, int input_length)
// {
//   // printf("input message: %d\n\n", input);
//   int * output = malloc(input_length * sizeof(int));
//   int output_index = 7;

//   for (int i = 0; i < input_length; i++) // loop through input ints
//   {
//     int val = (int) input[i], count = 0;
//     while (val)
//     { 
//       int last_digit = val%10; // last digit of current int

//       // we want to play this last digit in the correct place
//       int digit_index = output_index - count; // count accounts for that
      
//       output[digit_index] = last_digit; // insert into output
//       count++;
//     }

//     while (count <= 7)
//     {
//       int digit_index = output_index - count; // count accounts for that
//       output[digit_index] = 0;
//       count++;
//     }

//     output_index += 8;
//   }
//   return output;
// }