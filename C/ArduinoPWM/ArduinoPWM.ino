#include <avr/io.h>
#include <avr/interrupt.h>
#include "PWMGener.h"
#include "hwDebug.h"

void pwmPinSetup();


void setup() {

  pwmPinSetup();
  timer1Setup();
  timer3Setup();
  DDRL =0xff;
  HWD = 0;
  HWD ^= 0xff;

  
}
void loop() {
}


// OC1A ->PB5   11
// OC1B ->PB6   12
// OC1C ->PB7   13

void pwmPinSetup()
{
  DDRB |= (1<<DDB5) | (1<<DDB6) | (1<<DDB7) | (1<<DDB4);
}
