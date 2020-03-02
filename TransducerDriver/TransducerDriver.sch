EESchema Schematic File Version 4
LIBS:TransducerDriver-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
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
P 3950 1800
F 0 "Q3" H 4156 1846 50  0000 L CNN
F 1 "IRF540N" H 4156 1755 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 4200 1725 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 3950 1800 50  0001 L CNN
	1    3950 1800
	1    0    0    -1  
$EndComp
$Comp
L Device:Transformer_SP_1S T1
U 1 1 5E2CAB9F
P 5050 2050
F 0 "T1" H 5050 1600 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 5050 1750 50  0000 C CNN
F 2 "Transformers_THT:Transformer_Toroid_Tapped_Horizontal_D14.0mm_Amidon-T50" H 5050 2050 50  0001 C CNN
F 3 "~" H 5050 2050 50  0001 C CNN
	1    5050 2050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5E2CABB7
P 4050 2000
F 0 "#PWR0106" H 4050 1750 50  0001 C CNN
F 1 "GND" H 4050 1850 50  0000 C CNN
F 2 "" H 4050 2000 50  0001 C CNN
F 3 "" H 4050 2000 50  0001 C CNN
	1    4050 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 1850 5750 1900
Wire Wire Line
	5750 2200 5750 2250
$Comp
L Device:Crystal Y1
U 1 1 5E322B30
P 1050 4350
F 0 "Y1" V 1004 4481 50  0000 L CNN
F 1 "Crystal" V 1095 4481 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 1050 4350 50  0001 C CNN
F 3 "~" H 1050 4350 50  0001 C CNN
	1    1050 4350
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 4200 1050 3950
Wire Wire Line
	1050 4500 1050 4700
Wire Notes Line
	1500 3750 1500 4800
Wire Notes Line
	1500 4800 800  4800
Wire Notes Line
	800  4800 800  3750
Wire Notes Line
	800  3750 1500 3750
Text Notes 750  4250 0    50   ~ 0
Fish Finder
$Comp
L pspice:DIODE D1
U 1 1 5E32C473
P 8950 3800
F 0 "D1" H 8950 4065 50  0000 C CNN
F 1 "1N4148" H 8950 3974 50  0000 C CNN
F 2 "Diodes_THT:D_5W_P12.70mm_Horizontal" H 8950 3800 50  0001 C CNN
F 3 "~" H 8950 3800 50  0001 C CNN
	1    8950 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R Renv1
U 1 1 5E33632E
P 9550 4100
F 0 "Renv1" H 9620 4146 50  0000 L CNN
F 1 "2K" H 9620 4055 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 9480 4100 50  0001 C CNN
F 3 "~" H 9550 4100 50  0001 C CNN
	1    9550 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3800 9250 3800
Wire Wire Line
	9550 3800 9550 3950
Connection ~ 9250 3800
$Comp
L power:GND #PWR0108
U 1 1 5E3386A0
P 9400 4400
F 0 "#PWR0108" H 9400 4150 50  0001 C CNN
F 1 "GND" H 9405 4227 50  0000 C CNN
F 2 "" H 9400 4400 50  0001 C CNN
F 3 "" H 9400 4400 50  0001 C CNN
	1    9400 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4400 9400 4400
Wire Wire Line
	9550 4250 9550 4400
Wire Wire Line
	9550 4400 9400 4400
Connection ~ 9400 4400
Text Notes 550  750  0    157  ~ 31
Transmitter
Text Notes 500  3600 0    157  ~ 31
Receiver
$Comp
L power:+BATT #PWR0112
U 1 1 5E39A4A0
P 4600 1050
F 0 "#PWR0112" H 4600 900 50  0001 C CNN
F 1 "+BATT" H 4600 1190 50  0000 C CNN
F 2 "" H 4600 1050 50  0001 C CNN
F 3 "" H 4600 1050 50  0001 C CNN
	1    4600 1050
	1    0    0    -1  
$EndComp
Text GLabel 1700 1950 0    50   Input ~ 0
ModSig+
$Comp
L Transistor_FET:IRF540N Q4
U 1 1 5E3D6FE3
P 3950 2500
F 0 "Q4" H 4156 2546 50  0000 L CNN
F 1 "IRF540N" H 4156 2455 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 4200 2425 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 3950 2500 50  0001 L CNN
	1    3950 2500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5E3D6FEA
P 4050 2700
F 0 "#PWR0113" H 4050 2450 50  0001 C CNN
F 1 "GND" H 4050 2550 50  0000 C CNN
F 2 "" H 4050 2700 50  0001 C CNN
F 3 "" H 4050 2700 50  0001 C CNN
	1    4050 2700
	1    0    0    -1  
$EndComp
Text GLabel 1700 2250 0    50   Input ~ 0
ModSig-
Wire Wire Line
	4050 1600 4500 1600
Wire Wire Line
	4500 1600 4500 1850
$Comp
L Device:Crystal Y2
U 1 1 5E3EC002
P 5750 2050
F 0 "Y2" V 5704 2181 50  0000 L CNN
F 1 "Fish Finder" V 5795 2181 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 5750 2050 50  0001 C CNN
F 3 "~" H 5750 2050 50  0001 C CNN
	1    5750 2050
	0    1    1    0   
$EndComp
$Comp
L Device:Crystal Ym1
U 1 1 5E401928
P 6550 1350
F 0 "Ym1" V 6504 1481 50  0000 L CNN
F 1 "FishFinder" V 6595 1481 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 6550 1350 50  0001 C CNN
F 3 "~" H 6550 1350 50  0001 C CNN
	1    6550 1350
	0    1    1    0   
$EndComp
$Comp
L Device:R Rm1
U 1 1 5E401A59
P 6800 1150
F 0 "Rm1" V 6880 1150 50  0000 C CNN
F 1 "1K" V 6800 1150 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6730 1150 50  0001 C CNN
F 3 "~" H 6800 1150 50  0001 C CNN
	1    6800 1150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6650 1150 6550 1150
Wire Wire Line
	6550 1150 6550 1200
$Comp
L power:GND #PWR0110
U 1 1 5E403967
P 6550 1550
F 0 "#PWR0110" H 6550 1300 50  0001 C CNN
F 1 "GND" H 6550 1400 50  0000 C CNN
F 2 "" H 6550 1550 50  0001 C CNN
F 3 "" H 6550 1550 50  0001 C CNN
	1    6550 1550
	1    0    0    -1  
$EndComp
Text GLabel 7200 1150 2    50   Input ~ 0
Vin
Text GLabel 7000 1100 1    50   Input ~ 0
Prob1
Text GLabel 6550 1100 1    50   Input ~ 0
Prob2
Wire Wire Line
	7000 1100 7000 1150
Connection ~ 7000 1150
Wire Wire Line
	7000 1150 6950 1150
Wire Wire Line
	6550 1100 6550 1150
Connection ~ 6550 1150
Text Notes 6450 1850 0    39   ~ 0
Impedance Measure Circuit
Wire Wire Line
	7000 1150 7200 1150
$Comp
L Device:C_Small C3
U 1 1 5E420E5F
P 1850 3950
F 0 "C3" H 1860 4020 50  0000 L CNN
F 1 "0.1u" H 1860 3870 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1850 3950 50  0001 C CNN
F 3 "~" H 1850 3950 50  0001 C CNN
	1    1850 3950
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5E420F89
P 1850 4700
F 0 "C4" H 1860 4770 50  0000 L CNN
F 1 "0.1u" H 1860 4620 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1850 4700 50  0001 C CNN
F 3 "~" H 1850 4700 50  0001 C CNN
	1    1850 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 3950 1750 3950
Wire Wire Line
	1750 4700 1050 4700
Text Notes 6400 700  0    157  ~ 31
Measure
$Comp
L TransducerDriver-rescue:TC427-Driver_FET U3
U 1 1 5E424709
P 2850 2100
F 0 "U3" H 2850 2150 50  0000 C CNN
F 1 "TC427" H 2850 2050 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_LongPads" H 2850 2100 50  0001 C CNN
F 3 "" H 2850 2100 50  0001 C CNN
	1    2850 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0111
U 1 1 5E4247E1
P 2850 1050
F 0 "#PWR0111" H 2850 900 50  0001 C CNN
F 1 "+BATT" H 2850 1190 50  0000 C CNN
F 2 "" H 2850 1050 50  0001 C CNN
F 3 "" H 2850 1050 50  0001 C CNN
	1    2850 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 5E4249CF
P 2850 1200
F 0 "D2" H 2850 1300 50  0000 C CNN
F 1 "1N4007" H 2850 1100 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P10.16mm_Horizontal" H 2850 1200 50  0001 C CNN
F 3 "~" H 2850 1200 50  0001 C CNN
	1    2850 1200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5E42756F
P 2850 2700
F 0 "#PWR0114" H 2850 2450 50  0001 C CNN
F 1 "GND" H 2850 2550 50  0000 C CNN
F 2 "" H 2850 2700 50  0001 C CNN
F 3 "" H 2850 2700 50  0001 C CNN
	1    2850 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 2650 2850 2700
Wire Wire Line
	2200 2200 1900 2200
Wire Wire Line
	3750 2000 3750 1800
Wire Wire Line
	3500 2200 3550 2200
Wire Wire Line
	3750 2200 3750 2500
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 5E4375EA
P 1200 1300
F 0 "J2" H 1200 1500 50  0000 C CNN
F 1 "BattJack+" H 1200 1400 50  0000 C CNN
F 2 "" H 1200 1300 50  0001 C CNN
F 3 "~" H 1200 1300 50  0001 C CNN
	1    1200 1300
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5E437676
P 1050 2050
F 0 "J1" H 1050 2150 50  0000 C CNN
F 1 "ModSigJack" H 1050 1850 50  0000 C CNN
F 2 "" H 1050 2050 50  0001 C CNN
F 3 "~" H 1050 2050 50  0001 C CNN
	1    1050 2050
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5E437AD1
P 1200 1450
F 0 "J3" H 1200 1250 50  0000 C CNN
F 1 "BattJack-" H 1200 1350 50  0000 C CNN
F 2 "" H 1200 1450 50  0001 C CNN
F 3 "~" H 1200 1450 50  0001 C CNN
	1    1200 1450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5E437B27
P 1700 1500
F 0 "#PWR0115" H 1700 1250 50  0001 C CNN
F 1 "GND" H 1700 1350 50  0000 C CNN
F 2 "" H 1700 1500 50  0001 C CNN
F 3 "" H 1700 1500 50  0001 C CNN
	1    1700 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1450 1700 1450
Wire Wire Line
	1700 1450 1700 1500
$Comp
L power:+BATT #PWR0116
U 1 1 5E439689
P 1700 1250
F 0 "#PWR0116" H 1700 1100 50  0001 C CNN
F 1 "+BATT" H 1700 1390 50  0000 C CNN
F 2 "" H 1700 1250 50  0001 C CNN
F 3 "" H 1700 1250 50  0001 C CNN
	1    1700 1250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 1300 1700 1300
Wire Wire Line
	1700 1300 1700 1250
Wire Wire Line
	1250 2050 1750 2050
Wire Wire Line
	1750 2050 1750 2000
Wire Wire Line
	1750 2000 2100 2000
Wire Wire Line
	1250 2150 1750 2150
Wire Wire Line
	1750 2150 1750 2200
Wire Wire Line
	6550 1500 6550 1550
$Comp
L Amplifier_Operational:LM4562 U4
U 3 1 5E41FD78
P 7200 4150
F 0 "U4" H 7158 4196 50  0000 L CNN
F 1 "LM4562" H 7158 4105 50  0000 L CNN
F 2 "" H 7200 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm4562.pdf" H 7200 4150 50  0001 C CNN
	3    7200 4150
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR010
U 1 1 5E42A3DB
P 7100 3850
F 0 "#PWR010" H 7100 3700 50  0001 C CNN
F 1 "+BATT" H 7100 3990 50  0000 C CNN
F 2 "" H 7100 3850 50  0001 C CNN
F 3 "" H 7100 3850 50  0001 C CNN
	1    7100 3850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5E42A52F
P 7100 4450
F 0 "#PWR011" H 7100 4200 50  0001 C CNN
F 1 "GND" H 7100 4300 50  0000 C CNN
F 2 "" H 7100 4450 50  0001 C CNN
F 3 "" H 7100 4450 50  0001 C CNN
	1    7100 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small Cgnd2
U 1 1 5E42F28D
P 5600 4900
F 0 "Cgnd2" H 5650 4950 50  0000 L CNN
F 1 "0.1u" H 5650 4850 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5600 4900 50  0001 C CNN
F 3 "~" H 5600 4900 50  0001 C CNN
	1    5600 4900
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5E43060C
P 5600 5000
F 0 "#PWR09" H 5600 4750 50  0001 C CNN
F 1 "GND" H 5605 4827 50  0000 C CNN
F 2 "" H 5600 5000 50  0001 C CNN
F 3 "" H 5600 5000 50  0001 C CNN
	1    5600 5000
	1    0    0    -1  
$EndComp
$Comp
L TransducerDriver-rescue:INA217-Amplifier_Instrumentation U2
U 1 1 5E439FD5
P 3300 4300
F 0 "U2" H 3300 4250 50  0000 C CNN
F 1 "INA217-Amplifier_Instrumentation" H 3250 5150 50  0000 C CNN
F 2 "" H 3300 4300 50  0001 C CNN
F 3 "" H 3300 4300 50  0001 C CNN
	1    3300 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:R Rgain1
U 1 1 5E43A64E
P 2500 4300
F 0 "Rgain1" H 2570 4346 50  0000 L CNN
F 1 "101" H 2570 4255 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2430 4300 50  0001 C CNN
F 3 "~" H 2500 4300 50  0001 C CNN
	1    2500 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 4150 2500 4100
Wire Wire Line
	2500 4100 2750 4100
Wire Wire Line
	2500 4450 2500 4500
Wire Wire Line
	2500 4500 2750 4500
$Comp
L power:+BATT #PWR06
U 1 1 5E448DDE
P 3200 3700
F 0 "#PWR06" H 3200 3550 50  0001 C CNN
F 1 "+BATT" H 3200 3850 50  0000 C CNN
F 2 "" H 3200 3700 50  0001 C CNN
F 3 "" H 3200 3700 50  0001 C CNN
	1    3200 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5E449082
P 3200 4750
F 0 "#PWR07" H 3200 4500 50  0001 C CNN
F 1 "GND" H 3200 4600 50  0000 C CNN
F 2 "" H 3200 4750 50  0001 C CNN
F 3 "" H 3200 4750 50  0001 C CNN
	1    3200 4750
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL082 U1
U 1 1 5E449313
P 3150 6300
F 0 "U1" H 3150 6500 50  0000 L CNN
F 1 "TL082" H 3150 6100 50  0000 L CNN
F 2 "" H 3150 6300 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 3150 6300 50  0001 C CNN
	1    3150 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6300 3500 6300
Wire Wire Line
	3500 6300 3500 6550
Wire Wire Line
	3500 6550 2800 6550
Wire Wire Line
	2800 6550 2800 6400
Wire Wire Line
	2800 6400 2850 6400
$Comp
L Device:R Rb1
U 1 1 5E44B20F
P 2300 6050
F 0 "Rb1" H 2370 6096 50  0000 L CNN
F 1 "5K" H 2370 6005 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2230 6050 50  0001 C CNN
F 3 "~" H 2300 6050 50  0001 C CNN
	1    2300 6050
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR04
U 1 1 5E44B4D8
P 2300 5900
F 0 "#PWR04" H 2300 5750 50  0001 C CNN
F 1 "+BATT" H 2300 6040 50  0000 C CNN
F 2 "" H 2300 5900 50  0001 C CNN
F 3 "" H 2300 5900 50  0001 C CNN
	1    2300 5900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E44D202
P 2300 6700
F 0 "#PWR05" H 2300 6450 50  0001 C CNN
F 1 "GND" H 2300 6550 50  0000 C CNN
F 2 "" H 2300 6700 50  0001 C CNN
F 3 "" H 2300 6700 50  0001 C CNN
	1    2300 6700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 6200 2700 6200
Text GLabel 3850 6300 2    50   Input ~ 0
Vref
$Comp
L Device:R Rbias1
U 1 1 5E45D34E
P 2050 4200
F 0 "Rbias1" H 2120 4246 50  0000 L CNN
F 1 "2.2K" H 2120 4155 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 1980 4200 50  0001 C CNN
F 3 "~" H 2050 4200 50  0001 C CNN
	1    2050 4200
	1    0    0    -1  
$EndComp
$Comp
L Device:R Rbias2
U 1 1 5E45D515
P 2050 4950
F 0 "Rbias2" H 2120 4996 50  0000 L CNN
F 1 "2.2K" H 2120 4905 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 1980 4950 50  0001 C CNN
F 3 "~" H 2050 4950 50  0001 C CNN
	1    2050 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4700 2050 4700
Wire Wire Line
	2050 4700 2050 4800
Wire Wire Line
	1950 3950 2050 3950
Wire Wire Line
	2050 3950 2050 4050
Wire Wire Line
	2050 3950 2750 3950
Connection ~ 2050 3950
Wire Wire Line
	2750 4700 2050 4700
Connection ~ 2050 4700
Text GLabel 3550 4700 0    50   Input ~ 0
Vref
$Comp
L Device:R Rbuf1
U 1 1 5E470BDE
P 3650 6300
F 0 "Rbuf1" V 3550 6200 50  0000 L CNN
F 1 "10ohm" V 3750 6200 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3580 6300 50  0001 C CNN
F 3 "~" H 3650 6300 50  0001 C CNN
	1    3650 6300
	0    1    1    0   
$EndComp
Connection ~ 3500 6300
Wire Wire Line
	3800 6300 3850 6300
Text Notes 3400 6900 0    50   ~ 0
small resistor \nRbuf1 prevernt \nopamp unstable
$Comp
L Device:C_Small Cb1
U 1 1 5E474862
P 2700 6400
F 0 "Cb1" H 2710 6470 50  0000 L CNN
F 1 "10nF" H 2710 6320 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2700 6400 50  0001 C CNN
F 3 "~" H 2700 6400 50  0001 C CNN
	1    2700 6400
	-1   0    0    1   
$EndComp
Wire Wire Line
	2300 6550 2300 6650
Wire Wire Line
	2700 6200 2700 6300
Connection ~ 2700 6200
Wire Wire Line
	2700 6200 2850 6200
Wire Wire Line
	2700 6500 2700 6650
Wire Wire Line
	2700 6650 2300 6650
Connection ~ 2300 6650
Wire Wire Line
	2300 6650 2300 6700
Text Notes 1750 3800 0    50   ~ 0
bias current \nsupply\n0.1uF 2.2Kohm\nFc = 4.5Khz
Text GLabel 4050 4300 2    50   Input ~ 0
Stage1Out
Wire Wire Line
	3900 4300 4050 4300
$Comp
L Amplifier_Operational:LM4562 U4
U 2 1 5E4C56D5
P 6050 4650
F 0 "U4" H 6050 4850 50  0000 L CNN
F 1 "LM4562" H 6000 4950 50  0000 L CNN
F 2 "" H 6050 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm4562.pdf" H 6050 4650 50  0001 C CNN
	2    6050 4650
	1    0    0    1   
$EndComp
Text GLabel 5050 4300 0    50   Input ~ 0
Stage1Out
$Comp
L Device:C_Small C2In2
U 1 1 5E4C92CC
P 5200 4300
F 0 "C2In2" V 5400 4250 50  0000 L CNN
F 1 "0.1u" V 5300 4250 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5200 4300 50  0001 C CNN
F 3 "~" H 5200 4300 50  0001 C CNN
	1    5200 4300
	0    1    -1   0   
$EndComp
$Comp
L Device:R R2G1
U 1 1 5E4C948E
P 5500 4300
F 0 "R2G1" V 5400 4200 50  0000 L CNN
F 1 "1Kohm" V 5600 4200 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5430 4300 50  0001 C CNN
F 3 "~" H 5500 4300 50  0001 C CNN
	1    5500 4300
	0    1    1    0   
$EndComp
$Comp
L Device:R R2F1
U 1 1 5E4C95AC
P 6000 4200
F 0 "R2F1" V 5900 4100 50  0000 L CNN
F 1 "100Kohm" V 6100 4050 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5930 4200 50  0001 C CNN
F 3 "~" H 6000 4200 50  0001 C CNN
	1    6000 4200
	0    1    1    0   
$EndComp
Text Notes 3800 4100 0    50   ~ 0
6Kohm Internal \nR. Is it High \noutput Impedance?
Text Notes 5000 3950 0    50   ~ 0
10Khz HP filter\n0.1uF 1Kohm
Wire Wire Line
	5650 4300 5700 4300
Wire Wire Line
	5700 4300 5700 4550
Wire Wire Line
	5700 4550 5750 4550
Wire Wire Line
	5700 4200 5700 4300
Connection ~ 5700 4300
Wire Wire Line
	5700 4200 5750 4200
Wire Wire Line
	6150 4200 6250 4200
Wire Wire Line
	6400 4200 6400 4650
Wire Wire Line
	6400 4650 6350 4650
Text GLabel 5400 4750 0    50   Input ~ 0
Vref
Text GLabel 8350 3800 0    50   Input ~ 0
Stage2Out
Text GLabel 6400 4200 2    50   Input ~ 0
Stage2Out
Wire Wire Line
	5400 4750 5600 4750
Wire Wire Line
	5600 4800 5600 4750
Connection ~ 5600 4750
Wire Wire Line
	5600 4750 5750 4750
Wire Notes Line
	2100 5700 2100 7050
Wire Notes Line
	2100 7050 4100 7050
Wire Notes Line
	4100 7050 4100 5700
Wire Notes Line
	4100 5700 2100 5700
Text Notes 3450 5900 0    67   Italic 13
Vref Gen
Text Notes 4600 5200 0    67   Italic 13
Inverting
Wire Notes Line
	6950 3600 4600 3600
Wire Wire Line
	5300 4300 5350 4300
Wire Wire Line
	5050 4300 5100 4300
Wire Notes Line
	4600 6850 6950 6850
Wire Notes Line
	4600 3600 4600 6850
Wire Notes Line
	6950 3600 6950 6850
Wire Notes Line
	4550 3350 4550 5350
Wire Notes Line
	4550 5350 1650 5350
Wire Notes Line
	1650 5350 1650 3350
Wire Notes Line
	1650 3350 4550 3350
Text Notes 3800 5100 0    67   Italic 13
First Stage \nDiff Amp
Text Notes 4600 3550 0    67   Italic 13
Second stage
$Comp
L Device:D_Zener Dz1
U 1 1 5E645861
P 10150 4250
F 0 "Dz1" V 10150 4400 50  0000 C CNN
F 1 "3.3V" V 10250 4400 50  0000 C CNN
F 2 "" H 10150 4250 50  0001 C CNN
F 3 "~" H 10150 4250 50  0001 C CNN
	1    10150 4250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5E64625D
P 10150 4400
F 0 "#PWR014" H 10150 4150 50  0001 C CNN
F 1 "GND" H 10155 4227 50  0000 C CNN
F 2 "" H 10150 4400 50  0001 C CNN
F 3 "" H 10150 4400 50  0001 C CNN
	1    10150 4400
	1    0    0    -1  
$EndComp
Text GLabel 10250 3900 2    50   Input ~ 0
ADCinput
Wire Wire Line
	10150 4100 10150 3800
Text GLabel 8700 5500 0    50   Input ~ 0
ADCinput
$Comp
L Device:R Radc1
U 1 1 5E653FDE
P 8950 5500
F 0 "Radc1" V 8850 5400 50  0000 L CNN
F 1 "2.5K" V 9050 5400 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 8880 5500 50  0001 C CNN
F 3 "~" H 8950 5500 50  0001 C CNN
	1    8950 5500
	0    1    1    0   
$EndComp
$Comp
L Device:C Cadc1
U 1 1 5E654634
P 9200 5750
F 0 "Cadc1" H 9085 5704 50  0000 R CNN
F 1 "10pf" H 9085 5795 50  0000 R CNN
F 2 "Capacitors_THT:C_Disc_D8.0mm_W5.0mm_P7.50mm" H 9238 5600 50  0001 C CNN
F 3 "~" H 9200 5750 50  0001 C CNN
	1    9200 5750
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 5500 9200 5500
Wire Wire Line
	9200 5500 9200 5600
Wire Wire Line
	8800 5500 8700 5500
$Comp
L power:GND #PWR012
U 1 1 5E65CE66
P 9200 5900
F 0 "#PWR012" H 9200 5650 50  0001 C CNN
F 1 "GND" H 9205 5727 50  0000 C CNN
F 2 "" H 9200 5900 50  0001 C CNN
F 3 "" H 9200 5900 50  0001 C CNN
	1    9200 5900
	1    0    0    -1  
$EndComp
Wire Notes Line
	8750 5300 8750 6150
Wire Notes Line
	8750 6150 9700 6150
Wire Notes Line
	9700 6150 9700 5300
Wire Notes Line
	9700 5300 8750 5300
Text Notes 9100 5450 0    59   Italic 12
ADC internal
Wire Wire Line
	9250 3800 9250 4000
Wire Wire Line
	9250 4200 9250 4400
$Comp
L Device:C_Small C2out1
U 1 1 5E67C655
P 8550 3800
F 0 "C2out1" V 8750 3650 50  0000 L CNN
F 1 "0.1u" V 8650 3700 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 8550 3800 50  0001 C CNN
F 3 "~" H 8550 3800 50  0001 C CNN
	1    8550 3800
	0    1    -1   0   
$EndComp
Wire Wire Line
	8350 3800 8450 3800
Wire Wire Line
	8650 3800 8700 3800
Wire Notes Line
	9650 3850 10100 3850
Wire Notes Line
	10100 3850 10100 3450
Wire Notes Line
	10100 3450 9650 3450
Wire Notes Line
	9650 3850 9650 3450
Text Notes 9700 3750 0    50   ~ 0
Potential\nVariable \nGain
Wire Wire Line
	9550 3800 10150 3800
Connection ~ 9550 3800
Connection ~ 10150 3800
Text Notes 7950 3700 0    67   Italic 13
Envelope\nDetector
Wire Notes Line
	7850 3350 10650 3350
Wire Notes Line
	10650 3350 10650 4900
Wire Notes Line
	10650 4900 7850 4900
Wire Notes Line
	7850 4900 7850 3350
$Comp
L Connector:Conn_01x01_Male Jadc1
U 1 1 5E73AA78
P 10550 3800
F 0 "Jadc1" H 10650 3650 50  0000 C CNN
F 1 "connADC" H 10650 3700 50  0000 C CNN
F 2 "" H 10550 3800 50  0001 C CNN
F 3 "~" H 10550 3800 50  0001 C CNN
	1    10550 3800
	-1   0    0    1   
$EndComp
Wire Wire Line
	10150 3800 10200 3800
Wire Wire Line
	10250 3900 10200 3900
Wire Wire Line
	10200 3900 10200 3800
Connection ~ 10200 3800
Wire Wire Line
	10200 3800 10350 3800
$Comp
L Device:D_Zener Dz3
U 1 1 5E778073
P 2100 2450
F 0 "Dz3" V 2100 2600 50  0000 C CNN
F 1 "3.3V" V 2200 2600 50  0000 C CNN
F 2 "" H 2100 2450 50  0001 C CNN
F 3 "~" H 2100 2450 50  0001 C CNN
	1    2100 2450
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener Dz2
U 1 1 5E77C71B
P 1900 2450
F 0 "Dz2" V 1900 2600 50  0000 C CNN
F 1 "3.3V" V 2000 2600 50  0000 C CNN
F 2 "" H 1900 2450 50  0001 C CNN
F 3 "~" H 1900 2450 50  0001 C CNN
	1    1900 2450
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E780F88
P 2000 2700
F 0 "#PWR01" H 2000 2450 50  0001 C CNN
F 1 "GND" H 2000 2550 50  0000 C CNN
F 2 "" H 2000 2700 50  0001 C CNN
F 3 "" H 2000 2700 50  0001 C CNN
	1    2000 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 2300 2100 2000
Connection ~ 2100 2000
Wire Wire Line
	2100 2000 2200 2000
Wire Wire Line
	1900 2300 1900 2200
Connection ~ 1900 2200
Wire Wire Line
	1900 2200 1750 2200
Wire Wire Line
	1750 2000 1750 1950
Wire Wire Line
	1750 1950 1700 1950
Connection ~ 1750 2000
Wire Wire Line
	1750 2200 1750 2250
Wire Wire Line
	1750 2250 1700 2250
Connection ~ 1750 2200
Wire Wire Line
	2000 2700 2000 2650
Wire Wire Line
	2000 2650 2100 2650
Wire Wire Line
	2100 2650 2100 2600
Wire Wire Line
	2000 2650 1900 2650
Wire Wire Line
	1900 2650 1900 2600
Connection ~ 2000 2650
Wire Notes Line
	500  3250 11200 3250
Wire Wire Line
	4600 2050 4650 2050
Wire Wire Line
	4650 2250 4050 2250
Wire Wire Line
	4050 2250 4050 2300
Text Notes 7150 1350 0    50   ~ 0
sine wave input
$Comp
L Device:C_Small Cb2
U 1 1 5E46F193
P 3550 3800
F 0 "Cb2" H 3560 3870 50  0000 L CNN
F 1 "0.1uF" H 3560 3720 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3550 3800 50  0001 C CNN
F 3 "~" H 3550 3800 50  0001 C CNN
	1    3550 3800
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5E46FBDA
P 3550 3900
F 0 "#PWR02" H 3550 3650 50  0001 C CNN
F 1 "GND" H 3550 3750 50  0000 C CNN
F 2 "" H 3550 3900 50  0001 C CNN
F 3 "" H 3550 3900 50  0001 C CNN
	1    3550 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3700 3200 3850
Connection ~ 3200 3700
Wire Wire Line
	3200 3700 3550 3700
Wire Wire Line
	5450 2250 5750 2250
Text GLabel 2000 4400 0    50   Input ~ 0
Vref
Wire Wire Line
	2050 4350 2050 4400
Wire Wire Line
	2050 4400 2000 4400
Text GLabel 2000 5150 0    50   Input ~ 0
Vref
Wire Wire Line
	2050 5100 2050 5150
Wire Wire Line
	2050 5150 2000 5150
Wire Wire Line
	3550 4550 3550 4700
$Comp
L Device:D_Zener_Small Dvref1
U 1 1 5E4B2E88
P 2300 6450
F 0 "Dvref1" H 2300 6540 50  0000 C CNN
F 1 "6V IN4735" H 2300 6360 50  0000 C CNN
F 2 "" V 2300 6450 50  0001 C CNN
F 3 "~" V 2300 6450 50  0001 C CNN
	1    2300 6450
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 6200 2300 6350
Connection ~ 2300 6200
Text Notes 2650 6950 0    50   ~ 0
Zener diode to\n avoide power \nsupply ripple 
$Comp
L Device:Transformer_SP_1S Tm1
U 1 1 5E4C6765
P 6950 2500
F 0 "Tm1" H 6950 2050 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 6950 2200 50  0000 C CNN
F 2 "Transformers_THT:Transformer_Toroid_Tapped_Horizontal_D14.0mm_Amidon-T50" H 6950 2500 50  0001 C CNN
F 3 "~" H 6950 2500 50  0001 C CNN
	1    6950 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2300 6450 2300
Wire Wire Line
	6450 2300 6450 2700
Wire Wire Line
	6450 2700 6550 2700
Text GLabel 7750 2300 2    50   Input ~ 0
Vin
Wire Wire Line
	7400 2300 7350 2300
$Comp
L power:GND #PWR03
U 1 1 5E4E9786
P 7500 2800
F 0 "#PWR03" H 7500 2550 50  0001 C CNN
F 1 "GND" H 7500 2650 50  0000 C CNN
F 2 "" H 7500 2800 50  0001 C CNN
F 3 "" H 7500 2800 50  0001 C CNN
	1    7500 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2700 7500 2700
Wire Wire Line
	7500 2700 7500 2800
$Comp
L Device:R Rm2
U 1 1 5E4FEBB6
P 7550 2300
F 0 "Rm2" V 7630 2300 50  0000 C CNN
F 1 "200" V 7550 2300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 7480 2300 50  0001 C CNN
F 3 "~" H 7550 2300 50  0001 C CNN
	1    7550 2300
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7750 2300 7700 2300
Text GLabel 7700 2200 1    50   Input ~ 0
Prob1
Text GLabel 7350 2200 1    50   Input ~ 0
Prob2
Wire Wire Line
	7350 2200 7350 2300
Connection ~ 7350 2300
Wire Wire Line
	7700 2200 7700 2300
Connection ~ 7700 2300
$Comp
L Device:Transformer_SP_1S T2
U 1 1 5E55647C
P 8900 1250
F 0 "T2" H 8900 800 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 8900 950 50  0000 C CNN
F 2 "Transformers_THT:Transformer_Toroid_Tapped_Horizontal_D14.0mm_Amidon-T50" H 8900 1250 50  0001 C CNN
F 3 "~" H 8900 1250 50  0001 C CNN
	1    8900 1250
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y3
U 1 1 5E556485
P 10350 1300
F 0 "Y3" V 10304 1431 50  0000 L CNN
F 1 "FishFinder" V 10395 1431 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 10350 1300 50  0001 C CNN
F 3 "~" H 10350 1300 50  0001 C CNN
	1    10350 1300
	0    1    1    0   
$EndComp
Wire Notes Line
	5600 1800 6150 1800
Wire Notes Line
	6150 1800 6150 2300
Wire Notes Line
	6150 2300 5600 2300
Wire Notes Line
	5600 2300 5600 1800
Wire Notes Line
	6350 450  6350 3250
Wire Notes Line
	9500 900  9600 900 
Wire Notes Line
	9600 900  9600 1600
Wire Notes Line
	9600 1600 9500 1600
Text Notes 9300 1000 0    50   ~ 0
Zsource
Wire Notes Line
	9850 900  9750 900 
Wire Notes Line
	9750 900  9750 1600
Wire Notes Line
	9750 1600 9850 1600
Text Notes 9800 1000 0    50   ~ 0
Zload=Zfish+Zmatch
Wire Wire Line
	10350 1050 10350 1150
Wire Wire Line
	9300 1450 10350 1450
Text Notes 9250 1750 0    50   ~ 0
Zmatch = Zsource - Zfish
Text Notes 6900 3100 0    39   ~ 0
Impedance Measure Circuit
$Comp
L Device:R Rm4
U 1 1 5E59E5EC
P 10050 1050
F 0 "Rm4" V 10050 1000 50  0000 L CNN
F 1 "Zmatch" V 10150 900 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 9980 1050 50  0001 C CNN
F 3 "~" H 10050 1050 50  0001 C CNN
	1    10050 1050
	0    1    1    0   
$EndComp
Wire Wire Line
	10350 1050 10200 1050
Wire Wire Line
	9900 1050 9300 1050
Wire Notes Line
	8150 450  8150 3250
$Comp
L Device:Transformer_SP_1S T3
U 1 1 5E600361
P 8900 2400
F 0 "T3" H 8900 1950 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 8900 2100 50  0000 C CNN
F 2 "Transformers_THT:Transformer_Toroid_Tapped_Horizontal_D14.0mm_Amidon-T50" H 8900 2400 50  0001 C CNN
F 3 "~" H 8900 2400 50  0001 C CNN
	1    8900 2400
	1    0    0    -1  
$EndComp
$Comp
L Device:Crystal Y4
U 1 1 5E600368
P 10350 2450
F 0 "Y4" V 10304 2581 50  0000 L CNN
F 1 "FishFinder" V 10395 2581 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 10350 2450 50  0001 C CNN
F 3 "~" H 10350 2450 50  0001 C CNN
	1    10350 2450
	0    1    1    0   
$EndComp
Wire Notes Line
	9500 2050 9600 2050
Wire Notes Line
	9600 2050 9600 2750
Wire Notes Line
	9600 2750 9500 2750
Text Notes 9300 2150 0    50   ~ 0
Zsource
Wire Notes Line
	9850 2050 9750 2050
Wire Notes Line
	9750 2050 9750 2750
Wire Notes Line
	9750 2750 9850 2750
Text Notes 9800 2150 0    50   ~ 0
Zload=Zfish+Zmatch
Wire Wire Line
	10350 2200 10350 2300
Wire Wire Line
	9300 2600 9950 2600
Text Notes 8750 3000 0    50   ~ 0
Zmatch = (Zsource * Zfish) / (Zfish - Zsource)
$Comp
L Device:R Rm3
U 1 1 5E60037B
P 9950 2400
F 0 "Rm3" V 9950 2300 50  0000 L CNN
F 1 "Zmatch" V 10050 2250 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 9880 2400 50  0001 C CNN
F 3 "~" H 9950 2400 50  0001 C CNN
	1    9950 2400
	-1   0    0    1   
$EndComp
Wire Wire Line
	9300 2200 9950 2200
Wire Wire Line
	9950 2250 9950 2200
Connection ~ 9950 2200
Wire Wire Line
	9950 2200 10350 2200
Wire Wire Line
	9950 2550 9950 2600
Connection ~ 9950 2600
Wire Wire Line
	9950 2600 10350 2600
Text Notes 8200 700  0    157  ~ 31
Impedance Match
Wire Wire Line
	3500 2000 3700 2000
$Comp
L Device:C_Small Cenv1
U 1 1 5E672EB5
P 9250 4100
F 0 "Cenv1" H 9260 4170 50  0000 L CNN
F 1 "0.1uF" H 9260 4020 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 9250 4100 50  0001 C CNN
F 3 "~" H 9250 4100 50  0001 C CNN
	1    9250 4100
	-1   0    0    -1  
$EndComp
Text Notes 8000 4800 0    50   ~ 0
1/80Khz = 12.5us\n1/1Khz = 1ms\npick 200us as time constant
$Comp
L Device:R Rdown1
U 1 1 5E5726AC
P 8700 4150
F 0 "Rdown1" H 8770 4196 50  0000 L CNN
F 1 "10K" H 8770 4105 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 8630 4150 50  0001 C CNN
F 3 "~" H 8700 4150 50  0001 C CNN
	1    8700 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR016
U 1 1 5E57295E
P 8700 4300
F 0 "#PWR016" H 8700 4050 50  0001 C CNN
F 1 "GND" H 8705 4127 50  0000 C CNN
F 2 "" H 8700 4300 50  0001 C CNN
F 3 "" H 8700 4300 50  0001 C CNN
	1    8700 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	8700 3800 8700 4000
Connection ~ 8700 3800
Wire Wire Line
	8700 3800 8750 3800
Text GLabel 8700 3500 1    50   Input ~ 0
Prob
Wire Wire Line
	9250 3800 9550 3800
Wire Wire Line
	8700 3500 8700 3800
$Comp
L Device:D_Small Dprot1
U 1 1 5E5CAFD9
P 3550 1600
F 0 "Dprot1" H 3400 1450 50  0000 L CNN
F 1 "1N4148" H 3400 1520 50  0000 L CNN
F 2 "" V 3550 1600 50  0001 C CNN
F 3 "~" V 3550 1600 50  0001 C CNN
	1    3550 1600
	0    1    1    0   
$EndComp
$Comp
L Device:D_Small Dprot2
U 1 1 5E5DF526
P 3700 1600
F 0 "Dprot2" H 3550 1450 50  0000 L CNN
F 1 "1N4148" H 3550 1520 50  0000 L CNN
F 2 "" V 3700 1600 50  0001 C CNN
F 3 "~" V 3700 1600 50  0001 C CNN
	1    3700 1600
	0    -1   1    0   
$EndComp
Wire Wire Line
	3700 1700 3700 2000
Connection ~ 3700 2000
Wire Wire Line
	3700 2000 3750 2000
Wire Wire Line
	3550 1700 3550 2200
Connection ~ 3550 2200
Wire Wire Line
	3550 2200 3750 2200
Wire Wire Line
	3700 1400 3700 1500
Wire Wire Line
	3550 1500 3550 1400
Wire Wire Line
	3550 1400 3700 1400
Wire Wire Line
	2850 1350 2850 1400
Wire Wire Line
	3550 1400 2850 1400
Connection ~ 3550 1400
Connection ~ 2850 1400
Wire Wire Line
	2850 1400 2850 1550
Wire Wire Line
	4500 1850 4650 1850
$Comp
L Device:L_Small Lbatt1
U 1 1 5E6493E3
P 4600 1350
F 0 "Lbatt1" H 4630 1390 50  0000 L CNN
F 1 "300uH" H 4630 1310 50  0000 L CNN
F 2 "" H 4600 1350 50  0001 C CNN
F 3 "~" H 4600 1350 50  0001 C CNN
	1    4600 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1050 4600 1100
Wire Wire Line
	4600 1450 4600 2050
$Comp
L Device:C_Small Cbp1
U 1 1 5E65A5E3
P 5000 1300
F 0 "Cbp1" H 5010 1370 50  0000 L CNN
F 1 "0.1uF" H 5010 1220 50  0000 L CNN
F 2 "" H 5000 1300 50  0001 C CNN
F 3 "~" H 5000 1300 50  0001 C CNN
	1    5000 1300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small Cbp2
U 1 1 5E65A732
P 5300 1300
F 0 "Cbp2" H 5310 1370 50  0000 L CNN
F 1 "10uF" H 5310 1220 50  0000 L CNN
F 2 "" H 5300 1300 50  0001 C CNN
F 3 "~" H 5300 1300 50  0001 C CNN
	1    5300 1300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR015
U 1 1 5E671212
P 5150 1500
F 0 "#PWR015" H 5150 1250 50  0001 C CNN
F 1 "GND" H 5150 1350 50  0000 C CNN
F 2 "" H 5150 1500 50  0001 C CNN
F 3 "" H 5150 1500 50  0001 C CNN
	1    5150 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1100 5000 1100
Wire Wire Line
	5000 1100 5000 1200
Connection ~ 4600 1100
Wire Wire Line
	4600 1100 4600 1250
Wire Wire Line
	5000 1100 5300 1100
Wire Wire Line
	5300 1100 5300 1200
Connection ~ 5000 1100
Wire Wire Line
	5300 1400 5300 1500
Wire Wire Line
	5300 1500 5150 1500
Wire Wire Line
	5150 1500 5000 1500
Wire Wire Line
	5000 1500 5000 1400
Connection ~ 5150 1500
$Comp
L Device:L_Small Lbatt?
U 1 1 5E6A00E8
P 5600 1850
F 0 "Lbatt?" H 5630 1890 50  0000 L CNN
F 1 "5.72uH" H 5630 1810 50  0000 L CNN
F 2 "" H 5600 1850 50  0001 C CNN
F 3 "~" H 5600 1850 50  0001 C CNN
	1    5600 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5450 1850 5500 1850
Wire Wire Line
	5700 1850 5750 1850
$Comp
L Device:C_Small C2lp1
U 1 1 5E6B1624
P 6000 3950
F 0 "C2lp1" V 6200 3900 50  0000 L CNN
F 1 "?" V 6100 3900 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 6000 3950 50  0001 C CNN
F 3 "~" H 6000 3950 50  0001 C CNN
	1    6000 3950
	0    1    -1   0   
$EndComp
Wire Wire Line
	5750 3950 5750 4200
Wire Wire Line
	5750 3950 5900 3950
Connection ~ 5750 4200
Wire Wire Line
	5750 4200 5850 4200
Wire Wire Line
	6100 3950 6250 3950
Wire Wire Line
	6250 3950 6250 4200
Connection ~ 6250 4200
Wire Wire Line
	6250 4200 6400 4200
$EndSCHEMATC
