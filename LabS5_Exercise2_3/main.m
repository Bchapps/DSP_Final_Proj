% Lab S-5 Problem 2.3 - Group 4
% Removing Interference from a Speech Signal

clc
clear all
close all

%% 2.3a) Load speechbad (xxbad), listen to signal, make a spectrogram in dB

load('speechbad.mat', 'xxbad')

sound(xxbad); %Converts matrix of signal data to sound. Matlab function.
%Confirms interference is so strong that the speech is unrecognizable.

figure(1)
spectrogram(xxbad)
title('Initial Spectrogram', 'FontSize', 14)
set(gca, 'FontSize', 14)


%% 2.3b) Design a cascade of two FIR Nulling filters to remove the
% sinusoids completely. This can be accomplished by finding the numerical 
% values of the filter coefficients for each second-order nulling filter.
% Combine the cascaded filters into one equivalent FIR filter, and give the
% filter coefficients of the equivalent filter.

fs = 8000; % Hz. Sampling rate
amp1 = 1555; % Hz. First large amplitude sinusoid.
amp2 = 2222; % Hz. Second large amplitude sinusoid.
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
convcoeff = conv(coeff1,coeff2); % Filter coefficients of the equivalent filter.

fprintf('Filter coefficients of equivalent filter: ');
convcoeff
%% 2.3c) Plot the frequency response of the cascaded nulling filter.

% Convolve initial audio signal with second-order nulling coefficients:
filt = conv(xxbad, convcoeff); 
w = -pi:(pi/100):pi;

figure(2);
% Returns w-point frequency response vector H at the normalized frequencies
% in w:
coeff_freq = freqz(convcoeff,1,w);
plot(w, abs(coeff_freq))
title('Frequency Response of Cascaded Filter', 'FontSize', 14);
xlabel('Normalized Frequency', 'FontSize', 14);
ylabel('Magnitude', 'FontSize', 14);

fprintf('The nulls are seen at (1.7452, 0) and (1.2213, 0) along with (-1.7452, 0) and (-1.2213, 0) which are consistent the omega1 and omega2 values calculated in part b.');
% c) The nulls are found at (1.7452, 0) and (1.2213, 0) 
% along with (-1.7452, 0) and (-1.2213, 0) which are consistent
% the omega1 and omega2 values calculated in part b above.

%% 2.3d) Process xxbad through the nulling filters. Indicate where the
% nulls are found.

figure(3) % Extra graph to look at Audio Signal Frequency Response
H = freqz(filt, 1, w);
A = freqz(xxbad, 1, w);
plot(w, abs(H));
title('Frequency Response of Audio Signal', 'FontSize', 14);
xlabel('Normalized Frequency', 'FontSize', 14);
ylabel('Magnitude of Filtered Signal', 'FontSize', 14);

figure(4);
spectrogram(filt) % Final Spectrogram. The two large sinusoids are now gone.
%We can compare this to the input audio signal in figure 1: "Initial
%Spectrogram" and verify that the nulling filters operated correctly.
fprintf('The two large sinusoids are now gone. We can compare this to the input audio signal in figure 1: "Initial Spectrogram" and we can confirm that the nulling filters have operated correctly.');
title('Filtered Spectrogram', 'FontSize', 14)
set(gca, 'FontSize', 14)

%% Extras: Final filtered sound. Initial and final frequency response of audio

pause(4) % 4 second delay so you can hear the before and after of the audio
sound(filt) % Final audio filtered through FIR filter.

figure(5)
subplot(2,1,1)
plot(w, abs(A));
title('Initial Audio Signal', 'FontSize', 14);
xlabel('Normalized Frequency', 'FontSize', 14);
ylabel('Signal Magnitude', 'FontSize', 14);

%figure(6)
subplot(2,1,2)
plot(w, abs(H));
title('Frequency Response of Filtered Signal', 'FontSize', 14);
xlabel('Normalized Frequency', 'FontSize', 14);
ylabel('Signal Magnitude', 'FontSize', 14)


%audiowrite('xxbad.wav', xxbad, fs)

%audiowrite('filt.wav', filt, fs)