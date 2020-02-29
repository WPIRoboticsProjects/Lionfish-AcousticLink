/*
 * buttons.h
 *
 *  Created on: Aug 12, 2012, modified 9/8/2017
 *      Author: Gene Bogdanov
 *
 *  Button debouncer, calibrated for 200 samples/sec.
 */

#ifndef SAMPLING_H_
#define SAMPLING_H_

#include <stdint.h>
#include "ALinkProtocol.h"

// public globals
#define ADC_BUFFER_SIZE 4096                             // size must be a power of 2
#define ADC_BUFFER_WRAP(i) ((i) & (ADC_BUFFER_SIZE - 1)) // index wrapping macro

extern volatile int32_t gADCBufferIndex;  // latest sample index
extern volatile uint16_t gADCBuffer[ADC_BUFFER_SIZE];           // circular buffer
extern volatile uint32_t gADCErrors;                       // number of missed ADC deadlines


#define ADC_SAMPLING_RATE SampleRate   // [samples/sec] desired ADC sampling rate
#define CRYSTAL_FREQUENCY 120000000  // [Hz] crystal oscillator frequency used to calculate clock rates

// initialize sampling ADC
void SamplingInit(void);

// ADC ISR
void ADC_ISR(void);

#endif /* SAMPLING_H_ */
