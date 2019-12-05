/*
LIONFISH MQP: ACOUSTIC LINK 

encode.c is a program which represents ASCII text as binary bits. 

to encode a message, change the 'message' variable on line 11

*/
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <math.h> 
#include <float.h>
#include <string.h>
#include "encode.h" // reference for defines, includes, etc.

char message[] = "test"; // string of message
int num_characters = sizeof(message) / sizeof(message[0]); //num charactures

double period = (double) (1 / FREQUENCY);

int main()
{
    int payload_size = num_characters * 8; //8 bits per character
    int mod_payload_size = payload_size * (int) SAMPLES_PER_BIT; //total samples = num_samples_per_bit * num_payload_bits

    printf("message length:%d\n", num_characters);
    printf("binary length:%d\n", payload_size);
    printf("signal length:%d\n", mod_payload_size);

    int * payload = malloc(payload_size *  sizeof(int)); //message in binary
    float * modulated = malloc(mod_payload_size * sizeof(float));

    payload = message_to_binary(message, num_characters);
    modulated = modulate_binary(payload, payload_size);

    printf("\nbinary message\n");
    for (int i = 0; i < payload_size; i++)
    {
      printf("%d ", payload[i]);
      if((i+1)%8 == 0)
      {
        printf("\n");
      }
    }
    printf("\n");

    char mod_file_name[] = "modulated_binary.csv";
    write_modulated_to_csv(mod_file_name, modulated, mod_payload_size);

    return 0;
}

/**
 * convert the char array of the message constant to a integer binary representation 
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
 * Convert the binary int array into a float array of samples to be transmitted 
 * **/
float * modulate_binary(int * binary_payload, int bin_payload_size)
{
  float * ans = malloc(bin_payload_size * (int) SAMPLES_PER_BIT * sizeof(float));
  int i, j = 0;
  int head = 0; //start index
  int tail = (int) SAMPLES_PER_BIT; //end index
  printf("size: %d\n", bin_payload_size);

  for(i = 0; i < bin_payload_size; i++) //loop through payload array
  {
    // printf("bit: %d, head: %d, tail %d, \n", binary_payload[i], head, tail);
    if(binary_payload[i] == 0) // 0 bit
    {
      for(j = head; j < tail; j++)
      {
        ans[j] = (float) 0;
      }
    }
    else if(binary_payload[i] == 1) // 1 bit
    {
      for(j = head; j < tail; j++)
      {
        ans[j] = (float) sin((double) (2 * M_PI * FREQUENCY + phase_angle((i*(int)SAMPLES_PER_BIT)+j)));
      }
    }
    head = head + (int) SAMPLES_PER_BIT + 1; //bring head to next slot after tail
    tail = tail + (int) SAMPLES_PER_BIT + 1; //bring tail to next slot afer
  }
  return ans;
}

/**
 * HELPER FUNCTION
 * returns the phase angle of the sine function 
 * **/
double phase_angle(int index)
{
  int degrees = index % 360;
  return (double) (degrees * M_PI) / 180;  
}

/**
 * write the content in filteredSamples into csv 
 * param: fName, name of the file to write to, length: length of the sample. 
 * return -1 if file open failed. 
 * **/
int32_t write_binary_to_csv(char *fName, int *payload , int length)
{
	FILE *fp;
	fp = fopen(fName,"w+");
	if (fp == NULL)
	{
		printf("%s file doesn't exist", fName);
		return -1;
	}

	for(int i=0;i<length;++i)
	{
    if(i != (length-1)) 
    {
      fprintf(fp , "%d,", payload[i]);
    }	
    if((i+1)%8 == 0)
    {
      fprintf(fp , "\n");
    }
	}
	fclose(fp);
	return 0;

}

/**
 * write the content in filteredSamples into csv 
 * param: fName, name of the file to write to, length: length of the sample. 
 * return -1 if file open failed. 
 * **/
int32_t write_modulated_to_csv(char *fName, float *payload , int length)
{
	FILE *fp;
	fp = fopen(fName,"w+");
	if (fp == NULL)
	{
		printf("%s file doesn't exist", fName);
		return -1;
	}

	for(int i=0;i<length-1;++i)
	{
    if(i != (length-1)) 
    {
      fprintf(fp , "%f,%f\n", (float) ( ((double) i)/SAMPLE_RATE ), payload[i]);
    }	
	}
  fprintf(fp , "%f,%f\n", (float) ( ((double) length-1)/SAMPLE_RATE ), payload[length-1]);
	fclose(fp);
	return 0;

}