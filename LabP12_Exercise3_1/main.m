%% Lab P-12 Exercise 3.1 -- Nulling Filter
% Group 4 - Braxton Chappell, Emma Dingman, Marlo Esperson, Sam Hansen 

clear;
close all;

%% Part A
% This portion is setting up the coefficients for the two nulling filters
% that are used. These nullinig filters then get cascaded to create one
% nulling filter that filters out the frequencies 0.44pi and 0.7pi. 
omega1 = 0.44 * pi;
omega2 = 0.7 * pi;

b0 = 1; 
b1 = -2*cos(omega1);
b2 = 1;

b3 = 1; 
b4 = -2*cos(omega2);
b5 = 1;

coeff1 = [b0, b1, b2];
coeff2 = [b3, b4, b5];

Cascaded_filter = conv(coeff1, coeff2);

% ALSO INCLUDED is the frequency response of the designed filter. This is
% to visually confirmt he success of the design. 
w = -pi:(pi/100):pi;
figure(1);
H = freqz(Cascaded_filter, 1, w);
plot(w, abs(H));
title('Frequency Response of Cascaded Filter', 'FontSize', 14);
ylabel('Magnitude', 'FontSize', 14);
xlabel('Normalized Frequency', 'FontSize', 14)

%% Part B
% Part B generates a signal in the time domain. It asks for 150 samples. I
% plot it for visualization and comparison for future questions. 
n = 0:149;

xn = 5*cos(0.3*pi.*n)+22*cos((0.44*pi.*n)-(pi/3))+22*cos((0.7*pi.*n)-(pi/4));

figure(2);
plot(xn(1:40));
title('First 40 Unfiltered Points', 'FontSize', 14)
xlabel('Time Domain', 'FontSize', 14);
ylabel('Magnitude', 'FontSize', 14);

%% Part C
% The filter designed in part A and the signal generated in part B is
% convolved to filter out the sinusoids that we want. 


filtered_signal = conv(xn, Cascaded_filter);


%% Part D
% Because, theoretically, the two other cosine waves in the signal got
% ellimiated out, the resulting signal should be the other cosine wave that
% doesnt have a fundamental frequency within that bandwidth. 

figure(3);
plot(filtered_signal(1:40));
title('First 40 points of Filtered Signal', 'FontSize', 14);
ylabel('Magnitude', 'FontSize', 14);
xlabel('Time Domain', 'FontSize', 14);

n_hand = [5:40];
x_hand = 5*cos(0.3*pi*n_hand);

%% part E
% Here the hand calculated and the filtered signal are compared. 

figure(4);
subplot(2,1,1);
plot(x_hand);
title('Hand Filtered Output Signal', 'FontSize', 14);
subplot(2,1,2);
plot(filtered_signal(5:40));
title('Designed Filter Filtered Signal', 'FontSize', 14);

% They aren't exactly alligned, but the shape is almost exactly the same. 

%% Part F
% The output signal is different for the first 5 points because it takes
% that many points for the filter to be fully incorporated within the
% signal. If the filter is designed by hand, the polynomial will have the
% lowest order of z^-4, or five terms. Once the fifth term is integrated
% into the signal, it can behave properly. 

%% Bonus
% I wanted to include a spectrogram as well to show the frequency used. 
figure(5);
spectrogram(filtered_signal);
title('Concentration of Frequencies', 'FontSize', 14);
xlabel('Normalized Frequencies', 'FontSize', 14);
ylabel('Signal in Time Domain', 'FontSize', 14);
