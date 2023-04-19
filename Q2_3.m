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

%sound(xxbad); %Converts matrix of signal data to sound. Matlab function.
%Confirms interference is so strong that the speech is unrecognizable.

figure(2)
spectrogram(xxbad)
title('Initial Spectrogram')

% Part b: Design a cascade of two FIR Nulling filters to remove the
% sinusoids completely. This can be accomplished by finding the numerical 
% values of the filter coefficients for each second-order nulling filter.
% Combine the cascaded filters into one equivalent FIR filter, and give the
% filter coefficients of the equivalent filter.

omega1 = (1555/8000)*2*pi;
omega2 = (2222/8000)*2*pi;

b0 = 1; 
b1 = -2*cos(omega1);
b2 = 1;

b3 = 1; 
b4 = -2*cos(omega2);
b5 = 1;

coeff = [b0, b1, b2];
coeff2 = [b3, b4, b5];


% x = (b0 + b1 + b2);
% x2 = (b3 + b4 + b5);
% 
 x3 = conv(coeff,coeff2);

% b0 = 1;
% b1 = -2*cos(0.1943*2pi)-2*cos(0.2778*2pi);
% b2 = 1 + 4*cos(0.1943*2pi)*cos(0.2778*2pi);
% b3 = -2*cos(0.1943*2pi)-2*cos(0.2778*2pi);
% b4 = 1;

%coeff = [b0,b1,b2,b3,b4];


%filt = conv(xxbad, coeff);
filt = conv(xxbad, x3);

w = -pi:(pi/100):pi;
figure(3);
%H = freqz(x3, 1, w);
H = freqz(filt, 1, w);
plot(w, abs(H));
title('Frequency Response of Cascaded Filter');

figure(4);
spectrogram(filt)

sound(filt)
