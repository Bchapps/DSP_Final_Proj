% Lab S-5 Problem 2.3 - Group 4
% Removing Interference from a Speech Signal

%Part a: Load speechbad (xxbad), listen to signal, make a spectrogram
%in dB. 

clc
clear all
close all

load('speechbad.mat', 'xxbad')


% Plot of initial data
figure(1)
plot(xxbad)
xlabel('Frequency (Hz)')
title('Initial xxbad Data')

fs = 8000; % Hz. Sampling rate
amp1 = 1555; % Hz. First large amplitude sinusoid.
amp2 = 2222; % Hz. Second large amplitude sinusoid.
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

omega1 = (amp1/fs)*2*pi; % Normalized frequency
omega2 = (amp2/fs)*2*pi; % Normalized frequency

% Coefficients as a result of derivation for second order nulling cascaded
% nulling FIR filter:
b0 = 1; 
b1 = -2*cos(omega1);
b2 = 1;

b3 = 1; 
b4 = -2*cos(omega2);
b5 = 1;

% Place coefficients into arrays for convolution:
coeff1 = [b0, b1, b2]; 
coeff2 = [b3, b4, b5];
convcoeff = conv(coeff1,coeff2);

% Convolve initial audio signal with second-order nulling coefficients:
filt = conv(xxbad, convcoeff); 
w = -pi:(pi/100):pi;

figure(3);
% Returns w-point frequency response vector H at the normalized frequencies
% in w:
H = freqz(filt, 1, w);
plot(w, abs(H));
title('Frequency Response of Cascaded Filter');

figure(4);
spectrogram(filt)
title('Filtered Spectrogram')

pause(4) % 4 second delay so you can hear the before and after of the audio
sound(filt)
