/*
 * pwmDriver.h
 *
 *  Created on: 2020��2��3��
 *      Author: leogr
 */

#ifndef PWMDRIVER_H_
#define PWMDRIVER_H_

void pwm1Init();
void pwm3Init();
void pwmPinInit();
void pwmOutputEnable();
void pwmOutputDisable();

void PWM_ISR_FUNC(void);



#endif /* PWMDRIVER_H_ */
