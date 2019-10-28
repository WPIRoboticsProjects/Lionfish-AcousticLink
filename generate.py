import os
import numpy as np
import tkinter as tk
import matplotlib.pyplot as plt
from tkinter import simpledialog, filedialog
from scipy import signal
from scipy.fftpack import fft
from scipy.io.wavfile import write
from scipy.io import wavfile as wav

SAMPLE_RATE = 44100 #points per second (AUDIO STANDARD)
BIT_RATE = 1000 #100 bits per second

#we are using two frequencies based on sampling theory:
#       you need to sample at a speed at least twice 
#       the highest frequency of your signal
base_freq = 15000 #base
carrier_freq = 5000 # 0/1 = base +/- this


def text_to_bits(text, encoding='utf-8', errors='surrogatepass'):
    '''Converts string to binary'''
    bits = bin(int.from_bytes(text.encode(encoding, errors), 'big'))[2:]
    return bits.zfill(8 * ((len(bits) + 7) // 8))

def text_from_bits(bits, encoding='utf-8', errors='surrogatepass'):
    '''Converts binary to string'''
    n = int(bits, 2)
    return n.to_bytes((n.bit_length() + 7) // 8, 'big').decode(encoding, errors) or '\0'

def gen_arr(byte_string):
    '''Return array of appropriate length with the modulated sine signal (FSK)'''
    arr = []

    num_bits = len(byte_string) #length
    num_bit_points = int(SAMPLE_RATE / BIT_RATE) #per bit  
    num_points = num_bit_points * len(byte_string) #total arr length

    for i in range(num_bits):
        
        bit = int(byte_string[i])

        if bit == 0: 
            freq = base_freq + carrier_freq

            for j in range(num_bit_points):
                i_total = i*num_bit_points + j
                arr.append(np.sin(2 * np.pi * freq * j))

        if bit == 1:
            freq = base_freq - carrier_freq

            for j in range(num_bit_points):
                i_total = i*num_bit_points + j
                arr.append(np.sin(2 * np.pi * freq * j))

    print('num_points: {}'.format(num_points))
    print('len(arr): {}'.format(len(arr)))

    return arr

def gen_file(arr, path, name):
    '''Writes new wav file to path with signal array'''
    write(path, SAMPLE_RATE, arr)

def fft_plot(wave_path):
    '''Plots a Fourier Transform of the audio file @ path'''
    rate, data = wav.read(wave_path)
    fft_out = fft(data)

    plt.plot(data, np.abs(fft_out))
    plt.show()

def spectrogram(path):
    '''Plots a spectrogram of the audio file @ path'''
    sample_rate, samples = wav.read(path)
    frequencies, times, spectrogram = signal.spectrogram(samples, sample_rate)

    plt.pcolormesh(times, frequencies, spectrogram)
    plt.imshow(spectrogram)
    plt.ylabel('Frequency [Hz]')
    plt.xlabel('Time [sec]')
    plt.show()

if __name__ == '__main__':
    root = tk.Tk()
    root.withdraw()
    message = simpledialog.askstring('!', 'Enter Message')

    arr = gen_arr(text_to_bits(message))

    path = tk.filedialog.askdirectory(title="Select Data Folder")
    name = 'message_0.wav'
    new_path = str(os.path.join(path, name))

    gen_file(np.array(arr), new_path, message)

    fft_plot(new_path)
    # spectrogram(new_path)
    