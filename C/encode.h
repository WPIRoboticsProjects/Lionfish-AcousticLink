//Function Definitions
struct Config read_settings(char* fName);
int * message_to_binary(char *input, int input_length);
float * modulate_binary(int * binary_payload, int bin_payload_size);
int32_t write_modulated_to_csv(char *fName, float *payload , int length);
int32_t write_binary_to_csv(char *fName, int *payload , int length);

//RX Constants
#define SAMPLE_RATE 100000 //samples every second
#define SAMPLE_PERIOD 1/SAMPLE_RATE
#define BIT_RATE 1000 //bits per second
#define SAMPLES_PER_BIT SAMPLE_RATE / BIT_RATE 

//TX Signal Constants
#define FREQUENCY 20000 // OOK Base Frequency
#define PERIOD 1/FREQUENCY
#define DUTY 50 //Duty Cycles