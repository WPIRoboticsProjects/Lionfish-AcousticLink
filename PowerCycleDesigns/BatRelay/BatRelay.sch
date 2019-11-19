EESchema Schematic File Version 4
LIBS:BatRelay-cache
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title ""
Date "2019-11-07"
Rev ""
Comp "Lionfish Phase III"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text GLabel 1750 1850 0    50   Input ~ 0
Batt_14.8
Text Notes 1150 900  0    50   ~ 0
4S6P Lipo, 90A continous current. \n130A Burst. 12.8V min\n
$Comp
L Switch:SW_Reed SW1
U 1 1 5DC3D2EC
P 1950 2550
F 0 "SW1" V 1904 2635 50  0000 L CNN
F 1 "SW_Reed" V 1995 2635 50  0000 L CNN
F 2 "" H 1950 2550 50  0001 C CNN
F 3 "" H 1950 2550 50  0001 C CNN
	1    1950 2550
	0    -1   -1   0   
$EndComp
$Comp
L Relay:G5Q-1A K1
U 1 1 5DC3D512
P 2150 3150
F 0 "K1" H 2480 3196 50  0000 L CNN
F 1 "G5Q-1A" H 2480 3105 50  0000 L CNN
F 2 "Relay_THT:Relay_SPST_Omron-G5Q-1A" H 2500 3100 50  0001 L CNN
F 3 "https://www.omron.com/ecb/products/pdf/en-g5q.pdf" H 3250 2850 50  0001 C CNN
	1    2150 3150
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DC3D5AB
P 1950 2100
F 0 "R1" H 1880 2054 50  0000 R CNN
F 1 "R" H 1880 2145 50  0000 R CNN
F 2 "" V 1880 2100 50  0001 C CNN
F 3 "~" H 1950 2100 50  0001 C CNN
	1    1950 2100
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5DC3D6D2
P 1950 3700
F 0 "#PWR01" H 1950 3450 50  0001 C CNN
F 1 "GND" H 1955 3527 50  0000 C CNN
F 2 "" H 1950 3700 50  0001 C CNN
F 3 "" H 1950 3700 50  0001 C CNN
	1    1950 3700
	1    0    0    -1  
$EndComp
Text GLabel 2650 3700 2    50   Input ~ 0
Robot
Wire Wire Line
	2350 3450 2350 3700
Wire Wire Line
	2350 3700 2650 3700
Wire Wire Line
	1750 1850 1950 1850
Wire Wire Line
	2350 1850 2350 2850
Wire Wire Line
	1950 1950 1950 1850
Connection ~ 1950 1850
Wire Wire Line
	1950 1850 2350 1850
Wire Wire Line
	1950 2250 1950 2350
Wire Wire Line
	1950 2750 1950 2800
Wire Wire Line
	1950 3450 1950 3550
$Comp
L Device:D D1
U 1 1 5DC3D90F
P 1450 3000
F 0 "D1" V 1404 3079 50  0000 L CNN
F 1 "D" V 1495 3079 50  0000 L CNN
F 2 "" H 1450 3000 50  0001 C CNN
F 3 "~" H 1450 3000 50  0001 C CNN
	1    1450 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	1450 2850 1450 2800
Wire Wire Line
	1450 2800 1950 2800
Connection ~ 1950 2800
Wire Wire Line
	1950 2800 1950 2850
Wire Wire Line
	1450 3150 1450 3550
Wire Wire Line
	1450 3550 1950 3550
Connection ~ 1950 3550
Wire Wire Line
	1950 3550 1950 3700
Text GLabel 3800 1800 0    50   Input ~ 0
Batt_14.8
$Comp
L Switch:SW_Reed SW2
U 1 1 5DC3DBC8
P 4000 2500
F 0 "SW2" V 3954 2585 50  0000 L CNN
F 1 "SW_Reed" V 4045 2585 50  0000 L CNN
F 2 "" H 4000 2500 50  0001 C CNN
F 3 "" H 4000 2500 50  0001 C CNN
	1    4000 2500
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R3
U 1 1 5DC3DBD6
P 4000 2050
F 0 "R3" H 3930 2004 50  0000 R CNN
F 1 "100ohm" H 3930 2095 50  0000 R CNN
F 2 "" V 3930 2050 50  0001 C CNN
F 3 "~" H 4000 2050 50  0001 C CNN
	1    4000 2050
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5DC3DBDD
P 3500 3800
F 0 "#PWR02" H 3500 3550 50  0001 C CNN
F 1 "GND" H 3505 3627 50  0000 C CNN
F 2 "" H 3500 3800 50  0001 C CNN
F 3 "" H 3500 3800 50  0001 C CNN
	1    3500 3800
	1    0    0    -1  
$EndComp
Text GLabel 5750 3950 2    50   Input ~ 0
Robot
Wire Wire Line
	3800 1800 4000 1800
Wire Wire Line
	4000 1900 4000 1800
Connection ~ 4000 1800
Wire Wire Line
	4000 1800 4550 1800
Wire Wire Line
	4000 2200 4000 2300
$Comp
L Device:D D4
U 1 1 5DC3DBEE
P 5250 3100
F 0 "D4" V 5204 3179 50  0000 L CNN
F 1 "D_freewheel" V 5295 3179 50  0000 L CNN
F 2 "" H 5250 3100 50  0001 C CNN
F 3 "~" H 5250 3100 50  0001 C CNN
	1    5250 3100
	0    1    1    0   
$EndComp
$Comp
L Device:Q_NMOS_DGS Q1
U 1 1 5DC3E018
P 4450 3050
F 0 "Q1" H 4655 3096 50  0000 L CNN
F 1 "Q_NMOS_DGS" H 4650 2850 50  0000 L CNN
F 2 "" H 4650 3150 50  0001 C CNN
F 3 "~" H 4450 3050 50  0001 C CNN
	1    4450 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	4000 3050 4250 3050
Wire Wire Line
	4000 2700 4000 3050
$Comp
L Device:R R2
U 1 1 5DC3FB09
P 3500 3350
F 0 "R2" H 3430 3304 50  0000 R CNN
F 1 "10Kohm" H 3430 3395 50  0000 R CNN
F 2 "" V 3430 3350 50  0001 C CNN
F 3 "~" H 3500 3350 50  0001 C CNN
	1    3500 3350
	-1   0    0    1   
$EndComp
Connection ~ 4000 3050
Text Notes 1250 1550 0    50   ~ 0
High Current Relay is made fore AC switching. \nArc might be a problem\n
Text Notes 3450 1550 0    50   ~ 0
MOSFET is potential to ESD problem. \nSpecially in robot
$Comp
L Device:D_Zener D2
U 1 1 5DC40F21
P 4000 3300
F 0 "D2" V 3954 3379 50  0000 L CNN
F 1 "20V_Zener" V 4045 3379 50  0000 L CNN
F 2 "" H 4000 3300 50  0001 C CNN
F 3 "~" H 4000 3300 50  0001 C CNN
	1    4000 3300
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D3
U 1 1 5DC417FD
P 4000 3650
F 0 "D3" V 4046 3571 50  0000 R CNN
F 1 "20V_Zener" V 3955 3571 50  0000 R CNN
F 2 "" H 4000 3650 50  0001 C CNN
F 3 "~" H 4000 3650 50  0001 C CNN
	1    4000 3650
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4550 3250 4550 3400
Wire Wire Line
	4550 1800 4550 2800
Wire Wire Line
	4550 3950 5750 3950
Wire Wire Line
	4000 3050 4000 3150
Wire Wire Line
	4000 3450 4000 3500
Wire Wire Line
	4000 3800 4000 3950
Wire Wire Line
	4000 3950 4550 3950
Connection ~ 4550 3950
Wire Wire Line
	4550 2800 5250 2800
Wire Wire Line
	5250 2800 5250 2950
Connection ~ 4550 2800
Wire Wire Line
	4550 2800 4550 2850
Wire Wire Line
	5250 3250 5250 3400
Wire Wire Line
	5250 3400 4550 3400
Connection ~ 4550 3400
Wire Wire Line
	4550 3400 4550 3950
Wire Wire Line
	4000 3050 3500 3050
Wire Wire Line
	3500 3050 3500 3200
Wire Wire Line
	3500 3500 3500 3800
$EndSCHEMATC
