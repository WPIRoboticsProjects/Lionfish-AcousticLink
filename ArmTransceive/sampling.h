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

// public globals
#define ADC_BUFFER_SIZE 4096                             // size must be a power of 2
#define ADC_BUFFER_WRAP(i) ((i) & (ADC_BUFFER_SIZE - 1)) // index wrapping macro

extern volatile int32_t gADCBufferIndex;  // latest sample index
extern volatile uint16_t gADCBuffer[ADC_BUFFER_SIZE];           // circular buffer
extern volatile uint32_t gADCErrors;                       // number of missed ADC deadlines


// initialize sampling ADC
void SamplingInit(void);

// ADC ISR
void ADC_ISR(void);

#endif /* SAMPLING_H_ */