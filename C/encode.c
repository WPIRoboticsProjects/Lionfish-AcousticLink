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
    int payload_size = num_characters * 8; //8 bits per character
    int * payload = malloc(payload_size *  sizeof(int)); //message in binary
    payload = message_to_binary(message, num_characters);
    
    printf("binary message:  ");
    for (int i = 0; i < payload_size; i++)
    {
      printf("%d ", payload[i]);
      if((i+1)%8 == 0)
      {
        printf("\n");
      }
    }
    printf("\n");

    char binary_file_name[] = "encoded_binary.csv";
    int bin_file_res = write_binary_to_csv(binary_file_name, payload, payload_size);
    printf("%d\n", bin_file_res);

    int mod_payload_size = payload_size * (int) SAMPLES_PER_BIT;
    float * modulated_payload = malloc(mod_payload_size * sizeof(float));
    modulated_payload = modulate_binary(payload, payload_size);

    printf("modulated message:  ");
    for (int i = 0; i < mod_payload_size; i++)
    {
      printf("%f\n", modulated_payload[i]);
    }
    printf("\n");

    char mod_file_name[] = "modulated_binary.csv";
    int mod_file_res = write_modulated_to_csv(mod_file_name, modulated_payload, mod_payload_size);
    printf("%d\n", mod_file_res);

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
float * modulate_binary(int *payload, int payload_size)
{
  float * ans = malloc(payload_size * sizeof(float));
  int bool_ook = 0; // Start in off (no transmit)
  int head = 0; //start index
  int tail = head + (int) SAMPLES_PER_BIT; //end index

  for(int i = 0; i < payload_size; i++) //loop through payload array
  {
    printf("head: %d, tail %d\n", head, tail);
    if(payload[i] == 0) // 0 bit
    {
      for(int j = head; j < tail; j++)
      {
        ans[j] = (float) 0;
      }
      head += (int) SAMPLES_PER_BIT;
      tail += (int) SAMPLES_PER_BIT;
    }
    else if(payload[i] == 1) // 1 bit
    {
      for(int j = head; j < tail; j++)
      {
        ans[j] = (float) sin(2 * M_PI * (int) ((j%SAMPLES_PER_BIT) / SAMPLES_PER_BIT));
      }
      head += (int) SAMPLES_PER_BIT;
      tail += (int) SAMPLES_PER_BIT;
    }
  }
  return ans;
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
int32_t write_modulated_to_csv(char *fName, int *payload , int length)
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
    if((i+1)%10 == 0)
    {
      fprintf(fp , "\n");
    }
	}
	fclose(fp);
	return 0;

}