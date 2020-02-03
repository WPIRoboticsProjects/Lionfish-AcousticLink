EESchema Schematic File Version 4
LIBS:TransducerDriver-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_FET:IRF540N Q3
U 1 1 5E2CAB91
P 1550 1500
F 0 "Q3" H 1756 1546 50  0000 L CNN
F 1 "IRF540N" H 1756 1455 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 1800 1425 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 1550 1500 50  0001 L CNN
	1    1550 1500
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:IRF540N Q4
U 1 1 5E2CAB98
P 2050 2150
F 0 "Q4" H 2256 2196 50  0000 L CNN
F 1 "IRF540N" H 2256 2105 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Vertical" H 2300 2075 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 2050 2150 50  0001 L CNN
	1    2050 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:Transformer_SP_1S T2
U 1 1 5E2CAB9F
P 3200 1450
F 0 "T2" H 3200 1831 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 3200 1900 50  0000 C CNN
F 2 "Transformer_THT:Transformer_Toroid_Tapped_Horizontal_D10.5mm_Amidon-T37" H 3200 1450 50  0001 C CNN
F 3 "~" H 3200 1450 50  0001 C CNN
	1    3200 1450
	1    0    0    -1  
$EndComp
$Comp
L power:VCC #PWR0104
U 1 1 5E2CABA6
P 2250 1000
F 0 "#PWR0104" H 2250 850 50  0001 C CNN
F 1 "VCC" H 2267 1173 50  0000 C CNN
F 2 "" H 2250 1000 50  0001 C CNN
F 3 "" H 2250 1000 50  0001 C CNN
	1    2250 1000
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1450 2700 1450
Wire Wire Line
	2250 1450 2250 1000
Wire Wire Line
	1650 1250 1650 1300
Wire Wire Line
	2150 1650 2150 1950
$Comp
L power:GND #PWR0105
U 1 1 5E2CABB0
P 2150 2450
F 0 "#PWR0105" H 2150 2200 50  0001 C CNN
F 1 "GND" H 2155 2277 50  0000 C CNN
F 2 "" H 2150 2450 50  0001 C CNN
F 3 "" H 2150 2450 50  0001 C CNN
	1    2150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2350 2150 2450
$Comp
L power:GND #PWR0106
U 1 1 5E2CABB7
P 1650 1750
F 0 "#PWR0106" H 1650 1500 50  0001 C CNN
F 1 "GND" H 1655 1577 50  0000 C CNN
F 2 "" H 1650 1750 50  0001 C CNN
F 3 "" H 1650 1750 50  0001 C CNN
	1    1650 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 1700 1650 1750
Text Label 1150 1500 0    50   ~ 0
SigA
Text Label 1150 2150 0    50   ~ 0
SigB
Wire Wire Line
	1350 1500 1150 1500
Wire Wire Line
	1850 2150 1150 2150
$Comp
L Device:R Rtrans2
U 1 1 5E2CABC2
P 3700 1450
F 0 "Rtrans2" V 3780 1450 50  0000 C CNN
F 1 "10K" V 3700 1450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3630 1450 50  0001 C CNN
F 3 "~" H 3700 1450 50  0001 C CNN
	1    3700 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 1250 3700 1250
Wire Wire Line
	3700 1250 3700 1300
Wire Wire Line
	3700 1600 3700 1650
Wire Wire Line
	3700 1650 3600 1650
Wire Wire Line
	2150 1650 2800 1650
Wire Wire Line
	1650 1250 2800 1250
$Comp
L Device:R Rshut3
U 1 1 5E2CB82B
P 2550 1450
F 0 "Rshut3" V 2630 1450 50  0000 C CNN
F 1 "0.01" V 2550 1450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 2480 1450 50  0001 C CNN
F 3 "~" H 2550 1450 50  0001 C CNN
	1    2550 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	2400 1450 2250 1450
$Comp
L Amplifier_Instrumentation:INA217 U?
U 1 1 5E31F4CD
P 3050 4850
F 0 "U?" H 3000 4950 50  0000 L CNN
F 1 "INA217" H 2950 4850 50  0000 L CNN
F 2 "" H 3050 4850 50  0001 C CNN
F 3 "" H 3050 4850 50  0001 C CNN
	1    3050 4850
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Instrumentation:INA217 U?
U 1 1 5E3200ED
P 4750 4900
F 0 "U?" H 4700 4950 50  0000 L CNN
F 1 "INA217" H 4650 4850 50  0000 L CNN
F 2 "" H 4750 4900 50  0001 C CNN
F 3 "" H 4750 4900 50  0001 C CNN
	1    4750 4900
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 5E320EBC
P 2950 4150
F 0 "#PWR?" H 2950 4000 50  0001 C CNN
F 1 "+BATT" H 2965 4323 50  0000 C CNN
F 2 "" H 2950 4150 50  0001 C CNN
F 3 "" H 2950 4150 50  0001 C CNN
	1    2950 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4150 2950 4400
$Comp
L power:GND #PWR?
U 1 1 5E3219E3
P 2950 5500
F 0 "#PWR?" H 2950 5250 50  0001 C CNN
F 1 "GND" H 2955 5327 50  0000 C CNN
F 2 "" H 2950 5500 50  0001 C CNN
F 3 "" H 2950 5500 50  0001 C CNN
	1    2950 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y?
U 1 1 5E322B30
P 1600 4900
F 0 "Y?" V 1554 5031 50  0000 L CNN
F 1 "Crystal" V 1645 5031 50  0000 L CNN
F 2 "" H 1600 4900 50  0001 C CNN
F 3 "~" H 1600 4900 50  0001 C CNN
	1    1600 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	1600 4750 1600 4500
Wire Wire Line
	1600 4500 2500 4500
Wire Wire Line
	1600 5050 1600 5250
Wire Wire Line
	1600 5250 2500 5250
Wire Wire Line
	2950 5500 2950 5300
Wire Wire Line
	3650 4850 3900 4850
Wire Wire Line
	3900 4850 3900 4550
Wire Wire Line
	3900 4550 4200 4550
$Comp
L Device:R R?
U 1 1 5E325336
P 3600 3700
F 0 "R?" H 3670 3746 50  0000 L CNN
F 1 "4K" H 3670 3655 50  0000 L CNN
F 2 "" V 3530 3700 50  0001 C CNN
F 3 "~" H 3600 3700 50  0001 C CNN
	1    3600 3700
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E325986
P 3600 4150
F 0 "R?" H 3670 4196 50  0000 L CNN
F 1 "4K" H 3670 4105 50  0000 L CNN
F 2 "" V 3530 4150 50  0001 C CNN
F 3 "~" H 3600 4150 50  0001 C CNN
	1    3600 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR?
U 1 1 5E325BD0
P 3600 3500
F 0 "#PWR?" H 3600 3350 50  0001 C CNN
F 1 "+BATT" H 3615 3673 50  0000 C CNN
F 2 "" H 3600 3500 50  0001 C CNN
F 3 "" H 3600 3500 50  0001 C CNN
	1    3600 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E32601F
P 3600 4350
F 0 "#PWR?" H 3600 4100 50  0001 C CNN
F 1 "GND" H 3605 4177 50  0000 C CNN
F 2 "" H 3600 4350 50  0001 C CNN
F 3 "" H 3600 4350 50  0001 C CNN
	1    3600 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 4300 3600 4350
Wire Wire Line
	3600 4000 3600 3900
Wire Wire Line
	3600 3550 3600 3500
Connection ~ 3600 3900
Wire Wire Line
	3600 3900 3600 3850
Text Label 3800 3900 0    50   ~ 0
Vref
Wire Wire Line
	3600 3900 3950 3900
Text Label 3350 5200 0    50   ~ 0
Vref
Wire Wire Line
	3300 5100 3300 5200
Wire Wire Line
	3300 5200 3500 5200
Text Label 3950 5300 0    50   ~ 0
Vref
Wire Wire Line
	3950 5300 4200 5300
Text Label 5150 5250 0    50   ~ 0
Vref
Wire Wire Line
	5000 5150 5000 5250
Wire Wire Line
	5000 5250 5300 5250
$Comp
L power:+BATT #PWR?
U 1 1 5E32968E
P 4650 4200
F 0 "#PWR?" H 4650 4050 50  0001 C CNN
F 1 "+BATT" H 4665 4373 50  0000 C CNN
F 2 "" H 4650 4200 50  0001 C CNN
F 3 "" H 4650 4200 50  0001 C CNN
	1    4650 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 4200 4650 4450
$Comp
L power:GND #PWR?
U 1 1 5E32A049
P 4650 5500
F 0 "#PWR?" H 4650 5250 50  0001 C CNN
F 1 "GND" H 4655 5327 50  0000 C CNN
F 2 "" H 4650 5500 50  0001 C CNN
F 3 "" H 4650 5500 50  0001 C CNN
	1    4650 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 5350 4650 5500
$Comp
L Device:C C?
U 1 1 5E32B0BA
P 5800 4900
F 0 "C?" V 5548 4900 50  0000 C CNN
F 1 "159nF" V 5639 4900 50  0000 C CNN
F 2 "" H 5838 4750 50  0001 C CNN
F 3 "~" H 5800 4900 50  0001 C CNN
	1    5800 4900
	0    1    1    0   
$EndComp
Wire Notes Line
	2050 4300 2050 5350
Wire Notes Line
	2050 5350 1350 5350
Wire Notes Line
	1350 5350 1350 4300
Wire Notes Line
	1350 4300 2050 4300
Text Notes 1500 4450 0    50   ~ 0
Fish Finder
$Comp
L pspice:DIODE D?
U 1 1 5E32C473
P 6300 4900
F 0 "D?" H 6300 5165 50  0000 C CNN
F 1 "1N4148" H 6300 5074 50  0000 C CNN
F 2 "" H 6300 4900 50  0001 C CNN
F 3 "~" H 6300 4900 50  0001 C CNN
	1    6300 4900
	1    0    0    -1  
$EndComp
Text Notes 4850 4550 0    50   ~ 0
6K output impedence 
Text Notes 5550 5300 0    50   ~ 0
Highpass Assuming \n1K impedance. \n1Khz cutoff feq
Wire Wire Line
	5350 4900 5650 4900
Wire Wire Line
	5950 4900 6100 4900
$Comp
L Device:C C?
U 1 1 5E335EEA
P 6600 5200
F 0 "C?" H 6485 5154 50  0000 R CNN
F 1 "10nF" H 6485 5245 50  0000 R CNN
F 2 "" H 6638 5050 50  0001 C CNN
F 3 "~" H 6600 5200 50  0001 C CNN
	1    6600 5200
	-1   0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 5E33632E
P 7200 5200
F 0 "R?" H 7270 5246 50  0000 L CNN
F 1 "530" H 7270 5155 50  0000 L CNN
F 2 "" V 7130 5200 50  0001 C CNN
F 3 "~" H 7200 5200 50  0001 C CNN
	1    7200 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4900 6600 4900
Wire Wire Line
	6600 4900 6600 5050
Wire Wire Line
	6600 4900 7200 4900
Wire Wire Line
	7200 4900 7200 5050
Connection ~ 6600 4900
$Comp
L power:GND #PWR?
U 1 1 5E3386A0
P 6850 5500
F 0 "#PWR?" H 6850 5250 50  0001 C CNN
F 1 "GND" H 6855 5327 50  0000 C CNN
F 2 "" H 6850 5500 50  0001 C CNN
F 3 "" H 6850 5500 50  0001 C CNN
	1    6850 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 5350 6600 5500
Wire Wire Line
	6600 5500 6850 5500
Wire Wire Line
	7200 5350 7200 5500
Wire Wire Line
	7200 5500 6850 5500
Connection ~ 6850 5500
Text Notes 6650 4800 0    50   ~ 0
-3dB @ 30Khz
Text Label 8000 4900 0    50   ~ 0
MicroInput
$Comp
L Device:R R?
U 1 1 5E33ED21
P 7550 4650
F 0 "R?" H 7620 4696 50  0000 L CNN
F 1 "2Khom" H 7620 4605 50  0000 L CNN
F 2 "" V 7480 4650 50  0001 C CNN
F 3 "~" H 7550 4650 50  0001 C CNN
	1    7550 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 5E33F269
P 7550 5150
F 0 "R?" H 7620 5196 50  0000 L CNN
F 1 "1Kohm" H 7620 5105 50  0000 L CNN
F 2 "" V 7480 5150 50  0001 C CNN
F 3 "~" H 7550 5150 50  0001 C CNN
	1    7550 5150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E33F610
P 7550 5300
F 0 "#PWR?" H 7550 5050 50  0001 C CNN
F 1 "GND" H 7555 5127 50  0000 C CNN
F 2 "" H 7550 5300 50  0001 C CNN
F 3 "" H 7550 5300 50  0001 C CNN
	1    7550 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 4900 7300 4900
Wire Wire Line
	7300 4900 7300 4500
Wire Wire Line
	7300 4500 7550 4500
Connection ~ 7200 4900
Wire Wire Line
	7550 4800 7550 4900
Wire Wire Line
	7550 4900 8350 4900
Connection ~ 7550 4900
Wire Wire Line
	7550 4900 7550 5000
$Comp
L Device:R R?
U 1 1 5E3440F7
P 4050 4900
F 0 "R?" H 4120 4946 50  0000 L CNN
F 1 "101" H 4120 4855 50  0000 L CNN
F 2 "" V 3980 4900 50  0001 C CNN
F 3 "~" H 4050 4900 50  0001 C CNN
	1    4050 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4200 4700 4050 4700
Wire Wire Line
	4050 4700 4050 4750
Wire Wire Line
	4050 5050 4050 5100
Wire Wire Line
	4050 5100 4200 5100
Text Notes 3750 5800 0    50   ~ 0
40dB gain\n= 101ohm RG
$Comp
L Device:R R?
U 1 1 5E350B79
P 2300 4850
F 0 "R?" H 2370 4896 50  0000 L CNN
F 1 "101" H 2370 4805 50  0000 L CNN
F 2 "" V 2230 4850 50  0001 C CNN
F 3 "~" H 2300 4850 50  0001 C CNN
	1    2300 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4650 2300 4650
Wire Wire Line
	2300 4650 2300 4700
Wire Wire Line
	2300 5000 2300 5050
Wire Wire Line
	2300 5050 2500 5050
Text Notes 4150 1600 0    157  ~ 31
Driver
Text Notes 9100 4900 0    157  ~ 31
Receiver
Text Notes 6800 4350 0    50   ~ 0
Over Amplify \nthen voltage devide \nto reduce diode bias
Text Notes 2350 3750 0    50   ~ 0
amplify signal at \nhalf battery voltage. \n(fake negative voltage)
$EndSCHEMATC
