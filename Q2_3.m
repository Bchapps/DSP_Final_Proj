% Lab S-5 Problem 2.3 - Group 4
% Removing Interference from a Speech Signal

%Part a: Load speechbad (xxbad), listen to signal, make a spectrogram
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
spectrogram(xxbad)
title('Initial Spectrogram')

% Part b: Design a cascade of two FIR Nulling filters to remove the
% sinusoids completely. This can be accomplished by finding the numerical 
% values of the filter coefficients for each second-order nulling filter.
% Combine the cascaded filters into one equivalent FIR filter, and give the
% filter coefficients of the equivalent filter.

%omega = (2*pi*60)/8000;
% 
% b0 = 1; 
% b1 = -2cos(omega);
% b2 = 1;


b0 = 1;
b1 = -2*cos(0.1943*pi)-2*cos(0.2778*pi);
b2 = 1 + 4*cos(0.1943*pi)*cos(0.2778*pi);
b3 = -2*cos(0.1943*pi)-2*cos(0.2778*pi);
b4 = 1;

coeff = [b0,b1,b2,b3,b4];


filt = conv(xxbad, coeff);

w = -pi:(pi/100):pi;
figure(3);
H = freqz(coeff, 1, w);
plot(w, abs(H));
title('Frequency Response of Cascaded Filter');

figure(4);
spectrogram(filt)

sound(filt)
