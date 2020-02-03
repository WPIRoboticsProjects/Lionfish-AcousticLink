/*
 * hwDebug.h
 *
 *  Created on: 2019-3-21
 *      Author: Leo
 */

#ifndef HWDEBUG_H_
#define HWDEBUG_H_

#include "inc/tm4c1294ncpdt.h"


void debugPinsInit();

#define debugPort GPIO_PORTL_DATA_R
#define debugPin0 * ( GPIO_PORTL_DATA_BITS_R + GPIO_PIN_0)
#define debugPin1 * ( GPIO_PORTL_DATA_BITS_R + GPIO_PIN_1)
#define debugPin2 * ( GPIO_PORTL_DATA_BITS_R + GPIO_PIN_2)
#define debugPin3 * ( GPIO_PORTL_DATA_BITS_R + GPIO_PIN_3)



#endif /* HWDEBUG_H_ */
