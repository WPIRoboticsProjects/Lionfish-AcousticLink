



#include <stdint.h>
#include <stdbool.h>
#include "inc/hw_memmap.h"
#include "inc/hw_ints.h"
#include "inc/tm4c1294ncpdt.h"
#include "driverlib/sysctl.h"
#include "driverlib/gpio.h"
#include "driverlib/timer.h"
#include "driverlib/interrupt.h"
#include "driverlib/adc.h"
#include "driverlib/udma.h"
#include "sysctl_pll.h"
#include "sampling.h"
#include "ALinkProtocol.h"



#pragma DATA_ALIGN(gDMAControlTable, 1024) // address alignment required
tDMAControlTable gDMAControlTable[64]; // uDMA control table (global)

volatile int32_t gADCBufferIndex = ADC_BUFFER_SIZE - 1;  // latest sample index
volatile uint16_t gADCBuffer[ADC_BUFFER_SIZE];           // circular buffer
volatile uint32_t gADCErrors;                       // number of missed ADC deadlines
volatile bool gDMAPrimary = true; // is DMA occurring in the primary channel?


// initialize sampling ADC
void SamplingInit(void)
{


    SysCtlPeripheralEnable(SYSCTL_PERIPH_GPIOE);
    GPIOPinTypeADC(GPIO_PORTE_BASE, GPIO_PIN_0); // GPIO setup for analog input AIN3
    SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC0); // initialize ADC peripherals
    SysCtlPeripheralEnable(SYSCTL_PERIPH_ADC1);

    // ADC clock
    uint32_t pll_frequency = SysCtlFrequencyGet(CRYSTAL_FREQUENCY);
    uint32_t pll_divisor = (pll_frequency - 1) / (16 * ADC_SAMPLING_RATE) + 1; //round up

    ADCClockConfigSet(ADC0_BASE, ADC_CLOCK_SRC_PLL | ADC_CLOCK_RATE_FULL, pll_divisor);
    ADCClockConfigSet(ADC1_BASE, ADC_CLOCK_SRC_PLL | ADC_CLOCK_RATE_FULL, pll_divisor);

    ADCSequenceDisable(ADC1_BASE, 0); // choose ADC1 sequence 0; disable before configuring

    ADCSequenceConfigure(ADC1_BASE, 0, ADC_TRIGGER_TIMER, 0); // Timer triggered sequencer
//    ADCSequenceConfigure(ADC1_BASE, 0, ADC_TRIGGER_ALWAYS, 0);    // specify the "Always" trigger

    ADCSequenceStepConfigure(ADC1_BASE, 0, 0, ADC_CTL_CH3 | ADC_CTL_IE | ADC_CTL_END);// in the 0th step, sample channel 3 (AIN3)

    // enable interrupt, and make it the end of sequence
    ADCSequenceEnable(ADC1_BASE, 0); // enable the sequence. it is now sampling
//    ADCIntEnable(ADC1_BASE, 0); // enable sequence 0 interrupt in the ADC1 peripheral
//    IntPrioritySet(INT_ADC1SS0, 0); // set ADC1 sequence 0 interrupt priority
//    IntEnable(INT_ADC1SS0); // enable ADC1 sequence 0 interrupt in int. controller

    //----------------------------DMA SETUP FOR ADC1---------------------------------------------
    SysCtlPeripheralEnable(SYSCTL_PERIPH_UDMA);
    uDMAEnable();
    uDMAControlBaseSet(gDMAControlTable);
    uDMAChannelAssign(UDMA_CH24_ADC1_0); // assign DMA channel 24 to ADC1 sequence 0
    uDMAChannelAttributeDisable(UDMA_SEC_CHANNEL_ADC10, UDMA_ATTR_ALL);
    // primary DMA channel = first half of the ADC buffer
    uDMAChannelControlSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT,
     UDMA_SIZE_16 | UDMA_SRC_INC_NONE | UDMA_DST_INC_16 | UDMA_ARB_4);
    uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT,
     UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R,
     (void*)&gADCBuffer[0], ADC_BUFFER_SIZE/2);
    // alternate DMA channel = second half of the ADC buffer
    uDMAChannelControlSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT,
     UDMA_SIZE_16 | UDMA_SRC_INC_NONE | UDMA_DST_INC_16 | UDMA_ARB_4);
    uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT,
     UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R,
     (void*)&gADCBuffer[ADC_BUFFER_SIZE/2], ADC_BUFFER_SIZE/2);
    uDMAChannelEnable(UDMA_SEC_CHANNEL_ADC10);

    //ADC SETUP WITH DMA
    ADCSequenceDMAEnable(ADC1_BASE, 0); // enable DMA for ADC1 sequence 0
    ADCIntEnableEx(ADC1_BASE, ADC_INT_DMA_SS0); // enable ADC1 sequence 0 DMA interrupt
}



void ADCTimer4Init()
{
    SysCtlPeripheralEnable(SYSCTL_PERIPH_TIMER4);    //timer 3 used for cpu stuff, let's use timer 4

    TimerDisable(TIMER4_BASE, TIMER_BOTH);
    TimerConfigure(TIMER4_BASE, TIMER_CFG_PERIODIC); //want TIMER_CFG_PERIODIC ?
    TimerLoadSet(TIMER4_BASE, TIMER_A, 120000000 / SampleRate -1 );

    TimerControlTrigger(TIMER4_BASE, TIMER_A, true); // Trigger to call ADC.

}




// ADC ISR
void ADC_ISR(void)
{
    ADCIntClearEx(ADC1_BASE, ADC_INT_DMA_SS0); // clear the ADC1 sequence 0 DMA interrupt flag

    // Check the alternate DMA channel for end of transfer, and restart if needed.
     // Also set the gDMAPrimary global.
    if (uDMAChannelModeGet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT) == UDMA_MODE_STOP) {
        uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_PRI_SELECT, UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R, (void*)&gADCBuffer[0], ADC_BUFFER_SIZE>>1); // restart main channel
        gDMAPrimary = false; // set flag for gDMAPrimary global
    }

    if (uDMAChannelModeGet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT) == UDMA_MODE_STOP) {
        // restart the alternate channel (same as setup)
        uDMAChannelTransferSet(UDMA_SEC_CHANNEL_ADC10 | UDMA_ALT_SELECT, UDMA_MODE_PINGPONG, (void*)&ADC1_SSFIFO0_R, (void*)&gADCBuffer[ADC_BUFFER_SIZE>>1], ADC_BUFFER_SIZE>>1);
        gDMAPrimary = true;
    }

    // The DMA channel may be disabled if the CPU is paused by the debugger.
    if (!uDMAChannelIsEnabled(UDMA_SEC_CHANNEL_ADC10)) {
        uDMAChannelEnable(UDMA_SEC_CHANNEL_ADC10); // re-enable the DMA channel
    }
//    ADC1_ISC_R = ADC_ISC_IN0;
//
//    if (ADC1_OSTAT_R & ADC_OSTAT_OV0) { // check for ADC FIFO overflow
//        gADCErrors++;                   // count errors
//        ADC1_OSTAT_R = ADC_OSTAT_OV0;   // clear overflow condition
//    }
//
//    gADCBuffer[gADCBufferIndex = ADC_BUFFER_WRAP(gADCBufferIndex + 1)] = ADC1_SSFIFO0_R; // read sample from the ADC1 sequence 0 FIFO
}
