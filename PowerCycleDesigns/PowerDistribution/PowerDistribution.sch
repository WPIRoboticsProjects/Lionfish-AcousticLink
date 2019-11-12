EESchema Schematic File Version 4
LIBS:PowerDistribution-cache
EELAYER 26 0
EELAYER END
$Descr USLetter 8500 11000 portrait
encoding utf-8
Sheet 1 1
Title "Distributed Power cycle in regulator"
Date "2019-11-11"
Rev "V0.1"
Comp "Lionfish "
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 1400 850  0    50   ~ 0
origional onnection of PixHawx \nhttp://docs.bluerobotics.com/brov2/cad/connections/BlueROV2_heavy.pdf 
Text GLabel 3600 1500 2    50   Input ~ 0
Batt+
Text GLabel 3600 1600 2    50   Input ~ 0
Batt-
Wire Wire Line
	3600 1500 3400 1500
Wire Wire Line
	3400 1600 3600 1600
Text GLabel 6800 1500 2    50   Input ~ 0
5V_1
Text GLabel 6800 1600 2    50   Input ~ 0
GND
Wire Wire Line
	6750 1500 6800 1500
Wire Wire Line
	6800 1600 6750 1600
Text GLabel 5550 2400 0    50   Input ~ 0
Batt+
Text GLabel 5550 2500 0    50   Input ~ 0
Batt-
Text GLabel 5750 8400 3    50   Input ~ 0
Batt+
Text GLabel 2400 4900 0    50   Input ~ 0
5V_1
Text GLabel 2400 5000 0    50   Input ~ 0
GND
Text Notes 5400 5900 3    79   ~ 16
. . . \n
Entry Wire Line
	3900 4900 4000 5000
Entry Wire Line
	3900 5000 4000 5100
Entry Wire Line
	3900 5100 4000 5200
Entry Wire Line
	3900 5200 4000 5300
Entry Wire Line
	3900 5300 4000 5400
Entry Wire Line
	3900 5400 4000 5500
Entry Wire Line
	3900 5500 4000 5600
Entry Wire Line
	3900 5600 4000 5700
Wire Wire Line
	3850 4900 3900 4900
Wire Wire Line
	3850 5000 3900 5000
Wire Wire Line
	3900 5100 3850 5100
Wire Wire Line
	3850 5200 3900 5200
Wire Wire Line
	3900 5300 3850 5300
Wire Wire Line
	3850 5400 3900 5400
Wire Wire Line
	3900 5500 3850 5500
Wire Wire Line
	3850 5600 3900 5600
Wire Bus Line
	4000 4900 4800 4900
Entry Wire Line
	4800 4900 4900 5000
Entry Wire Line
	4800 5400 4900 5500
Wire Wire Line
	4900 5000 5100 5000
Wire Wire Line
	4900 5500 5100 5500
Text GLabel 5100 5300 0    50   Input ~ 0
Batt-
Text GLabel 5100 5200 0    50   Input ~ 0
Batt+
Text GLabel 5100 5700 0    50   Input ~ 0
Batt+
Text GLabel 5100 5800 0    50   Input ~ 0
Batt-
Entry Wire Line
	4800 6200 4900 6300
Entry Wire Line
	4800 6700 4900 6800
Wire Wire Line
	4900 6300 5100 6300
Wire Wire Line
	4900 6800 5100 6800
Text GLabel 5100 6600 0    50   Input ~ 0
Batt-
Text GLabel 5100 6500 0    50   Input ~ 0
Batt+
Text GLabel 5100 7000 0    50   Input ~ 0
Batt+
Text GLabel 5100 7100 0    50   Input ~ 0
Batt-
Entry Wire Line
	2850 6500 2950 6600
Entry Wire Line
	2850 6600 2950 6700
Entry Wire Line
	2850 6700 2950 6800
Entry Wire Line
	2850 6800 2950 6900
Text GLabel 5850 8400 3    50   Input ~ 0
Batt-
Wire Wire Line
	3900 7550 3900 7350
Wire Wire Line
	3900 7350 2400 7350
Wire Wire Line
	2400 7350 2400 5950
Text GLabel 6800 2400 2    50   Input ~ 0
5V_2
Text GLabel 6800 2500 2    50   Input ~ 0
GND
Wire Wire Line
	6750 2400 6800 2400
Wire Wire Line
	6800 2500 6750 2500
Text GLabel 2350 7550 0    50   Input ~ 0
5V_2
Text GLabel 2350 7650 0    50   Input ~ 0
GND
Wire Wire Line
	2950 6600 3000 6600
Wire Wire Line
	2950 6700 3000 6700
Wire Wire Line
	3000 6800 2950 6800
Wire Wire Line
	2950 6900 3000 6900
Entry Wire Line
	5000 7900 5100 7800
Entry Wire Line
	4050 7900 3950 8000
Wire Wire Line
	3950 8000 3900 8000
Wire Wire Line
	5100 7800 5150 7800
Wire Bus Line
	5000 7900 4050 7900
Text Label 4300 4900 0    49   ~ 0
PWMs
Text Notes 4300 7900 0    49   ~ 0
Eathernet
Wire Bus Line
	2850 6400 2250 6400
Wire Bus Line
	2250 6400 2250 5550
Entry Wire Line
	2350 5450 2250 5550
Wire Wire Line
	2350 5450 2400 5450
Text Label 2600 6400 0    49   ~ 0
I2C
Text GLabel 5550 1500 0    50   Input ~ 0
Batt+
Text GLabel 5550 1600 0    50   Input ~ 0
Batt-
$Comp
L Switch:SW_Reed SW1
U 1 1 5DCB753C
P 4450 2950
F 0 "SW1" H 4450 3050 50  0000 C CNN
F 1 "SW_Reed" H 4450 2850 50  0000 C CNN
F 2 "" H 4450 2950 50  0001 C CNN
F 3 "" H 4450 2950 50  0001 C CNN
	1    4450 2950
	0    1    1    0   
$EndComp
Text GLabel 4300 2200 0    50   Input ~ 0
Batt+
$Comp
L Device:R Rup1
U 1 1 5DCB7664
P 4450 2450
F 0 "Rup1" V 4530 2450 50  0000 C CNN
F 1 "10K" V 4450 2450 50  0000 C CNN
F 2 "" V 4380 2450 50  0001 C CNN
F 3 "~" H 4450 2450 50  0001 C CNN
	1    4450 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:R Rdown1
U 1 1 5DCB78E6
P 4450 3450
F 0 "Rdown1" V 4530 3450 50  0000 C CNN
F 1 "100" V 4450 3450 50  0000 C CNN
F 2 "" V 4380 3450 50  0001 C CNN
F 3 "~" H 4450 3450 50  0001 C CNN
	1    4450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 3150 4450 3300
Wire Wire Line
	4450 2600 4450 2700
Text GLabel 4350 3750 0    50   Input ~ 0
Batt-
Wire Wire Line
	4300 2200 4450 2200
Wire Wire Line
	4450 2200 4450 2300
Wire Wire Line
	4450 3600 4450 3750
Wire Wire Line
	4450 3750 4350 3750
Connection ~ 4450 2700
Wire Wire Line
	4450 2700 4450 2750
$Comp
L Device:C C1
U 1 1 5DCBAF28
P 4750 2450
F 0 "C1" H 4775 2550 50  0000 L CNN
F 1 "100nf" H 4775 2350 50  0000 L CNN
F 2 "" H 4788 2300 50  0001 C CNN
F 3 "~" H 4750 2450 50  0001 C CNN
	1    4750 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 2300 4750 2200
Wire Wire Line
	4750 2200 4450 2200
Connection ~ 4450 2200
Wire Wire Line
	4750 2600 4750 2700
Connection ~ 4750 2700
Wire Wire Line
	4750 2700 4450 2700
$Comp
L ComponentBlock:5Vreg U?
U 1 1 5DCA3F7E
P 6150 1200
F 0 "U?" H 6150 1100 50  0000 C CNN
F 1 "5Vreg" H 6150 1200 50  0000 C CNN
F 2 "" H 6150 1200 50  0001 C CNN
F 3 "" H 6150 1200 50  0001 C CNN
	1    6150 1200
	-1   0    0    -1  
$EndComp
$Comp
L ComponentBlock:5Vreg U?
U 1 1 5DCA40A3
P 6150 2100
F 0 "U?" H 6150 2000 50  0000 C CNN
F 1 "5Vreg" H 6150 2100 50  0000 C CNN
F 2 "" H 6150 2100 50  0001 C CNN
F 3 "" H 6150 2100 50  0001 C CNN
	1    6150 2100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5550 1800 5200 1800
Wire Wire Line
	5200 1800 5200 2700
Connection ~ 5200 2700
Wire Wire Line
	5200 2700 4750 2700
Wire Wire Line
	5200 2700 5550 2700
$Comp
L ComponentBlock:Lipo U?
U 1 1 5DCA781C
P 2800 1500
F 0 "U?" H 2800 1400 50  0000 C CNN
F 1 "Lipo" H 2800 1500 50  0000 C CNN
F 2 "" H 2800 1500 50  0001 C CNN
F 3 "" H 2800 1500 50  0001 C CNN
	1    2800 1500
	-1   0    0    -1  
$EndComp
$Comp
L ComponentBlock:PixHawks U?
U 1 1 5DCA791A
P 3150 5150
F 0 "U?" H 3150 5050 50  0000 C CNN
F 1 "PixHawks" H 3150 5150 50  0000 C CNN
F 2 "" H 3150 5150 50  0001 C CNN
F 3 "" H 3150 5150 50  0001 C CNN
	1    3150 5150
	-1   0    0    -1  
$EndComp
$Comp
L ComponentBlock:Bar30 U?
U 1 1 5DCA79EF
P 3550 6700
F 0 "U?" H 3450 6550 50  0000 C CNN
F 1 "Bar30" H 3450 6700 50  0000 C CNN
F 2 "" H 3450 6750 79  0001 C CNN
F 3 "" H 3450 6750 79  0001 C CNN
	1    3550 6700
	-1   0    0    -1  
$EndComp
$Comp
L ComponentBlock:RaspPi U?
U 1 1 5DCA7AF0
P 3150 7750
F 0 "U?" H 3150 7900 50  0000 C CNN
F 1 "RaspPi" H 3150 8000 50  0000 C CNN
F 2 "" H 3150 7850 50  0001 C CNN
F 3 "" H 3150 7850 50  0001 C CNN
	1    3150 7750
	-1   0    0    -1  
$EndComp
$Comp
L ComponentBlock:FathomX U?
U 1 1 5DCA7BD8
P 5800 7900
F 0 "U?" H 5800 8150 50  0000 C CNN
F 1 "FathomX" H 5800 8250 50  0000 C CNN
F 2 "" H 5800 8250 50  0001 C CNN
F 3 "" H 5800 8250 50  0001 C CNN
	1    5800 7900
	1    0    0    -1  
$EndComp
$Comp
L ComponentBlock:ESC U?
U 1 1 5DCA936E
P 5700 4800
F 0 "U?" H 5700 4400 50  0000 C CNN
F 1 "ESC" H 5700 4500 50  0000 C CNN
F 2 "" H 5700 4500 50  0001 C CNN
F 3 "" H 5700 4500 50  0001 C CNN
	1    5700 4800
	1    0    0    -1  
$EndComp
$Comp
L ComponentBlock:ESC U?
U 1 1 5DCA93BB
P 5700 5300
F 0 "U?" H 5700 4900 50  0000 C CNN
F 1 "ESC" H 5700 5000 50  0000 C CNN
F 2 "" H 5700 5000 50  0001 C CNN
F 3 "" H 5700 5000 50  0001 C CNN
	1    5700 5300
	1    0    0    -1  
$EndComp
$Comp
L ComponentBlock:ESC U?
U 1 1 5DCA93FF
P 5700 6100
F 0 "U?" H 5700 5700 50  0000 C CNN
F 1 "ESC" H 5700 5800 50  0000 C CNN
F 2 "" H 5700 5800 50  0001 C CNN
F 3 "" H 5700 5800 50  0001 C CNN
	1    5700 6100
	1    0    0    -1  
$EndComp
$Comp
L ComponentBlock:ESC U?
U 1 1 5DCA9447
P 5700 6600
F 0 "U?" H 5700 6200 50  0000 C CNN
F 1 "ESC" H 5700 6300 50  0000 C CNN
F 2 "" H 5700 6300 50  0001 C CNN
F 3 "" H 5700 6300 50  0001 C CNN
	1    5700 6600
	1    0    0    -1  
$EndComp
Wire Notes Line
	1900 4350 4200 4350
Wire Notes Line
	4200 4350 4200 8300
Wire Notes Line
	4200 8300 1900 8300
Wire Notes Line
	1900 8300 1900 4350
Text Notes 2100 4600 0    89   ~ 0
Will be power cycled
Text Notes 4850 4650 0    89   ~ 0
Will not be power cycled
Text Notes 3600 3000 0    50   Italic 0
Reed switch \nfor power cycle
Wire Bus Line
	4800 4900 4800 6700
Wire Bus Line
	2850 6400 2850 6800
Wire Bus Line
	4000 4900 4000 5700
$EndSCHEMATC
