# generate BFSK. 
# could choose any sampleRate, Mask, space frequency, interval of bit. 
# this implimentation is coherent as it always do integer period of each frequency. This means abtreary interval of bit is not possible. 


import numpy as np
import matplotlib.pyplot as plt


##  All unites are in kHz and ms. !!!

# random picked parameter
baseFreq = 5  # 5KHz carrier frequency
deltaFreq = 2 # 2kHz variation  
sampleRate = baseFreq*100	# this described how fine is the generated dataset

# derived parameter for calculation
maskFreq = baseFreq + deltaFreq 
maskPeriod = 1/maskFreq # in ms. 
spaceFreq = baseFreq - deltaFreq 
spacePeriod = 1/spaceFreq # in ms. 

samplePeriod = 1/sampleRate # in ms
numMaskPerBit = 5 # number of period per bit
numSpacePerBit = 3 # number of period per bit


data = format(0x55F0AA, '024b') # just some data for it to work with
print(data)

bitLangth = len(data) 

maxSampleLength = int ( bitLangth * ( (spacePeriod*numSpacePerBit) / samplePeriod ) )
x = np.zeros((maxSampleLength+10 , 2))  # add 10 to length just in case of the edge case	
index =0 

dataDivide =[[],[]]

tempPeriod=0
tempFreq =0
periodPerBit=0
# generate wave bit by bit
for bit in data :
	if (bit =='0'):
		tempPeriod = spacePeriod
		tempFreq = spaceFreq
		periodPerBit = numSpacePerBit
	elif (bit =='1'):
		tempPeriod = maskPeriod
		tempFreq = maskFreq
		periodPerBit = numMaskPerBit
	for i in range ( int ( (tempPeriod/samplePeriod) * periodPerBit ) ):
		t = index*samplePeriod # time variable
		y = np.sin(2*np.pi*(tempFreq)* (i*samplePeriod) ) # t for sin function is the local time starting at this bit
		x[index,0] =t 
		x[index,1] =y
		index = index +1 
	# purely for visulizing where the byte is 
	dataDivide[0].append(x[index-1,0])
	dataDivide[1].append(-1)

print(dataDivide)

plt.plot(x[:index,0] , x[:index,1] ) 
plt.plot(dataDivide[0],dataDivide[1] , 'ro' )
plt.show()
	





