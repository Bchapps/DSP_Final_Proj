% Lab S-5 Problem 2.3 - Group 4
% Removing Interference from a Speech Signal

%Part a: Load speechbad (xxbad), listen (???) to signal, make a spectrogram
%in dB. 

clc
clear all
close all

load('C:\Users\marlo\Documents\ECE 6530\DSP_Project\DLTInulling\speechbad.mat', 'xxbad')

% Plot, just to see the initial data
figure(1)
plot(xxbad)
xlabel('Frequency (Hz)')
title('Initial xxbad data')

fs = 8000; % Hz. Sampling rate

sound(xxbad); %Converts matrix of signal data to sound. Matlab function.
%Confirms interference is so strong that the speech is unrecognizable.

figure(2)
spectrogram(xxbad) %Not a matlab toolbox. Illegal?

% Making a spectrogram: Short-Time Fourier Transform
freq = 60; %Hz, fundamental frequency
t = 3; %seconds
timeaxis = 0:(1/fs):t;


%[s,f,t] = stft(xxbad, fs);
