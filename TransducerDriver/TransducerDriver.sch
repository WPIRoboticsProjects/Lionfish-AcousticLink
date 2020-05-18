EESchema Schematic File Version 4
LIBS:TransducerDriver-cache
EELAYER 26 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Acoustic Link Analog circuits"
Date "2020-02-11"
Rev "2.3"
Comp ""
Comment1 "Leo Chen"
Comment2 "Lionfish MQP / Acoustic Link"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_FET:IRF540N Q3
U 1 1 5E2CAB91
P 4300 2650
F 0 "Q3" H 4506 2696 50  0000 L CNN
F 1 "IRF540N" H 4506 2605 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 4550 2575 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 4300 2650 50  0001 L CNN
	1    4300 2650
	1    0    0    -1  
$EndComp
$Comp
L Device:Transformer_SP_1S T1
U 1 1 5E2CAB9F
P 5850 2600
F 0 "T1" H 5850 2150 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 5850 2300 50  0000 C CNN
F 2 "Transformers_THT:Transformer_Toroid_Tapped_Horizontal_D14.0mm_Amidon-T50" H 5850 2600 50  0001 C CNN
F 3 "~" H 5850 2600 50  0001 C CNN
	1    5850 2600
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5E2CABB7
P 4400 3350
F 0 "#PWR0106" H 4400 3100 50  0001 C CNN
F 1 "GND" H 4400 3200 50  0000 C CNN
F 2 "" H 4400 3350 50  0001 C CNN
F 3 "" H 4400 3350 50  0001 C CNN
	1    4400 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 2400 6700 2450
Wire Wire Line
	6700 2750 6700 2800
Text Notes 650  1550 0    157  ~ 31
Transmitter
$Comp
L power:+BATT #PWR0112
U 1 1 5E39A4A0
P 4800 1600
F 0 "#PWR0112" H 4800 1450 50  0001 C CNN
F 1 "+BATT" H 4800 1740 50  0000 C CNN
F 2 "" H 4800 1600 50  0001 C CNN
F 3 "" H 4800 1600 50  0001 C CNN
	1    4800 1600
	1    0    0    -1  
$EndComp
Text GLabel 1700 2600 0    50   Input ~ 0
ModSig+
$Comp
L Transistor_FET:IRF540N Q4
U 1 1 5E3D6FE3
P 5100 3050
F 0 "Q4" H 5306 3096 50  0000 L CNN
F 1 "IRF540N" H 5306 3005 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5350 2975 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 5100 3050 50  0001 L CNN
	1    5100 3050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5E3D6FEA
P 5200 3350
F 0 "#PWR0113" H 5200 3100 50  0001 C CNN
F 1 "GND" H 5200 3200 50  0000 C CNN
F 2 "" H 5200 3350 50  0001 C CNN
F 3 "" H 5200 3350 50  0001 C CNN
	1    5200 3350
	1    0    0    -1  
$EndComp
Text GLabel 1700 2900 0    50   Input ~ 0
ModSig-
$Comp
L Device:Crystal Y2
U 1 1 5E3EC002
P 6700 2600
F 0 "Y2" V 6654 2731 50  0000 L CNN
F 1 "Fish Finder" V 6745 2731 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 6700 2600 50  0001 C CNN
F 3 "~" H 6700 2600 50  0001 C CNN
	1    6700 2600
	0    1    1    0   
$EndComp
$Comp
L Device:Crystal Ym1
U 1 1 5E401928
P 10750 1500
F 0 "Ym1" V 10704 1631 50  0000 L CNN
F 1 "FishFinder" V 10795 1631 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 10750 1500 50  0001 C CNN
F 3 "~" H 10750 1500 50  0001 C CNN
	1    10750 1500
	0    1    1    0   
$EndComp
$Comp
L Device:R Rm1
U 1 1 5E401A59
P 11000 1300
F 0 "Rm1" V 11080 1300 50  0000 C CNN
F 1 "1K" V 11000 1300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 10930 1300 50  0001 C CNN
F 3 "~" H 11000 1300 50  0001 C CNN
	1    11000 1300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10850 1300 10750 1300
Wire Wire Line
	10750 1300 10750 1350
$Comp
L power:GND #PWR0110
U 1 1 5E403967
P 10750 1700
F 0 "#PWR0110" H 10750 1450 50  0001 C CNN
F 1 "GND" H 10750 1550 50  0000 C CNN
F 2 "" H 10750 1700 50  0001 C CNN
F 3 "" H 10750 1700 50  0001 C CNN
	1    10750 1700
	1    0    0    -1  
$EndComp
Text GLabel 11400 1300 2    50   Input ~ 0
Vin
Text GLabel 11200 1250 1    50   Input ~ 0
Prob1
Text GLabel 10750 1250 1    50   Input ~ 0
Prob2
Wire Wire Line
	11200 1250 11200 1300
Connection ~ 11200 1300
Wire Wire Line
	11200 1300 11150 1300
Wire Wire Line
	10750 1250 10750 1300
Connection ~ 10750 1300
Text Notes 10650 2000 0    39   ~ 0
Impedance Measure Circuit
Wire Wire Line
	11200 1300 11400 1300
Text Notes 10600 850  0    157  ~ 31
Measure
$Comp
L TransducerDriver-rescue:TC427-Driver_FET U3
U 1 1 5E424709
P 2850 2750
F 0 "U3" H 2850 2800 50  0000 C CNN
F 1 "TC427" H 2850 2700 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_LongPads" H 2850 2750 50  0001 C CNN
F 3 "" H 2850 2750 50  0001 C CNN
	1    2850 2750
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0111
U 1 1 5E4247E1
P 2850 1650
F 0 "#PWR0111" H 2850 1500 50  0001 C CNN
F 1 "+BATT" H 2850 1790 50  0000 C CNN
F 2 "" H 2850 1650 50  0001 C CNN
F 3 "" H 2850 1650 50  0001 C CNN
	1    2850 1650
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 5E4249CF
P 2850 1850
F 0 "D2" H 2850 1950 50  0000 C CNN
F 1 "1N4007" H 2850 1750 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P10.16mm_Horizontal" H 2850 1850 50  0001 C CNN
F 3 "~" H 2850 1850 50  0001 C CNN
	1    2850 1850
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5E42756F
P 2850 3350
F 0 "#PWR0114" H 2850 3100 50  0001 C CNN
F 1 "GND" H 2850 3200 50  0000 C CNN
F 2 "" H 2850 3350 50  0001 C CNN
F 3 "" H 2850 3350 50  0001 C CNN
	1    2850 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 3300 2850 3350
Wire Wire Line
	2200 2850 1900 2850
Wire Wire Line
	3500 2850 3550 2850
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 5E4375EA
P 1200 1950
F 0 "J2" H 1200 2150 50  0000 C CNN
F 1 "BattJack+" H 1200 2050 50  0000 C CNN
F 2 "" H 1200 1950 50  0001 C CNN
F 3 "~" H 1200 1950 50  0001 C CNN
	1    1200 1950
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5E437676
P 1050 2700
F 0 "J1" H 1050 2800 50  0000 C CNN
F 1 "ModSigJack" H 1050 2500 50  0000 C CNN
F 2 "" H 1050 2700 50  0001 C CNN
F 3 "~" H 1050 2700 50  0001 C CNN
	1    1050 2700
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5E437AD1
P 1200 2100
F 0 "J3" H 1200 1900 50  0000 C CNN
F 1 "BattJack-" H 1200 2000 50  0000 C CNN
F 2 "" H 1200 2100 50  0001 C CNN
F 3 "~" H 1200 2100 50  0001 C CNN
	1    1200 2100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5E437B27
P 1700 2150
F 0 "#PWR0115" H 1700 1900 50  0001 C CNN
F 1 "GND" H 1700 2000 50  0000 C CNN
F 2 "" H 1700 2150 50  0001 C CNN
F 3 "" H 1700 2150 50  0001 C CNN
	1    1700 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 2100 1700 2100
Wire Wire Line
	1700 2100 1700 2150
$Comp
L power:+BATT #PWR0116
U 1 1 5E439689
P 1700 1900
F 0 "#PWR0116" H 1700 1750 50  0001 C CNN
F 1 "+BATT" H 1700 2040 50  0000 C CNN
F 2 "" H 1700 1900 50  0001 C CNN
F 3 "" H 1700 1900 50  0001 C CNN
	1    1700 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1950 1700 1950
Wire Wire Line
	1700 1950 1700 1900
Wire Wire Line
	1250 2700 1750 2700
Wire Wire Line
	1750 2700 1750 2650
Wire Wire Line
	1750 2650 2100 2650
Wire Wire Line
	1250 2800 1750 2800
Wire Wire Line
	1750 2800 1750 2850
Wire Wire Line
	10750 1650 10750 1700
$Comp
L Amplifier_Operational:TL082 U1
U 1 1 5E449313
P 1850 6550
F 0 "U1" H 1850 6750 50  0000 L CNN
F 1 "TL082" H 1850 6350 50  0000 L CNN
F 2 "" H 1850 6550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 1850 6550 50  0001 C CNN
	1    1850 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 6550 2200 6550
Wire Wire Line
	2200 6550 2200 6800
Wire Wire Line
	2200 6800 1500 6800
Wire Wire Line
	1500 6800 1500 6650
Wire Wire Line
	1500 6650 1550 6650
$Comp
L Device:R Rb1
U 1 1 5E44B20F
P 1000 6300
F 0 "Rb1" H 1070 6346 50  0000 L CNN
F 1 "5K" H 1070 6255 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 930 6300 50  0001 C CNN
F 3 "~" H 1000 6300 50  0001 C CNN
	1    1000 6300
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR04
U 1 1 5E44B4D8
P 1000 6150
F 0 "#PWR04" H 1000 6000 50  0001 C CNN
F 1 "+BATT" H 1000 6290 50  0000 C CNN
F 2 "" H 1000 6150 50  0001 C CNN
F 3 "" H 1000 6150 50  0001 C CNN
	1    1000 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E44D202
P 1000 6950
F 0 "#PWR05" H 1000 6700 50  0001 C CNN
F 1 "GND" H 1000 6800 50  0000 C CNN
F 2 "" H 1000 6950 50  0001 C CNN
F 3 "" H 1000 6950 50  0001 C CNN
	1    1000 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1000 6450 1400 6450
Text GLabel 2550 6550 2    50   Input ~ 0
Vref
$Comp
L Device:R Rbuf1
U 1 1 5E470BDE
P 2350 6550
F 0 "Rbuf1" V 2250 6450 50  0000 L CNN
F 1 "10ohm" V 2450 6450 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2280 6550 50  0001 C CNN
F 3 "~" H 2350 6550 50  0001 C CNN
	1    2350 6550
	0    1    1    0   
$EndComp
Connection ~ 2200 6550
Wire Wire Line
	2500 6550 2550 6550
Text Notes 2100 7150 0    50   ~ 0
small resistor \nRbuf1 prevernt \nopamp unstable
$Comp
L Device:C_Small Cb1
U 1 1 5E474862
P 1400 6650
F 0 "Cb1" H 1410 6720 50  0000 L CNN
F 1 "10nF" H 1410 6570 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1400 6650 50  0001 C CNN
F 3 "~" H 1400 6650 50  0001 C CNN
	1    1400 6650
	-1   0    0    1   
$EndComp
Wire Wire Line
	1000 6800 1000 6900
Wire Wire Line
	1400 6450 1400 6550
Connection ~ 1400 6450
Wire Wire Line
	1400 6450 1550 6450
Wire Wire Line
	1400 6750 1400 6900
Wire Wire Line
	1400 6900 1000 6900
Connection ~ 1000 6900
Wire Wire Line
	1000 6900 1000 6950
Wire Notes Line
	800  5950 800  7300
Wire Notes Line
	800  7300 2800 7300
Wire Notes Line
	2800 7300 2800 5950
Wire Notes Line
	2800 5950 800  5950
Text Notes 2150 6150 0    67   Italic 13
Vref Gen
$Comp
L Device:D_Zener Dz3
U 1 1 5E778073
P 2100 3100
F 0 "Dz3" V 2100 3250 50  0000 C CNN
F 1 "3.3V" V 2200 3250 50  0000 C CNN
F 2 "" H 2100 3100 50  0001 C CNN
F 3 "~" H 2100 3100 50  0001 C CNN
	1    2100 3100
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener Dz2
U 1 1 5E77C71B
P 1900 3100
F 0 "Dz2" V 1900 3250 50  0000 C CNN
F 1 "3.3V" V 2000 3250 50  0000 C CNN
F 2 "" H 1900 3100 50  0001 C CNN
F 3 "~" H 1900 3100 50  0001 C CNN
	1    1900 3100
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E780F88
P 2000 3350
F 0 "#PWR01" H 2000 3100 50  0001 C CNN
F 1 "GND" H 2000 3200 50  0000 C CNN
F 2 "" H 2000 3350 50  0001 C CNN
F 3 "" H 2000 3350 50  0001 C CNN
	1    2000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2950 2100 2650
Connection ~ 2100 2650
Wire Wire Line
	2100 2650 2200 2650
Wire Wire Line
	1900 2950 1900 2850
Connection ~ 1900 2850
Wire Wire Line
	1900 2850 1750 2850
Wire Wire Line
	1750 2650 1750 2600
Wire Wire Line
	1750 2600 1700 2600
Connection ~ 1750 2650
Wire Wire Line
	1750 2850 1750 2900
Wire Wire Line
	1750 2900 1700 2900
Connection ~ 1750 2850
Wire Wire Line
	2000 3350 2000 3300
Wire Wire Line
	2000 3300 2100 3300
Wire Wire Line
	2100 3300 2100 3250
Wire Wire Line
	2000 3300 1900 3300
Wire Wire Line
	1900 3300 1900 3250
Connection ~ 2000 3300
Wire Notes Line
	500  3650 14850 3650
Wire Wire Line
	5450 2800 5200 2800
Wire Wire Line
	5200 2800 5200 2850
Text Notes 11350 1500 0    50   ~ 0
sine wave input
$Comp
L Device:D_Zener_Small Dvref1
U 1 1 5E4B2E88
P 1000 6700
F 0 "Dvref1" H 1000 6790 50  0000 C CNN
F 1 "6V IN4735" H 1000 6610 50  0000 C CNN
F 2 "" V 1000 6700 50  0001 C CNN
F 3 "~" V 1000 6700 50  0001 C CNN
	1    1000 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	1000 6450 1000 6600
Connection ~ 1000 6450
Text Notes 1350 7200 0    50   ~ 0
Zener diode to\n avoide power \nsupply ripple 
$Comp
L Device:Transformer_SP_1S Tm1
U 1 1 5E4C6765
P 11150 2650
F 0 "Tm1" H 11150 2200 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 11150 2350 50  0000 C CNN
F 2 "Transformers_THT:Transformer_Toroid_Tapped_Horizontal_D14.0mm_Amidon-T50" H 11150 2650 50  0001 C CNN
F 3 "~" H 11150 2650 50  0001 C CNN
	1    11150 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10750 2450 10650 2450
Wire Wire Line
	10650 2450 10650 2850
Wire Wire Line
	10650 2850 10750 2850
Text GLabel 11950 2450 2    50   Input ~ 0
Vin
Wire Wire Line
	11600 2450 11550 2450
$Comp
L power:GND #PWR03
U 1 1 5E4E9786
P 11700 2950
F 0 "#PWR03" H 11700 2700 50  0001 C CNN
F 1 "GND" H 11700 2800 50  0000 C CNN
F 2 "" H 11700 2950 50  0001 C CNN
F 3 "" H 11700 2950 50  0001 C CNN
	1    11700 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	11550 2850 11700 2850
Wire Wire Line
	11700 2850 11700 2950
$Comp
L Device:R Rm2
U 1 1 5E4FEBB6
P 11750 2450
F 0 "Rm2" V 11830 2450 50  0000 C CNN
F 1 "200" V 11750 2450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 11680 2450 50  0001 C CNN
F 3 "~" H 11750 2450 50  0001 C CNN
	1    11750 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	11950 2450 11900 2450
Text GLabel 11900 2350 1    50   Input ~ 0
Prob1
Text GLabel 11550 2350 1    50   Input ~ 0
Prob2
Wire Wire Line
	11550 2350 11550 2450
Connection ~ 11550 2450
Wire Wire Line
	11900 2350 11900 2450
Connection ~ 11900 2450
$Comp
L Device:Transformer_SP_1S T2
U 1 1 5E55647C
P 13750 1400
F 0 "T2" H 13750 950 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 13750 1100 50  0000 C CNN
F 2 "Transformers_THT:Transformer_Toroid_Tapped_Horizontal_D14.0mm_Amidon-T50" H 13750 1400 50  0001 C CNN
F 3 "~" H 13750 1400 50  0001 C CNN
	1    13750 1400
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y3
U 1 1 5E556485
P 15200 1450
F 0 "Y3" V 15154 1581 50  0000 L CNN
F 1 "FishFinder" V 15245 1581 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 15200 1450 50  0001 C CNN
F 3 "~" H 15200 1450 50  0001 C CNN
	1    15200 1450
	0    1    1    0   
$EndComp
Wire Notes Line
	6550 2350 7100 2350
Wire Notes Line
	7100 2350 7100 2850
Wire Notes Line
	7100 2850 6550 2850
Wire Notes Line
	6550 2850 6550 2350
Wire Notes Line
	10550 600  10550 3400
Wire Notes Line
	14350 1050 14450 1050
Wire Notes Line
	14450 1050 14450 1750
Wire Notes Line
	14450 1750 14350 1750
Text Notes 14150 1150 0    50   ~ 0
Zsource
Wire Notes Line
	14700 1050 14600 1050
Wire Notes Line
	14600 1050 14600 1750
Wire Notes Line
	14600 1750 14700 1750
Text Notes 14650 1150 0    50   ~ 0
Zload=Zfish+Zmatch
Wire Wire Line
	15200 1200 15200 1300
Wire Wire Line
	14150 1600 15200 1600
Text Notes 14100 1900 0    50   ~ 0
Zmatch = Zsource - Zfish
Text Notes 11100 3250 0    39   ~ 0
Impedance Measure Circuit
$Comp
L Device:R Rm4
U 1 1 5E59E5EC
P 14900 1200
F 0 "Rm4" V 14900 1150 50  0000 L CNN
F 1 "Zmatch" V 15000 1050 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 14830 1200 50  0001 C CNN
F 3 "~" H 14900 1200 50  0001 C CNN
	1    14900 1200
	0    1    1    0   
$EndComp
Wire Wire Line
	15200 1200 15050 1200
Wire Wire Line
	14750 1200 14150 1200
Wire Notes Line
	12650 500  12650 3300
$Comp
L Device:Transformer_SP_1S T3
U 1 1 5E600361
P 13750 2550
F 0 "T3" H 13750 2100 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 13750 2250 50  0000 C CNN
F 2 "Transformers_THT:Transformer_Toroid_Tapped_Horizontal_D14.0mm_Amidon-T50" H 13750 2550 50  0001 C CNN
F 3 "~" H 13750 2550 50  0001 C CNN
	1    13750 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y4
U 1 1 5E600368
P 15200 2600
F 0 "Y4" V 15154 2731 50  0000 L CNN
F 1 "FishFinder" V 15245 2731 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 15200 2600 50  0001 C CNN
F 3 "~" H 15200 2600 50  0001 C CNN
	1    15200 2600
	0    1    1    0   
$EndComp
Wire Notes Line
	14350 2200 14450 2200
Wire Notes Line
	14450 2200 14450 2900
Wire Notes Line
	14450 2900 14350 2900
Text Notes 14150 2300 0    50   ~ 0
Zsource
Wire Notes Line
	14700 2200 14600 2200
Wire Notes Line
	14600 2200 14600 2900
Wire Notes Line
	14600 2900 14700 2900
Text Notes 14650 2300 0    50   ~ 0
Zload=Zfish+Zmatch
Wire Wire Line
	15200 2350 15200 2450
Wire Wire Line
	14150 2750 14800 2750
Text Notes 13600 3150 0    50   ~ 0
Zmatch = (Zsource * Zfish) / (Zfish - Zsource)
$Comp
L Device:R Rm3
U 1 1 5E60037B
P 14800 2550
F 0 "Rm3" V 14800 2450 50  0000 L CNN
F 1 "Zmatch" V 14900 2400 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 14730 2550 50  0001 C CNN
F 3 "~" H 14800 2550 50  0001 C CNN
	1    14800 2550
	-1   0    0    1   
$EndComp
Wire Wire Line
	14150 2350 14800 2350
Wire Wire Line
	14800 2400 14800 2350
Connection ~ 14800 2350
Wire Wire Line
	14800 2350 15200 2350
Wire Wire Line
	14800 2700 14800 2750
Connection ~ 14800 2750
Wire Wire Line
	14800 2750 15200 2750
Text Notes 13050 850  0    157  ~ 31
Impedance Match
Wire Wire Line
	3500 2650 3700 2650
$Comp
L Device:D_Small Dprot1
U 1 1 5E5CAFD9
P 3550 2350
F 0 "Dprot1" H 3400 2200 50  0000 L CNN
F 1 "1N4148" H 3400 2270 50  0000 L CNN
F 2 "" V 3550 2350 50  0001 C CNN
F 3 "~" V 3550 2350 50  0001 C CNN
	1    3550 2350
	0    1    1    0   
$EndComp
$Comp
L Device:D_Small Dprot2
U 1 1 5E5DF526
P 3700 2350
F 0 "Dprot2" H 3550 2200 50  0000 L CNN
F 1 "1N4148" H 3550 2270 50  0000 L CNN
F 2 "" V 3700 2350 50  0001 C CNN
F 3 "~" V 3700 2350 50  0001 C CNN
	1    3700 2350
	0    -1   1    0   
$EndComp
Wire Wire Line
	3700 2450 3700 2650
Connection ~ 3700 2650
Wire Wire Line
	3550 2450 3550 2850
Connection ~ 3550 2850
Wire Wire Line
	3700 2200 3700 2250
Wire Wire Line
	3550 2250 3550 2200
Wire Wire Line
	3550 2200 3700 2200
Wire Wire Line
	3550 2200 2850 2200
Connection ~ 3550 2200
Connection ~ 2850 2200
$Comp
L Device:L_Small Lbatt1
U 1 1 5E6A00E8
P 6350 2400
F 0 "Lbatt1" H 6380 2440 50  0000 L CNN
F 1 "5.72uH" H 6380 2360 50  0000 L CNN
F 2 "" H 6350 2400 50  0001 C CNN
F 3 "~" H 6350 2400 50  0001 C CNN
	1    6350 2400
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6450 2400 6700 2400
$Comp
L pspice:DIODE D3
U 1 1 5E7F1A06
P 5100 6400
F 0 "D3" H 5100 6665 50  0000 C CNN
F 1 "1N4148" H 5100 6574 50  0000 C CNN
F 2 "Diodes_THT:D_5W_P12.70mm_Horizontal" H 5100 6400 50  0001 C CNN
F 3 "~" H 5100 6400 50  0001 C CNN
	1    5100 6400
	1    0    0    -1  
$EndComp
$Comp
L Device:R Renv1
U 1 1 5E7F1A0D
P 5700 6700
F 0 "Renv1" H 5770 6746 50  0000 L CNN
F 1 "300K" H 5770 6655 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5630 6700 50  0001 C CNN
F 3 "~" H 5700 6700 50  0001 C CNN
	1    5700 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 6400 5400 6400
Wire Wire Line
	5700 6400 5700 6550
Connection ~ 5400 6400
$Comp
L power:GND #PWR017
U 1 1 5E7F1A17
P 5550 7000
F 0 "#PWR017" H 5550 6750 50  0001 C CNN
F 1 "GND" H 5555 6827 50  0000 C CNN
F 2 "" H 5550 7000 50  0001 C CNN
F 3 "" H 5550 7000 50  0001 C CNN
	1    5550 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5400 7000 5550 7000
Wire Wire Line
	5700 6850 5700 7000
Wire Wire Line
	5700 7000 5550 7000
Connection ~ 5550 7000
Text GLabel 4500 6400 0    50   Input ~ 0
Stage2Out
$Comp
L Device:D_Zener Dz4
U 1 1 5E7F1A22
P 7250 6850
F 0 "Dz4" V 7250 7000 50  0000 C CNN
F 1 "3.3V" V 7350 7000 50  0000 C CNN
F 2 "" H 7250 6850 50  0001 C CNN
F 3 "~" H 7250 6850 50  0001 C CNN
	1    7250 6850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR018
U 1 1 5E7F1A29
P 7250 7000
F 0 "#PWR018" H 7250 6750 50  0001 C CNN
F 1 "GND" H 7255 6827 50  0000 C CNN
F 2 "" H 7250 7000 50  0001 C CNN
F 3 "" H 7250 7000 50  0001 C CNN
	1    7250 7000
	1    0    0    -1  
$EndComp
Text GLabel 7350 6600 2    50   Input ~ 0
ADCinput
Wire Wire Line
	7250 6700 7250 6500
Wire Wire Line
	5400 6400 5400 6600
Wire Wire Line
	5400 6800 5400 7000
$Comp
L Device:C_Small C2out2
U 1 1 5E7F1A33
P 4700 6400
F 0 "C2out2" V 4900 6250 50  0000 L CNN
F 1 "0.1u" V 4800 6300 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 4700 6400 50  0001 C CNN
F 3 "~" H 4700 6400 50  0001 C CNN
	1    4700 6400
	0    1    -1   0   
$EndComp
Wire Wire Line
	4500 6400 4600 6400
Text Notes 4050 6200 0    67   Italic 13
Envelope\nDetector
Wire Notes Line
	4000 5950 7750 5950
Wire Notes Line
	7750 5950 7750 7300
Wire Notes Line
	7750 7300 4000 7300
Wire Notes Line
	4000 7300 4000 5950
$Comp
L Connector:Conn_01x01_Male Jadc2
U 1 1 5E7F1A49
P 7650 6500
F 0 "Jadc2" H 7750 6350 50  0000 C CNN
F 1 "connADC" H 7750 6400 50  0000 C CNN
F 2 "" H 7650 6500 50  0001 C CNN
F 3 "~" H 7650 6500 50  0001 C CNN
	1    7650 6500
	-1   0    0    1   
$EndComp
Wire Wire Line
	7250 6500 7300 6500
Wire Wire Line
	7350 6600 7300 6600
Wire Wire Line
	7300 6600 7300 6500
Connection ~ 7300 6500
Wire Wire Line
	7300 6500 7450 6500
$Comp
L Device:C_Small Cenv1
U 1 1 5E7F1A55
P 5400 6700
F 0 "Cenv1" H 5410 6770 50  0000 L CNN
F 1 "1n" H 5410 6620 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5400 6700 50  0001 C CNN
F 3 "~" H 5400 6700 50  0001 C CNN
	1    5400 6700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5400 6400 5700 6400
Wire Wire Line
	4800 6400 4850 6400
$Comp
L Device:R Rblock1
U 1 1 5E86C018
P 4800 2150
F 0 "Rblock1" V 4900 2150 50  0000 C CNN
F 1 "0.1ohm" V 4700 2150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4730 2150 50  0001 C CNN
F 3 "~" H 4800 2150 50  0001 C CNN
	1    4800 2150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5E888FE5
P 3400 1900
F 0 "C1" H 3425 2000 50  0000 L CNN
F 1 "470uF" H 3425 1800 50  0000 L CNN
F 2 "" H 3438 1750 50  0001 C CNN
F 3 "~" H 3400 1900 50  0001 C CNN
	1    3400 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1600 4800 1650
$Comp
L Device:C_Small Cbp1
U 1 1 5E8C0A8E
P 3750 1850
F 0 "Cbp1" H 3760 1920 50  0000 L CNN
F 1 "10uF" H 3760 1770 50  0000 L CNN
F 2 "" H 3750 1850 50  0001 C CNN
F 3 "~" H 3750 1850 50  0001 C CNN
	1    3750 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5E8C0A95
P 4050 2100
F 0 "#PWR08" H 4050 1850 50  0001 C CNN
F 1 "GND" H 4050 1950 50  0000 C CNN
F 2 "" H 4050 2100 50  0001 C CNN
F 3 "" H 4050 2100 50  0001 C CNN
	1    4050 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6600 4550 6750 4550
Wire Wire Line
	6600 4300 6600 4550
Wire Wire Line
	6450 4300 6600 4300
Wire Wire Line
	6100 4550 6200 4550
Wire Wire Line
	6100 4300 6250 4300
Wire Wire Line
	6100 4300 6100 4550
$Comp
L Device:C_Small C2lp1
U 1 1 5E6B1624
P 6350 4300
F 0 "C2lp1" V 6550 4250 50  0000 L CNN
F 1 "?" V 6450 4250 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 6350 4300 50  0001 C CNN
F 3 "~" H 6350 4300 50  0001 C CNN
	1    6350 4300
	0    1    -1   0   
$EndComp
Wire Wire Line
	3650 5150 3650 5300
Wire Wire Line
	2150 5750 2100 5750
Wire Wire Line
	2150 5700 2150 5750
Text GLabel 2100 5750 0    50   Input ~ 0
Vref
Wire Wire Line
	2150 5000 2100 5000
Wire Wire Line
	2150 4950 2150 5000
Text GLabel 2100 5000 0    50   Input ~ 0
Vref
Wire Wire Line
	3300 4300 3650 4300
Wire Wire Line
	3300 4300 3300 4450
$Comp
L power:GND #PWR02
U 1 1 5E46FBDA
P 3650 4500
F 0 "#PWR02" H 3650 4250 50  0001 C CNN
F 1 "GND" H 3650 4350 50  0000 C CNN
F 2 "" H 3650 4500 50  0001 C CNN
F 3 "" H 3650 4500 50  0001 C CNN
	1    3650 4500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small Cb2
U 1 1 5E46F193
P 3650 4400
F 0 "Cb2" H 3660 4470 50  0000 L CNN
F 1 "0.1uF" H 3660 4320 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3650 4400 50  0001 C CNN
F 3 "~" H 3650 4400 50  0001 C CNN
	1    3650 4400
	1    0    0    1   
$EndComp
Text Notes 4950 3850 0    67   Italic 13
Second stage Inverting Amp
Text Notes 1750 3850 0    67   Italic 13
First Stage Diff Amp
Wire Notes Line
	1750 5900 1750 3950
Wire Notes Line
	4650 5900 1750 5900
Wire Notes Line
	7300 3950 7300 5900
Wire Notes Line
	4950 5900 7300 5900
Wire Wire Line
	5400 4650 5450 4650
Wire Wire Line
	5650 4650 5700 4650
Wire Wire Line
	5950 5100 6100 5100
Wire Wire Line
	5950 5150 5950 5100
Connection ~ 5950 5100
Wire Wire Line
	5750 5100 5950 5100
Text GLabel 6750 4550 2    50   Input ~ 0
Stage2Out
Text GLabel 5750 5100 0    50   Input ~ 0
Vref
Wire Wire Line
	6750 5000 6700 5000
Wire Wire Line
	6750 4550 6750 5000
Connection ~ 6600 4550
Wire Wire Line
	6500 4550 6600 4550
Connection ~ 6100 4550
Wire Wire Line
	6050 4550 6100 4550
Wire Wire Line
	6050 4900 6100 4900
Wire Wire Line
	6050 4550 6050 4650
Wire Wire Line
	6050 4650 6050 4900
Connection ~ 6050 4650
Wire Wire Line
	6000 4650 6050 4650
Text Notes 5050 4250 0    50   ~ 0
10Khz HP filter\n0.1uF 1Kohm
Text Notes 3900 4700 0    50   ~ 0
6Kohm Internal \nR. Is it High \noutput Impedance?
$Comp
L Device:R R2F1
U 1 1 5E4C95AC
P 6350 4550
F 0 "R2F1" V 6250 4450 50  0000 L CNN
F 1 "100Kohm" V 6450 4400 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 6280 4550 50  0001 C CNN
F 3 "~" H 6350 4550 50  0001 C CNN
	1    6350 4550
	0    1    1    0   
$EndComp
$Comp
L Device:R R2G1
U 1 1 5E4C948E
P 5850 4650
F 0 "R2G1" V 5750 4550 50  0000 L CNN
F 1 "1Kohm" V 5950 4550 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5780 4650 50  0001 C CNN
F 3 "~" H 5850 4650 50  0001 C CNN
	1    5850 4650
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C2In2
U 1 1 5E4C92CC
P 5550 4650
F 0 "C2In2" V 5750 4600 50  0000 L CNN
F 1 "0.1u" V 5650 4600 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5550 4650 50  0001 C CNN
F 3 "~" H 5550 4650 50  0001 C CNN
	1    5550 4650
	0    1    -1   0   
$EndComp
Text GLabel 5400 4650 0    50   Input ~ 0
Stage1Out
$Comp
L Amplifier_Operational:LM4562 U4
U 2 1 5E4C56D5
P 6400 5000
F 0 "U4" H 6400 5200 50  0000 L CNN
F 1 "LM4562" H 6350 5300 50  0000 L CNN
F 2 "" H 6400 5000 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm4562.pdf" H 6400 5000 50  0001 C CNN
	2    6400 5000
	1    0    0    1   
$EndComp
Wire Wire Line
	4000 4900 4150 4900
Text GLabel 4150 4900 2    50   Input ~ 0
Stage1Out
Text Notes 1850 4400 0    50   ~ 0
bias current \nsupply\n0.1uF 2.2Kohm\nFc = 4.5Khz
Text GLabel 3650 5300 0    50   Input ~ 0
Vref
Wire Wire Line
	2850 5300 2150 5300
Wire Wire Line
	2150 4550 2850 4550
Wire Wire Line
	2150 4550 2150 4650
Connection ~ 2150 4550
Wire Wire Line
	2050 4550 2150 4550
Wire Wire Line
	2150 5300 2150 5400
Connection ~ 2150 5300
Wire Wire Line
	2050 5300 2150 5300
$Comp
L Device:R Rbias2
U 1 1 5E45D515
P 2150 5550
F 0 "Rbias2" H 2220 5596 50  0000 L CNN
F 1 "2.2K" H 2220 5505 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2080 5550 50  0001 C CNN
F 3 "~" H 2150 5550 50  0001 C CNN
	1    2150 5550
	1    0    0    -1  
$EndComp
$Comp
L Device:R Rbias1
U 1 1 5E45D34E
P 2150 4800
F 0 "Rbias1" H 2220 4846 50  0000 L CNN
F 1 "2.2K" H 2220 4755 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2080 4800 50  0001 C CNN
F 3 "~" H 2150 4800 50  0001 C CNN
	1    2150 4800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5E449082
P 3300 5350
F 0 "#PWR07" H 3300 5100 50  0001 C CNN
F 1 "GND" H 3300 5200 50  0000 C CNN
F 2 "" H 3300 5350 50  0001 C CNN
F 3 "" H 3300 5350 50  0001 C CNN
	1    3300 5350
	1    0    0    -1  
$EndComp
Connection ~ 3300 4300
$Comp
L power:+BATT #PWR06
U 1 1 5E448DDE
P 3300 4300
F 0 "#PWR06" H 3300 4150 50  0001 C CNN
F 1 "+BATT" H 3300 4450 50  0000 C CNN
F 2 "" H 3300 4300 50  0001 C CNN
F 3 "" H 3300 4300 50  0001 C CNN
	1    3300 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 5100 2850 5100
Wire Wire Line
	2600 5050 2600 5100
Wire Wire Line
	2600 4700 2850 4700
Wire Wire Line
	2600 4750 2600 4700
$Comp
L Device:R Rgain1
U 1 1 5E43A64E
P 2600 4900
F 0 "Rgain1" H 2670 4946 50  0000 L CNN
F 1 "101" H 2670 4855 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2530 4900 50  0001 C CNN
F 3 "~" H 2600 4900 50  0001 C CNN
	1    2600 4900
	1    0    0    -1  
$EndComp
$Comp
L TransducerDriver-rescue:INA217-Amplifier_Instrumentation U2
U 1 1 5E439FD5
P 3400 4900
F 0 "U2" H 3400 4850 50  0000 C CNN
F 1 "INA217-Amplifier_Instrumentation" H 3350 5750 50  0000 C CNN
F 2 "" H 3400 4900 50  0001 C CNN
F 3 "" H 3400 4900 50  0001 C CNN
	1    3400 4900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5E43060C
P 5950 5350
F 0 "#PWR09" H 5950 5100 50  0001 C CNN
F 1 "GND" H 5955 5177 50  0000 C CNN
F 2 "" H 5950 5350 50  0001 C CNN
F 3 "" H 5950 5350 50  0001 C CNN
	1    5950 5350
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small Cgnd2
U 1 1 5E42F28D
P 5950 5250
F 0 "Cgnd2" H 6000 5300 50  0000 L CNN
F 1 "0.1u" H 6000 5200 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5950 5250 50  0001 C CNN
F 3 "~" H 5950 5250 50  0001 C CNN
	1    5950 5250
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5E42A52F
P 3450 7100
F 0 "#PWR011" H 3450 6850 50  0001 C CNN
F 1 "GND" H 3450 6950 50  0000 C CNN
F 2 "" H 3450 7100 50  0001 C CNN
F 3 "" H 3450 7100 50  0001 C CNN
	1    3450 7100
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR010
U 1 1 5E42A3DB
P 3450 6150
F 0 "#PWR010" H 3450 6000 50  0001 C CNN
F 1 "+BATT" H 3450 6290 50  0000 C CNN
F 2 "" H 3450 6150 50  0001 C CNN
F 3 "" H 3450 6150 50  0001 C CNN
	1    3450 6150
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM4562 U4
U 3 1 5E41FD78
P 3550 6650
F 0 "U4" H 3500 6700 50  0000 L CNN
F 1 "LM4562" H 3500 6550 50  0000 L CNN
F 2 "" H 3550 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm4562.pdf" H 3550 6650 50  0001 C CNN
	3    3550 6650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1850 5300 1150 5300
Wire Wire Line
	1150 4550 1850 4550
$Comp
L Device:C_Small C4
U 1 1 5E420F89
P 1950 5300
F 0 "C4" H 1960 5370 50  0000 L CNN
F 1 "0.1u" H 1960 5220 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1950 5300 50  0001 C CNN
F 3 "~" H 1950 5300 50  0001 C CNN
	1    1950 5300
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C3
U 1 1 5E420E5F
P 1950 4550
F 0 "C3" H 1960 4620 50  0000 L CNN
F 1 "0.1u" H 1960 4470 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1950 4550 50  0001 C CNN
F 3 "~" H 1950 4550 50  0001 C CNN
	1    1950 4550
	0    1    1    0   
$EndComp
Text Notes 600  4000 0    157  ~ 31
Receiver
Text Notes 850  4850 0    50   ~ 0
Fish Finder
Wire Notes Line
	900  4350 1600 4350
Wire Notes Line
	900  5400 900  4350
Wire Notes Line
	1600 5400 900  5400
Wire Notes Line
	1600 4350 1600 5400
Wire Wire Line
	1150 5100 1150 5300
Wire Wire Line
	1150 4800 1150 4550
$Comp
L Device:Crystal Y1
U 1 1 5E322B30
P 1150 4950
F 0 "Y1" V 1104 5081 50  0000 L CNN
F 1 "Crystal" V 1195 5081 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 1150 4950 50  0001 C CNN
F 3 "~" H 1150 4950 50  0001 C CNN
	1    1150 4950
	0    1    1    0   
$EndComp
Wire Wire Line
	6250 2800 6700 2800
Wire Wire Line
	4400 2850 4400 3350
Wire Wire Line
	5200 3250 5200 3350
Wire Wire Line
	4400 2400 4400 2450
Wire Wire Line
	4400 2400 5450 2400
$Comp
L power:GND #PWR013
U 1 1 5EBF6E4E
P 5700 2100
F 0 "#PWR013" H 5700 1850 50  0001 C CNN
F 1 "GND" H 5700 1950 50  0000 C CNN
F 2 "" H 5700 2100 50  0001 C CNN
F 3 "" H 5700 2100 50  0001 C CNN
	1    5700 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2600 4800 2300
Wire Wire Line
	4800 2600 5450 2600
$Comp
L Device:CP C2
U 1 1 5EC43567
P 5200 1850
F 0 "C2" H 5225 1950 50  0000 L CNN
F 1 "470uF" H 5225 1750 50  0000 L CNN
F 2 "" H 5238 1700 50  0001 C CNN
F 3 "~" H 5200 1850 50  0001 C CNN
	1    5200 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 1650 5200 1650
Wire Wire Line
	5200 1650 5200 1700
Connection ~ 4800 1650
Wire Wire Line
	4800 1650 4800 2000
$Comp
L Device:CP C5
U 1 1 5EC69CA8
P 5550 1850
F 0 "C5" H 5575 1950 50  0000 L CNN
F 1 "470uF" H 5575 1750 50  0000 L CNN
F 2 "" H 5588 1700 50  0001 C CNN
F 3 "~" H 5550 1850 50  0001 C CNN
	1    5550 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small Cbp2
U 1 1 5EC6A264
P 5900 1850
F 0 "Cbp2" H 5910 1920 50  0000 L CNN
F 1 "10uF" H 5910 1770 50  0000 L CNN
F 2 "" H 5900 1850 50  0001 C CNN
F 3 "~" H 5900 1850 50  0001 C CNN
	1    5900 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5200 1650 5550 1650
Wire Wire Line
	5550 1650 5550 1700
Connection ~ 5200 1650
Wire Wire Line
	5550 1650 5900 1650
Wire Wire Line
	5900 1650 5900 1750
Connection ~ 5550 1650
Wire Wire Line
	5900 1950 5900 2050
Wire Wire Line
	5900 2050 5700 2050
Wire Wire Line
	5700 2050 5700 2100
Wire Wire Line
	5550 2000 5550 2050
Wire Wire Line
	5550 2050 5700 2050
Connection ~ 5700 2050
Wire Wire Line
	5200 2000 5200 2050
Wire Wire Line
	5200 2050 5550 2050
Connection ~ 5550 2050
Wire Wire Line
	2850 1650 2850 1700
Wire Wire Line
	3400 2050 3750 2050
Wire Wire Line
	4050 2050 4050 2100
Wire Wire Line
	3400 1750 3750 1750
Wire Wire Line
	3750 2050 3750 1950
Connection ~ 3750 2050
Wire Wire Line
	3750 2050 4050 2050
Wire Wire Line
	2850 2000 2850 2100
Wire Wire Line
	2850 2100 3100 2100
Wire Wire Line
	3100 2100 3100 1750
Wire Wire Line
	3100 1750 3400 1750
Connection ~ 2850 2100
Wire Wire Line
	2850 2100 2850 2200
Connection ~ 3400 1750
Wire Wire Line
	3700 2650 4100 2650
Wire Wire Line
	4150 2850 4150 3050
Wire Wire Line
	4150 3050 4900 3050
Wire Wire Line
	3550 2850 4150 2850
$Comp
L Device:R Rd1
U 1 1 5EB1473C
P 4850 6700
F 0 "Rd1" H 4920 6746 50  0000 L CNN
F 1 "1K" H 4920 6655 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 4780 6700 50  0001 C CNN
F 3 "~" H 4850 6700 50  0001 C CNN
	1    4850 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 6400 4850 6550
Connection ~ 4850 6400
Wire Wire Line
	4850 6400 4900 6400
$Comp
L power:GND #PWR015
U 1 1 5EB2025E
P 4850 6900
F 0 "#PWR015" H 4850 6650 50  0001 C CNN
F 1 "GND" H 4855 6727 50  0000 C CNN
F 2 "" H 4850 6900 50  0001 C CNN
F 3 "" H 4850 6900 50  0001 C CNN
	1    4850 6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 6850 4850 6900
$Comp
L Amplifier_Operational:TL082 U1
U 3 1 5EB5B5A0
P 3100 6650
F 0 "U1" H 3100 6700 50  0000 L CNN
F 1 "TL082" H 3100 6550 50  0000 L CNN
F 2 "" H 3100 6650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 3100 6650 50  0001 C CNN
	3    3100 6650
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM4562 U4
U 1 1 5EB5C4EC
P 6400 6500
F 0 "U4" H 6400 6700 50  0000 L CNN
F 1 "LM4562" H 6350 6800 50  0000 L CNN
F 2 "" H 6400 6500 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm4562.pdf" H 6400 6500 50  0001 C CNN
	1    6400 6500
	1    0    0    -1  
$EndComp
Text Notes 12300 5750 0    59   Italic 12
ADC internal
Wire Notes Line
	12900 5600 11950 5600
Wire Notes Line
	12900 6450 12900 5600
Wire Notes Line
	11950 6450 12900 6450
Wire Notes Line
	11950 5600 11950 6450
$Comp
L power:GND #PWR012
U 1 1 5E65CE66
P 12400 6200
F 0 "#PWR012" H 12400 5950 50  0001 C CNN
F 1 "GND" H 12405 6027 50  0000 C CNN
F 2 "" H 12400 6200 50  0001 C CNN
F 3 "" H 12400 6200 50  0001 C CNN
	1    12400 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	12000 5800 11900 5800
Wire Wire Line
	12400 5800 12400 5900
Wire Wire Line
	12300 5800 12400 5800
$Comp
L Device:C Cadc1
U 1 1 5E654634
P 12400 6050
F 0 "Cadc1" H 12285 6004 50  0000 R CNN
F 1 "10pf" H 12285 6095 50  0000 R CNN
F 2 "Capacitors_THT:C_Disc_D8.0mm_W5.0mm_P7.50mm" H 12438 5900 50  0001 C CNN
F 3 "~" H 12400 6050 50  0001 C CNN
	1    12400 6050
	-1   0    0    1   
$EndComp
$Comp
L Device:R Radc1
U 1 1 5E653FDE
P 12150 5800
F 0 "Radc1" V 12050 5700 50  0000 L CNN
F 1 "2.5K" V 12250 5700 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 12080 5800 50  0001 C CNN
F 3 "~" H 12150 5800 50  0001 C CNN
	1    12150 5800
	0    1    1    0   
$EndComp
Text GLabel 11900 5800 0    50   Input ~ 0
ADCinput
Wire Wire Line
	5700 6400 6100 6400
Connection ~ 5700 6400
Wire Wire Line
	6100 6600 6050 6600
Wire Wire Line
	6050 6600 6050 6800
Wire Wire Line
	6050 6800 6750 6800
Wire Wire Line
	6750 6800 6750 6500
Wire Wire Line
	6750 6500 6700 6500
Wire Notes Line
	4950 3950 4950 5900
Wire Notes Line
	4650 3950 4650 5900
Wire Notes Line
	7300 3950 4950 3950
Wire Notes Line
	1750 3950 4650 3950
$Comp
L power:+BATT #PWR?
U 1 1 5EC40BDE
P 3000 6150
F 0 "#PWR?" H 3000 6000 50  0001 C CNN
F 1 "+BATT" H 3000 6290 50  0000 C CNN
F 2 "" H 3000 6150 50  0001 C CNN
F 3 "" H 3000 6150 50  0001 C CNN
	1    3000 6150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5EC40C63
P 3000 7100
F 0 "#PWR?" H 3000 6850 50  0001 C CNN
F 1 "GND" H 3000 6950 50  0000 C CNN
F 2 "" H 3000 7100 50  0001 C CNN
F 3 "" H 3000 7100 50  0001 C CNN
	1    3000 7100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 6950 3000 7100
Wire Wire Line
	3450 7100 3450 6950
Wire Wire Line
	3450 6350 3450 6150
Wire Wire Line
	3000 6350 3000 6150
$Comp
L Device:R Rlim2
U 1 1 5ECD8436
P 7000 6500
F 0 "Rlim2" H 7070 6546 50  0000 L CNN
F 1 "100" H 7070 6455 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 6930 6500 50  0001 C CNN
F 3 "~" H 7000 6500 50  0001 C CNN
	1    7000 6500
	0    1    1    0   
$EndComp
Wire Wire Line
	6850 6500 6750 6500
Connection ~ 6750 6500
Wire Wire Line
	7150 6500 7250 6500
Connection ~ 7250 6500
$EndSCHEMATC
