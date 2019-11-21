/*
LIONFISH MQP: ACOUSTIC LINK 

encode.c is a program which represents ASCII text as binary bits. 

to encode a message, change the 'message' variable on line 11

*/
#include "encode.h" // reference for defines, includes, etc.

char message[] = "test"; // string of message
int num_characters = sizeof(message) / sizeof(message[0]); //num charactures

double period = (double) (1 / FREQUENCY);

int main()
{
    int * payload = malloc(num_characters * 8 *  sizeof(int)); //message in binary
    payload = message_to_binary(message, num_characters);
    int payload_size = num_characters * 8; //8 bits per character

    printf("binary message:  ");
    for (int i = 0; i < num_characters * 8; i++)
    {
      printf("%d ", payload[i]);
    }
    printf("\n\n");

    printf("message length= %d\nbinary length= %d\nsignal length= %d\n\n", num_characters, num_characters*8, num_characters*8*SAMPLES_PER_BIT);

    // TO DO: write to text file
    return 0;
}

// Function to convert the char array of the message constant to a integer binary representation
int * message_to_binary(char *input, int input_length)
{
  printf("input message: \n%s\n", input);

  printf("hex message: \n");
  for (int i = 0; i < num_characters; i++)
  {
    printf("%x ", input[i]);
  }
    printf("\n");

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