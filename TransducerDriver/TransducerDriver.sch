EESchema Schematic File Version 4
LIBS:TransducerDriver-cache
EELAYER 26 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Acoustic Link Analog circuits"
Date "2020-02-11"
Rev "2.1"
Comp ""
Comment1 "Leo Chen"
Comment2 "Lionfish MQP / Acoustic Link"
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Transistor_FET:IRF540N Q3
U 1 1 5E2CAB91
P 5350 1600
F 0 "Q3" H 5556 1646 50  0000 L CNN
F 1 "IRF540N" H 5556 1555 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5600 1525 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 5350 1600 50  0001 L CNN
	1    5350 1600
	1    0    0    -1  
$EndComp
$Comp
L Device:Transformer_SP_1S T1
U 1 1 5E2CAB9F
P 6450 1850
F 0 "T1" H 6450 1400 50  0000 C CNN
F 1 "Transformer_SP_1S 1:10" H 6450 1550 50  0000 C CNN
F 2 "Transformers_THT:Transformer_Toroid_Tapped_Horizontal_D14.0mm_Amidon-T50" H 6450 1850 50  0001 C CNN
F 3 "~" H 6450 1850 50  0001 C CNN
	1    6450 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5E2CABB7
P 5450 1800
F 0 "#PWR0106" H 5450 1550 50  0001 C CNN
F 1 "GND" H 5450 1650 50  0000 C CNN
F 2 "" H 5450 1800 50  0001 C CNN
F 3 "" H 5450 1800 50  0001 C CNN
	1    5450 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 1650 7150 1700
Wire Wire Line
	7150 2000 7150 2050
$Comp
L Device:Crystal Y1
U 1 1 5E322B30
P 1050 4150
F 0 "Y1" V 1004 4281 50  0000 L CNN
F 1 "Crystal" V 1095 4281 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 1050 4150 50  0001 C CNN
F 3 "~" H 1050 4150 50  0001 C CNN
	1    1050 4150
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 4000 1050 3750
Wire Wire Line
	1050 4300 1050 4500
Wire Notes Line
	1500 3550 1500 4600
Wire Notes Line
	1500 4600 800  4600
Wire Notes Line
	800  4600 800  3550
Wire Notes Line
	800  3550 1500 3550
Text Notes 750  4050 0    50   ~ 0
Fish Finder
$Comp
L pspice:DIODE D1
U 1 1 5E32C473
P 8950 3600
F 0 "D1" H 8950 3865 50  0000 C CNN
F 1 "1N4148" H 8950 3774 50  0000 C CNN
F 2 "Diodes_THT:D_5W_P12.70mm_Horizontal" H 8950 3600 50  0001 C CNN
F 3 "~" H 8950 3600 50  0001 C CNN
	1    8950 3600
	1    0    0    -1  
$EndComp
$Comp
L Device:R Renv1
U 1 1 5E33632E
P 9550 3900
F 0 "Renv1" H 9620 3946 50  0000 L CNN
F 1 "2K" H 9620 3855 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 9480 3900 50  0001 C CNN
F 3 "~" H 9550 3900 50  0001 C CNN
	1    9550 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3600 9250 3600
Wire Wire Line
	9550 3600 9550 3750
Connection ~ 9250 3600
$Comp
L power:GND #PWR0108
U 1 1 5E3386A0
P 9400 4200
F 0 "#PWR0108" H 9400 3950 50  0001 C CNN
F 1 "GND" H 9405 4027 50  0000 C CNN
F 2 "" H 9400 4200 50  0001 C CNN
F 3 "" H 9400 4200 50  0001 C CNN
	1    9400 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	9250 4200 9400 4200
Wire Wire Line
	9550 4050 9550 4200
Wire Wire Line
	9550 4200 9400 4200
Connection ~ 9400 4200
Text Notes 550  750  0    157  ~ 31
Transmitter
Text Notes 500  3400 0    157  ~ 31
Receiver
$Comp
L power:+BATT #PWR0112
U 1 1 5E39A4A0
P 6000 1050
F 0 "#PWR0112" H 6000 900 50  0001 C CNN
F 1 "+BATT" H 6000 1190 50  0000 C CNN
F 2 "" H 6000 1050 50  0001 C CNN
F 3 "" H 6000 1050 50  0001 C CNN
	1    6000 1050
	1    0    0    -1  
$EndComp
Text GLabel 3250 1750 0    50   Input ~ 0
ModSig+
$Comp
L Transistor_FET:IRF540N Q4
U 1 1 5E3D6FE3
P 5350 2300
F 0 "Q4" H 5556 2346 50  0000 L CNN
F 1 "IRF540N" H 5556 2255 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-220-3_Vertical" H 5600 2225 50  0001 L CIN
F 3 "http://www.irf.com/product-info/datasheets/data/irf540n.pdf" H 5350 2300 50  0001 L CNN
	1    5350 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0113
U 1 1 5E3D6FEA
P 5450 2500
F 0 "#PWR0113" H 5450 2250 50  0001 C CNN
F 1 "GND" H 5450 2350 50  0000 C CNN
F 2 "" H 5450 2500 50  0001 C CNN
F 3 "" H 5450 2500 50  0001 C CNN
	1    5450 2500
	1    0    0    -1  
$EndComp
Text GLabel 3250 2050 0    50   Input ~ 0
ModSig-
Wire Wire Line
	5450 1400 5900 1400
Wire Wire Line
	5900 1400 5900 1650
Wire Wire Line
	5900 1650 6050 1650
$Comp
L Device:Crystal Y2
U 1 1 5E3EC002
P 7150 1850
F 0 "Y2" V 7104 1981 50  0000 L CNN
F 1 "Crystal" V 7195 1981 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 7150 1850 50  0001 C CNN
F 3 "~" H 7150 1850 50  0001 C CNN
	1    7150 1850
	0    1    1    0   
$EndComp
Text Notes 7250 1700 0    50   ~ 0
Fish Finder
$Comp
L Device:Crystal Y3
U 1 1 5E401928
P 9550 2050
F 0 "Y3" V 9504 2181 50  0000 L CNN
F 1 "FishFinder" V 9595 2181 50  0000 L CNN
F 2 "Wire_Connections_Bridges:WireConnection_2.50mmDrill" H 9550 2050 50  0001 C CNN
F 3 "~" H 9550 2050 50  0001 C CNN
	1    9550 2050
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 5E401A59
P 9800 1850
F 0 "R2" V 9880 1850 50  0000 C CNN
F 1 "1K" V 9800 1850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 9730 1850 50  0001 C CNN
F 3 "~" H 9800 1850 50  0001 C CNN
	1    9800 1850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9650 1850 9550 1850
Wire Wire Line
	9550 1850 9550 1900
$Comp
L power:GND #PWR0110
U 1 1 5E403967
P 9550 2300
F 0 "#PWR0110" H 9550 2050 50  0001 C CNN
F 1 "GND" H 9550 2150 50  0000 C CNN
F 2 "" H 9550 2300 50  0001 C CNN
F 3 "" H 9550 2300 50  0001 C CNN
	1    9550 2300
	1    0    0    -1  
$EndComp
Text GLabel 10200 1850 2    50   Input ~ 0
Vin
Text GLabel 10000 1800 1    50   Input ~ 0
Prob1
Text GLabel 9550 1800 1    50   Input ~ 0
Prob2
Wire Wire Line
	10000 1800 10000 1850
Connection ~ 10000 1850
Wire Wire Line
	10000 1850 9950 1850
Wire Wire Line
	9550 1800 9550 1850
Connection ~ 9550 1850
Text Notes 9450 2600 0    39   ~ 0
Impedance Measure Circuit
Wire Wire Line
	10000 1850 10200 1850
$Comp
L Device:C_Small C3
U 1 1 5E420E5F
P 1850 3750
F 0 "C3" H 1860 3820 50  0000 L CNN
F 1 "0.1u" H 1860 3670 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1850 3750 50  0001 C CNN
F 3 "~" H 1850 3750 50  0001 C CNN
	1    1850 3750
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small C4
U 1 1 5E420F89
P 1850 4500
F 0 "C4" H 1860 4570 50  0000 L CNN
F 1 "0.1u" H 1860 4420 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 1850 4500 50  0001 C CNN
F 3 "~" H 1850 4500 50  0001 C CNN
	1    1850 4500
	0    1    1    0   
$EndComp
Wire Wire Line
	1050 3750 1750 3750
Wire Wire Line
	1750 4500 1050 4500
Text Notes 9100 800  0    157  ~ 31
Measure
$Comp
L TransducerDriver-rescue:TC427-Driver_FET U3
U 1 1 5E424709
P 4400 1900
F 0 "U3" H 4400 1950 50  0000 C CNN
F 1 "TC427" H 4400 1850 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_LongPads" H 4400 1900 50  0001 C CNN
F 3 "" H 4400 1900 50  0001 C CNN
	1    4400 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR0111
U 1 1 5E4247E1
P 4400 1050
F 0 "#PWR0111" H 4400 900 50  0001 C CNN
F 1 "+BATT" H 4400 1190 50  0000 C CNN
F 2 "" H 4400 1050 50  0001 C CNN
F 3 "" H 4400 1050 50  0001 C CNN
	1    4400 1050
	1    0    0    -1  
$EndComp
$Comp
L Device:D D2
U 1 1 5E4249CF
P 4400 1200
F 0 "D2" H 4400 1300 50  0000 C CNN
F 1 "1N4007" H 4400 1100 50  0000 C CNN
F 2 "Diodes_THT:D_DO-35_SOD27_P10.16mm_Horizontal" H 4400 1200 50  0001 C CNN
F 3 "~" H 4400 1200 50  0001 C CNN
	1    4400 1200
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR0114
U 1 1 5E42756F
P 4400 2500
F 0 "#PWR0114" H 4400 2250 50  0001 C CNN
F 1 "GND" H 4400 2350 50  0000 C CNN
F 2 "" H 4400 2500 50  0001 C CNN
F 3 "" H 4400 2500 50  0001 C CNN
	1    4400 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2450 4400 2500
Wire Wire Line
	3750 2000 3450 2000
Wire Wire Line
	5050 1800 5150 1800
Wire Wire Line
	5150 1800 5150 1600
Wire Wire Line
	5050 2000 5150 2000
Wire Wire Line
	5150 2000 5150 2300
$Comp
L Connector:Conn_01x01_Male J2
U 1 1 5E4375EA
P 1300 1700
F 0 "J2" H 1300 1900 50  0000 C CNN
F 1 "BattJack+" H 1300 1800 50  0000 C CNN
F 2 "" H 1300 1700 50  0001 C CNN
F 3 "~" H 1300 1700 50  0001 C CNN
	1    1300 1700
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Female J1
U 1 1 5E437676
P 2600 1850
F 0 "J1" H 2600 1950 50  0000 C CNN
F 1 "ModSigJack" H 2600 1650 50  0000 C CNN
F 2 "" H 2600 1850 50  0001 C CNN
F 3 "~" H 2600 1850 50  0001 C CNN
	1    2600 1850
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J3
U 1 1 5E437AD1
P 1300 1850
F 0 "J3" H 1300 1650 50  0000 C CNN
F 1 "BattJack-" H 1300 1750 50  0000 C CNN
F 2 "" H 1300 1850 50  0001 C CNN
F 3 "~" H 1300 1850 50  0001 C CNN
	1    1300 1850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0115
U 1 1 5E437B27
P 1800 1900
F 0 "#PWR0115" H 1800 1650 50  0001 C CNN
F 1 "GND" H 1800 1750 50  0000 C CNN
F 2 "" H 1800 1900 50  0001 C CNN
F 3 "" H 1800 1900 50  0001 C CNN
	1    1800 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1850 1800 1850
Wire Wire Line
	1800 1850 1800 1900
$Comp
L power:+BATT #PWR0116
U 1 1 5E439689
P 1800 1650
F 0 "#PWR0116" H 1800 1500 50  0001 C CNN
F 1 "+BATT" H 1800 1790 50  0000 C CNN
F 2 "" H 1800 1650 50  0001 C CNN
F 3 "" H 1800 1650 50  0001 C CNN
	1    1800 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 1700 1800 1700
Wire Wire Line
	1800 1700 1800 1650
Wire Wire Line
	2800 1850 3300 1850
Wire Wire Line
	3300 1850 3300 1800
Wire Wire Line
	3300 1800 3650 1800
Wire Wire Line
	2800 1950 3300 1950
Wire Wire Line
	3300 1950 3300 2000
Wire Wire Line
	9550 2200 9550 2300
$Comp
L Amplifier_Operational:LM4562 U4
U 1 1 5E41E9D1
P 6400 3950
F 0 "U4" H 6400 4317 50  0000 C CNN
F 1 "LM4562" H 6400 4226 50  0000 C CNN
F 2 "" H 6400 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm4562.pdf" H 6400 3950 50  0001 C CNN
	1    6400 3950
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:LM4562 U4
U 3 1 5E41FD78
P 7450 3950
F 0 "U4" H 7408 3996 50  0000 L CNN
F 1 "LM4562" H 7408 3905 50  0000 L CNN
F 2 "" H 7450 3950 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm4562.pdf" H 7450 3950 50  0001 C CNN
	3    7450 3950
	1    0    0    -1  
$EndComp
Wire Notes Line
	6950 1600 7700 1600
Wire Notes Line
	7700 1600 7700 2100
Wire Notes Line
	7700 2100 6950 2100
Wire Notes Line
	6950 2100 6950 1600
$Comp
L power:+BATT #PWR010
U 1 1 5E42A3DB
P 7350 3650
F 0 "#PWR010" H 7350 3500 50  0001 C CNN
F 1 "+BATT" H 7350 3790 50  0000 C CNN
F 2 "" H 7350 3650 50  0001 C CNN
F 3 "" H 7350 3650 50  0001 C CNN
	1    7350 3650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 5E42A52F
P 7350 4250
F 0 "#PWR011" H 7350 4000 50  0001 C CNN
F 1 "GND" H 7350 4100 50  0000 C CNN
F 2 "" H 7350 4250 50  0001 C CNN
F 3 "" H 7350 4250 50  0001 C CNN
	1    7350 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2In1
U 1 1 5E42E7D6
P 5600 3850
F 0 "C2In1" V 5750 3850 50  0000 L CNN
F 1 "0.1u" V 5650 3900 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5600 3850 50  0001 C CNN
F 3 "~" H 5600 3850 50  0001 C CNN
	1    5600 3850
	0    1    -1   0   
$EndComp
$Comp
L Device:R Rg1
U 1 1 5E42EEA0
P 6050 4450
F 0 "Rg1" H 6120 4496 50  0000 L CNN
F 1 "2K" H 6120 4405 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5980 4450 50  0001 C CNN
F 3 "~" H 6050 4450 50  0001 C CNN
	1    6050 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:R Rf2
U 1 1 5E42EFF2
P 6450 4300
F 0 "Rf2" V 6350 4250 50  0000 L CNN
F 1 "200K" V 6550 4200 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 6380 4300 50  0001 C CNN
F 3 "~" H 6450 4300 50  0001 C CNN
	1    6450 4300
	0    1    1    0   
$EndComp
$Comp
L Device:C_Small Cgnd2
U 1 1 5E42F28D
P 5950 6300
F 0 "Cgnd2" H 6000 6350 50  0000 L CNN
F 1 "0.1u" H 6000 6250 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5950 6300 50  0001 C CNN
F 3 "~" H 5950 6300 50  0001 C CNN
	1    5950 6300
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR09
U 1 1 5E43060C
P 5950 6400
F 0 "#PWR09" H 5950 6150 50  0001 C CNN
F 1 "GND" H 5955 6227 50  0000 C CNN
F 2 "" H 5950 6400 50  0001 C CNN
F 3 "" H 5950 6400 50  0001 C CNN
	1    5950 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 3950 6750 3950
Wire Wire Line
	6750 3950 6750 4300
Wire Wire Line
	6750 4300 6600 4300
Wire Wire Line
	6300 4300 6050 4300
Wire Wire Line
	6100 4050 6050 4050
Wire Wire Line
	6050 4050 6050 4300
Connection ~ 6050 4300
$Comp
L Device:R Rin2
U 1 1 5E4387B9
P 5850 4100
F 0 "Rin2" H 5920 4146 50  0000 L CNN
F 1 "200K" H 5920 4055 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5780 4100 50  0001 C CNN
F 3 "~" H 5850 4100 50  0001 C CNN
	1    5850 4100
	-1   0    0    -1  
$EndComp
Text Notes 6500 4850 0    50   ~ 0
X cgnd1<<Rg2 \nF = 20Khz\nC = 0.47uF \nXc = 17ohm
Text Notes 5050 3650 0    50   ~ 0
Rin2 same as R2 \nlimit input bias current 
$Comp
L TransducerDriver-rescue:INA217-Amplifier_Instrumentation U2
U 1 1 5E439FD5
P 3300 4100
F 0 "U2" H 3300 4050 50  0000 C CNN
F 1 "INA217-Amplifier_Instrumentation" H 3250 4950 50  0000 C CNN
F 2 "" H 3300 4100 50  0001 C CNN
F 3 "" H 3300 4100 50  0001 C CNN
	1    3300 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R Rgain1
U 1 1 5E43A64E
P 2500 4100
F 0 "Rgain1" H 2570 4146 50  0000 L CNN
F 1 "101" H 2570 4055 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2430 4100 50  0001 C CNN
F 3 "~" H 2500 4100 50  0001 C CNN
	1    2500 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2500 3950 2500 3900
Wire Wire Line
	2500 3900 2750 3900
Wire Wire Line
	2500 4250 2500 4300
Wire Wire Line
	2500 4300 2750 4300
$Comp
L power:+BATT #PWR06
U 1 1 5E448DDE
P 3200 3500
F 0 "#PWR06" H 3200 3350 50  0001 C CNN
F 1 "+BATT" H 3200 3650 50  0000 C CNN
F 2 "" H 3200 3500 50  0001 C CNN
F 3 "" H 3200 3500 50  0001 C CNN
	1    3200 3500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR07
U 1 1 5E449082
P 3200 4550
F 0 "#PWR07" H 3200 4300 50  0001 C CNN
F 1 "GND" H 3200 4400 50  0000 C CNN
F 2 "" H 3200 4550 50  0001 C CNN
F 3 "" H 3200 4550 50  0001 C CNN
	1    3200 4550
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL082 U1
U 1 1 5E449313
P 3150 6100
F 0 "U1" H 3150 6300 50  0000 L CNN
F 1 "TL082" H 3150 5900 50  0000 L CNN
F 2 "" H 3150 6100 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 3150 6100 50  0001 C CNN
	1    3150 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 6100 3500 6100
Wire Wire Line
	3500 6100 3500 6350
Wire Wire Line
	3500 6350 2800 6350
Wire Wire Line
	2800 6350 2800 6200
Wire Wire Line
	2800 6200 2850 6200
$Comp
L Device:R Rb1
U 1 1 5E44B20F
P 2400 5850
F 0 "Rb1" H 2470 5896 50  0000 L CNN
F 1 "5K" H 2470 5805 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2330 5850 50  0001 C CNN
F 3 "~" H 2400 5850 50  0001 C CNN
	1    2400 5850
	-1   0    0    -1  
$EndComp
$Comp
L Device:R Rb2
U 1 1 5E44B2D4
P 2400 6150
F 0 "Rb2" H 2470 6196 50  0000 L CNN
F 1 "5K" H 2470 6105 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 2330 6150 50  0001 C CNN
F 3 "~" H 2400 6150 50  0001 C CNN
	1    2400 6150
	-1   0    0    -1  
$EndComp
$Comp
L power:+BATT #PWR04
U 1 1 5E44B4D8
P 2400 5700
F 0 "#PWR04" H 2400 5550 50  0001 C CNN
F 1 "+BATT" H 2400 5840 50  0000 C CNN
F 2 "" H 2400 5700 50  0001 C CNN
F 3 "" H 2400 5700 50  0001 C CNN
	1    2400 5700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR05
U 1 1 5E44D202
P 2400 6400
F 0 "#PWR05" H 2400 6150 50  0001 C CNN
F 1 "GND" H 2400 6250 50  0000 C CNN
F 2 "" H 2400 6400 50  0001 C CNN
F 3 "" H 2400 6400 50  0001 C CNN
	1    2400 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 6000 2700 6000
Connection ~ 2400 6000
Text GLabel 3850 6100 2    50   Input ~ 0
Vref
$Comp
L Device:R Rbias1
U 1 1 5E45D34E
P 2050 4000
F 0 "Rbias1" H 2120 4046 50  0000 L CNN
F 1 "2.2K" H 2120 3955 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 1980 4000 50  0001 C CNN
F 3 "~" H 2050 4000 50  0001 C CNN
	1    2050 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R Rbias2
U 1 1 5E45D515
P 2050 4750
F 0 "Rbias2" H 2120 4796 50  0000 L CNN
F 1 "2.2K" H 2120 4705 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 1980 4750 50  0001 C CNN
F 3 "~" H 2050 4750 50  0001 C CNN
	1    2050 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5E45D892
P 2050 4150
F 0 "#PWR02" H 2050 3900 50  0001 C CNN
F 1 "GND" H 2050 4000 50  0000 C CNN
F 2 "" H 2050 4150 50  0001 C CNN
F 3 "" H 2050 4150 50  0001 C CNN
	1    2050 4150
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR03
U 1 1 5E45D96F
P 2050 4900
F 0 "#PWR03" H 2050 4650 50  0001 C CNN
F 1 "GND" H 2050 4750 50  0000 C CNN
F 2 "" H 2050 4900 50  0001 C CNN
F 3 "" H 2050 4900 50  0001 C CNN
	1    2050 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4500 2050 4500
Wire Wire Line
	2050 4500 2050 4600
Wire Wire Line
	1950 3750 2050 3750
Wire Wire Line
	2050 3750 2050 3850
Wire Wire Line
	2050 3750 2750 3750
Connection ~ 2050 3750
Wire Wire Line
	2750 4500 2050 4500
Connection ~ 2050 4500
Text GLabel 3600 4450 2    50   Input ~ 0
Vref
Wire Wire Line
	3550 4350 3550 4450
Wire Wire Line
	3550 4450 3600 4450
$Comp
L Device:R Rbuf1
U 1 1 5E470BDE
P 3650 6100
F 0 "Rbuf1" V 3550 6000 50  0000 L CNN
F 1 "10ohm" V 3750 6000 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 3580 6100 50  0001 C CNN
F 3 "~" H 3650 6100 50  0001 C CNN
	1    3650 6100
	0    1    1    0   
$EndComp
Connection ~ 3500 6100
Wire Wire Line
	3800 6100 3850 6100
Text Notes 2850 6700 0    50   ~ 0
half battery Vref generator \nwith small resistor Rbuf1\nprevernt opamp unstable
$Comp
L Device:C_Small Cb1
U 1 1 5E474862
P 2700 6200
F 0 "Cb1" H 2710 6270 50  0000 L CNN
F 1 "10nF" H 2710 6120 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 2700 6200 50  0001 C CNN
F 3 "~" H 2700 6200 50  0001 C CNN
	1    2700 6200
	-1   0    0    1   
$EndComp
Wire Wire Line
	2400 6300 2400 6350
Wire Wire Line
	2700 6000 2700 6100
Connection ~ 2700 6000
Wire Wire Line
	2700 6000 2850 6000
Wire Wire Line
	2700 6300 2700 6350
Wire Wire Line
	2700 6350 2400 6350
Connection ~ 2400 6350
Wire Wire Line
	2400 6350 2400 6400
Text Notes 1750 3600 0    50   ~ 0
bias current \nsupply\n0.1uF 2.2Kohm\nFc = 4.5Khz
Text GLabel 4050 4100 2    50   Input ~ 0
Stage1Out
Wire Wire Line
	3900 4100 4050 4100
Text GLabel 5400 3850 0    50   Input ~ 0
Stage1Out
Wire Wire Line
	5400 3850 5500 3850
Wire Wire Line
	6100 3850 5850 3850
Wire Wire Line
	5850 3850 5850 3950
Connection ~ 5850 3850
Wire Wire Line
	5850 3850 5700 3850
Text GLabel 5650 4350 0    50   Input ~ 0
Vref
Wire Wire Line
	5850 4250 5850 4350
Wire Wire Line
	5850 4350 5650 4350
$Comp
L Device:C_Small Cref2
U 1 1 5E4B1BF2
P 5850 4500
F 0 "Cref2" H 5860 4570 50  0000 L CNN
F 1 "0.1u" H 5860 4420 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5850 4500 50  0001 C CNN
F 3 "~" H 5850 4500 50  0001 C CNN
	1    5850 4500
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR08
U 1 1 5E4B1F6D
P 5850 4650
F 0 "#PWR08" H 5850 4400 50  0001 C CNN
F 1 "GND" H 5855 4477 50  0000 C CNN
F 2 "" H 5850 4650 50  0001 C CNN
F 3 "" H 5850 4650 50  0001 C CNN
	1    5850 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4350 5850 4400
Connection ~ 5850 4350
Wire Wire Line
	5850 4600 5850 4650
$Comp
L Amplifier_Operational:LM4562 U4
U 2 1 5E4C56D5
P 6400 6050
F 0 "U4" H 6400 6250 50  0000 L CNN
F 1 "LM4562" H 6350 6350 50  0000 L CNN
F 2 "" H 6400 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/lm4562.pdf" H 6400 6050 50  0001 C CNN
	2    6400 6050
	1    0    0    1   
$EndComp
Text GLabel 5400 5700 0    50   Input ~ 0
Stage1Out
$Comp
L Device:C_Small C2In2
U 1 1 5E4C92CC
P 5550 5700
F 0 "C2In2" V 5750 5650 50  0000 L CNN
F 1 "0.1u" V 5650 5650 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 5550 5700 50  0001 C CNN
F 3 "~" H 5550 5700 50  0001 C CNN
	1    5550 5700
	0    1    -1   0   
$EndComp
$Comp
L Device:R R2G1
U 1 1 5E4C948E
P 5850 5700
F 0 "R2G1" V 5750 5600 50  0000 L CNN
F 1 "1Kohm" V 5950 5600 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 5780 5700 50  0001 C CNN
F 3 "~" H 5850 5700 50  0001 C CNN
	1    5850 5700
	0    1    1    0   
$EndComp
$Comp
L Device:R R2F1
U 1 1 5E4C95AC
P 6350 5600
F 0 "R2F1" V 6250 5500 50  0000 L CNN
F 1 "100Kohm" V 6450 5450 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 6280 5600 50  0001 C CNN
F 3 "~" H 6350 5600 50  0001 C CNN
	1    6350 5600
	0    1    1    0   
$EndComp
Text Notes 3800 3900 0    50   ~ 0
6Kohm Internal \nR. Is it High \noutput Impedance?
Text Notes 5350 5350 0    50   ~ 0
10Khz HP filter\n0.1uF 1Kohm
Wire Wire Line
	6000 5700 6050 5700
Wire Wire Line
	6050 5700 6050 5950
Wire Wire Line
	6050 5950 6100 5950
Wire Wire Line
	6050 5600 6050 5700
Connection ~ 6050 5700
Wire Wire Line
	6050 5600 6200 5600
Wire Wire Line
	6500 5600 6750 5600
Wire Wire Line
	6750 5600 6750 6050
Wire Wire Line
	6750 6050 6700 6050
Text GLabel 5750 6150 0    50   Input ~ 0
Vref
Text GLabel 8350 3600 0    50   Input ~ 0
Stage2Out
Text GLabel 6750 5600 2    50   Input ~ 0
Stage2Out
Wire Wire Line
	5750 6150 5950 6150
Wire Wire Line
	5950 6200 5950 6150
Connection ~ 5950 6150
Wire Wire Line
	5950 6150 6100 6150
Wire Notes Line
	2150 5500 2150 6850
Wire Notes Line
	2150 6850 4100 6850
Wire Notes Line
	4100 6850 4100 5500
Wire Notes Line
	4100 5500 2150 5500
Text Notes 3450 5700 0    67   Italic 13
Vref Gen
Text Notes 4900 4900 0    67   Italic 13
Non-Inverting\nHigh Impedance
Text Notes 4900 6600 0    67   Italic 13
Inverting \nSimple Vref
Wire Notes Line
	4850 5150 7200 5150
Wire Notes Line
	7200 3400 4850 3400
Wire Wire Line
	5650 5700 5700 5700
Wire Wire Line
	5400 5700 5450 5700
Wire Notes Line
	4850 6650 7200 6650
Wire Notes Line
	4850 3400 4850 6650
Wire Notes Line
	7200 3400 7200 6650
Wire Notes Line
	4550 3150 4550 5150
Wire Notes Line
	4550 5150 1650 5150
Wire Notes Line
	1650 5150 1650 3150
Wire Notes Line
	1650 3150 4550 3150
Text Notes 3800 4900 0    67   Italic 13
First Stage \nDiff Amp
Text Notes 4850 3350 0    67   Italic 13
Two Options for second stage
$Comp
L Device:D_Zener Dz1
U 1 1 5E645861
P 10150 4050
F 0 "Dz1" V 10150 4200 50  0000 C CNN
F 1 "3.3V" V 10250 4200 50  0000 C CNN
F 2 "" H 10150 4050 50  0001 C CNN
F 3 "~" H 10150 4050 50  0001 C CNN
	1    10150 4050
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5E64625D
P 10150 4200
F 0 "#PWR014" H 10150 3950 50  0001 C CNN
F 1 "GND" H 10155 4027 50  0000 C CNN
F 2 "" H 10150 4200 50  0001 C CNN
F 3 "" H 10150 4200 50  0001 C CNN
	1    10150 4200
	1    0    0    -1  
$EndComp
Text GLabel 10250 3700 2    50   Input ~ 0
ADCinput
Wire Wire Line
	10150 3900 10150 3600
Text GLabel 8700 4950 0    50   Input ~ 0
ADCinput
$Comp
L Device:R Radc1
U 1 1 5E653FDE
P 8950 4950
F 0 "Radc1" V 8850 4850 50  0000 L CNN
F 1 "2.5K" V 9050 4850 50  0000 L CNN
F 2 "Resistors_THT:R_Axial_DIN0309_L9.0mm_D3.2mm_P12.70mm_Horizontal" V 8880 4950 50  0001 C CNN
F 3 "~" H 8950 4950 50  0001 C CNN
	1    8950 4950
	0    1    1    0   
$EndComp
$Comp
L Device:C Cadc1
U 1 1 5E654634
P 9200 5200
F 0 "Cadc1" H 9085 5154 50  0000 R CNN
F 1 "10pf" H 9085 5245 50  0000 R CNN
F 2 "Capacitors_THT:C_Disc_D8.0mm_W5.0mm_P7.50mm" H 9238 5050 50  0001 C CNN
F 3 "~" H 9200 5200 50  0001 C CNN
	1    9200 5200
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 4950 9200 4950
Wire Wire Line
	9200 4950 9200 5050
Wire Wire Line
	8800 4950 8700 4950
$Comp
L power:GND #PWR012
U 1 1 5E65CE66
P 9200 5350
F 0 "#PWR012" H 9200 5100 50  0001 C CNN
F 1 "GND" H 9205 5177 50  0000 C CNN
F 2 "" H 9200 5350 50  0001 C CNN
F 3 "" H 9200 5350 50  0001 C CNN
	1    9200 5350
	1    0    0    -1  
$EndComp
Wire Notes Line
	8750 4750 8750 5600
Wire Notes Line
	8750 5600 9700 5600
Wire Notes Line
	9700 5600 9700 4750
Wire Notes Line
	9700 4750 8750 4750
Text Notes 9100 4900 0    59   Italic 12
ADC internal
$Comp
L Device:C_Small Cenv1
U 1 1 5E672EB5
P 9250 3900
F 0 "Cenv1" H 9260 3970 50  0000 L CNN
F 1 "10nf" H 9260 3820 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 9250 3900 50  0001 C CNN
F 3 "~" H 9250 3900 50  0001 C CNN
	1    9250 3900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9250 3600 9250 3800
Wire Wire Line
	9250 4000 9250 4200
$Comp
L Device:C_Small C2out1
U 1 1 5E67C655
P 8550 3600
F 0 "C2out1" V 8750 3550 50  0000 L CNN
F 1 "0.1u" V 8650 3550 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 8550 3600 50  0001 C CNN
F 3 "~" H 8550 3600 50  0001 C CNN
	1    8550 3600
	0    1    -1   0   
$EndComp
Text Notes 8350 4350 0    50   ~ 0
min Fcarr = 40Khz \nmax Fmod = 1Khz \n10nF 2Kohm\nFc = 8Kohm
Wire Wire Line
	8350 3600 8450 3600
Wire Wire Line
	8650 3600 8750 3600
Wire Notes Line
	9650 3650 10100 3650
Wire Notes Line
	10100 3650 10100 3300
Wire Notes Line
	10100 3300 9650 3300
Wire Notes Line
	9650 3650 9650 3300
Text Notes 9700 3550 0    50   ~ 0
Potential\nVariable \nGain
Wire Wire Line
	9250 3600 9550 3600
Wire Wire Line
	9550 3600 10150 3600
Connection ~ 9550 3600
Connection ~ 10150 3600
Text Notes 7950 3500 0    67   Italic 13
Envelope\nDetector
Wire Notes Line
	7850 3250 10650 3250
Wire Notes Line
	10650 3250 10650 4450
Wire Notes Line
	10650 4450 7850 4450
Wire Notes Line
	7850 4450 7850 3250
$Comp
L Connector:Conn_01x01_Male Jadc1
U 1 1 5E73AA78
P 10550 3600
F 0 "Jadc1" H 10650 3450 50  0000 C CNN
F 1 "connADC" H 10650 3500 50  0000 C CNN
F 2 "" H 10550 3600 50  0001 C CNN
F 3 "~" H 10550 3600 50  0001 C CNN
	1    10550 3600
	-1   0    0    1   
$EndComp
Wire Wire Line
	10150 3600 10200 3600
Wire Wire Line
	10250 3700 10200 3700
Wire Wire Line
	10200 3700 10200 3600
Connection ~ 10200 3600
Wire Wire Line
	10200 3600 10350 3600
Wire Wire Line
	6000 1050 6000 1850
$Comp
L Device:D_Zener Dz3
U 1 1 5E778073
P 3650 2250
F 0 "Dz3" V 3650 2400 50  0000 C CNN
F 1 "3.3V" V 3750 2400 50  0000 C CNN
F 2 "" H 3650 2250 50  0001 C CNN
F 3 "~" H 3650 2250 50  0001 C CNN
	1    3650 2250
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener Dz2
U 1 1 5E77C71B
P 3450 2250
F 0 "Dz2" V 3450 2400 50  0000 C CNN
F 1 "3.3V" V 3550 2400 50  0000 C CNN
F 2 "" H 3450 2250 50  0001 C CNN
F 3 "~" H 3450 2250 50  0001 C CNN
	1    3450 2250
	0    -1   1    0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 5E780F88
P 3550 2500
F 0 "#PWR01" H 3550 2250 50  0001 C CNN
F 1 "GND" H 3550 2350 50  0000 C CNN
F 2 "" H 3550 2500 50  0001 C CNN
F 3 "" H 3550 2500 50  0001 C CNN
	1    3550 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 2100 3650 1800
Connection ~ 3650 1800
Wire Wire Line
	3650 1800 3750 1800
Wire Wire Line
	3450 2100 3450 2000
Connection ~ 3450 2000
Wire Wire Line
	3450 2000 3300 2000
Wire Wire Line
	3300 1800 3300 1750
Wire Wire Line
	3300 1750 3250 1750
Connection ~ 3300 1800
Wire Wire Line
	3300 2000 3300 2050
Wire Wire Line
	3300 2050 3250 2050
Connection ~ 3300 2000
Wire Wire Line
	3550 2500 3550 2450
Wire Wire Line
	3550 2450 3650 2450
Wire Wire Line
	3650 2450 3650 2400
Wire Wire Line
	3550 2450 3450 2450
Wire Wire Line
	3450 2450 3450 2400
Connection ~ 3550 2450
Wire Notes Line
	500  3050 11200 3050
Wire Wire Line
	6000 1850 6050 1850
Wire Wire Line
	6050 2050 5450 2050
Wire Wire Line
	5450 2050 5450 2100
Wire Notes Line
	9050 3050 9050 500 
Text Notes 10150 2050 0    50   ~ 0
sine wave input
$Comp
L power:GND #PWR013
U 1 1 5E435BE5
P 6050 4850
F 0 "#PWR013" H 6050 4600 50  0001 C CNN
F 1 "GND" H 6055 4677 50  0000 C CNN
F 2 "" H 6050 4850 50  0001 C CNN
F 3 "" H 6050 4850 50  0001 C CNN
	1    6050 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 4600 6050 4650
$Comp
L Device:C_Small Cg1
U 1 1 5E45D5F8
P 6050 4750
F 0 "Cg1" H 6060 4820 50  0000 L CNN
F 1 "0.47uF" H 6060 4670 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 6050 4750 50  0001 C CNN
F 3 "~" H 6050 4750 50  0001 C CNN
	1    6050 4750
	1    0    0    1   
$EndComp
$Comp
L Device:C_Small Cb?
U 1 1 5E46F193
P 3550 3600
F 0 "Cb?" H 3560 3670 50  0000 L CNN
F 1 "0.1uF" H 3560 3520 50  0000 L CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P5.00mm" H 3550 3600 50  0001 C CNN
F 3 "~" H 3550 3600 50  0001 C CNN
	1    3550 3600
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E46FBDA
P 3550 3700
F 0 "#PWR?" H 3550 3450 50  0001 C CNN
F 1 "GND" H 3550 3550 50  0000 C CNN
F 2 "" H 3550 3700 50  0001 C CNN
F 3 "" H 3550 3700 50  0001 C CNN
	1    3550 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 3500 3200 3650
Connection ~ 3200 3500
Wire Wire Line
	3200 3500 3550 3500
Wire Wire Line
	6850 1650 7150 1650
Wire Wire Line
	6850 2050 7150 2050
$EndSCHEMATC
