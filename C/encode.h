//Function Definitions
int * message_to_binary(char *input, int input_length);
float * modulate_binary(int * binary_payload, int bin_payload_size);
double phase_angle(int index);
int32_t write_modulated_to_csv(char *fName, float *payload , int length);
int32_t write_binary_to_csv(char *fName, int *payload , int length);

//RX Constants
#define SAMPLE_RATE 100000 //48K samples every second
#define BIT_RATE 1000 //1000 bits per second, 1 bit every ms.
#define SAMPLES_PER_BIT SAMPLE_RATE / BIT_RATE //at 48K samples per second, and 1000 bits per second, that is 48 samples every bit

//TX Signal Constants
#define FREQUENCY 15000 // OOK Base Frequency
#define DUTY 50 //Duty Cycles