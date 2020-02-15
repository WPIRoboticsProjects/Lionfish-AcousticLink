#include <avr/io.h>
#include <avr/interrupt.h>
#include "PWMGener.h"
#include "hwDebug.h"


// use for pwm generation 
void timer1Setup()
{
//   Mode fast PWM, ICR1 as top. 
// WGMn3:1 = 0b1110 (mode 14)
  // OC1B mode 11, set on match, clear on btm. 
  // OC1A/C mode 10, clear on match, set on Btm 
  TCCR1A = 0b10111010;
  // CSn2:0 = 001, clock no prescaler WGMn3:2 = 11
  TCCR1B = 0b00011001;
  // 16Mhz / 200Khz = 80;
  ICR1 = 80 ;
  //50% duty
  OCR1A =40;
  OCR1B = 40;
  OCR1C = 40;
}

void timer1Mute()
{
    TCCR1A = 0b00000010;
    PORTB &= ~(0b11100000);
}

void timer1On()
{
    TCCR1A = 0b10111010;
}

// used for modulation
void timer3Setup()
{
  // Fast PWM ocrnA top 
  TCCR3A = 0b10111011;
  // CSn2:0 = 001, clock no prescaler WGMn3:2 = 01
  TCCR3B = 0b00011001;
  // 16Mhz / 20Khz = 800;
  //50% duty
  OCR3A =1600;
  OCR3B = OCR3A/2;
  TIMSK3 = 101;
}

ISR(TIMER3_OVF_vect)
{
  HWD =0;
  timer1Mute();
}

ISR(TIMER3_COMPB_vect)
{
  HWD = 0xff;
  timer1On();
}