clear;
close all;
clc;
%% 3.2 Simple Bandpass Filter -- Group 4
% Braxton Chappell, Emma Dingman, Marlo Esperson, Sam Hansen

%% a) Generate a bandpass that will pass w = 0.44pi (with L = 10)
L = 10; %Length of filter
wc = 0.44*pi; %center frequency
HH = passband(L,wc);
ww = 0:0.001*pi:pi;

%find the max gain
Hmax = max(abs(HH));

w1 = 0.44*pi;
w2 = 0.3*pi;
w3 = 0.7*pi;

%finding gain at the specified places
fprintf('Gain at w1=%g: %g\n', w1, abs(HH(441)));
fprintf('Gain at w1=%g: %g\n', w2, abs(HH(301)));
fprintf('Gain at w1=%g: %g\n', w3, abs(HH(701)));

%% B) Find the band width and repeat with L = 20, L = 40
%find all locations that have a gain > 0.707*Hmac
locations = find(abs(HH) > 0.707*Hmax);
found = ww(locations);
fprintf('Frequencies with abs(H) > 0.707*Hmax: %s\n', join(string(found), ', '));


% B) cont. Repeat above for L = 20 and L = 40

L2 = 20; %Length of filter
HH2 = passband(L2,wc);

%find the max gain
Hmax2 = max(abs(HH2));


%finding gain at the specified places
fprintf('Gain at w1=%g: %g\n', w1, abs(HH2(441)));
fprintf('Gain at w1=%g: %g\n', w2, abs(HH2(301)));
fprintf('Gain at w1=%g: %g\n', w3, abs(HH2(701)));

%find all locations that have a gain > 0.707*Hmac
locations2 = find(abs(HH2) > 0.707*Hmax2);
found2 = ww(locations2);
fprintf('Frequencies with abs(H) > 0.707*Hmax: %s\n', join(string(found2), ', '));



L3 = 40; %Length of filter
HH3 = passband(L3,wc);

%find the max gain
Hmax3 = max(abs(HH3));


%finding gain at the specified places
fprintf('Gain at w1=%g: %g\n', w1, abs(HH3(441)));
fprintf('Gain at w1=%g: %g\n', w2, abs(HH3(301)));
fprintf('Gain at w1=%g: %g\n', w3, abs(HH3(701)));

%find all locations that have a gain > 0.707*Hmac
locations3 = find(abs(HH3) > 0.707*Hmax3);
found3 = ww(locations3);
fprintf('Frequencies with abs(H) > 0.707*Hmax: %s\n', join(string(found3), ', '));

%B) cont. Plot Freq response for L = 10, L = 20, L = 40
figure(1)
plot(ww, abs(HH))
xlabel("Normalized Radian Frequency", 'FontSize', 14);
ylabel("Magnitude", 'FontSize', 14);
title("Bandpass Filter (centered at 0.44*pi)", 'FontSize', 14);

figure(2)
plot(ww, abs(HH2))
xlabel("Normalized Radian Frequency", 'FontSize', 14);
ylabel("Magnitude", 'FontSize', 14);
title("Bandpass Filter (centered at 0.44*pi)", 'FontSize', 14);

figure(3)
plot(ww, abs(HH3))
xlabel("Normalized Radian Frequency", 'FontSize', 14);
ylabel("Magnitude", 'FontSize', 14);
title("Bandpass Filter (centered at 0.44*pi)", 'FontSize', 14);

%% c) Comment on the selectivity when L = 10
%When the length of the filter is 10 the gain at wc = 0.548 dB and at 
% w = 0.3*pi g = 0.142 dB and w = 0.7*pi g = 0.143 dB therefore supressing
% the signal at these frequencies. This is due to the bandpass filter we
% are using that is (1/L)*cos(wc*n) where 0<=n<=L-1. This filter will allow
% frequencies near wc through and depending on how large L is the filter
% will become more narrow. At L = 10 we are filtering out these other
% frequencies but not too efficiently since we define a stop band to be
% around 25% of our max gain this would come out to be g = 1.37 dB. We
% would then need to increase our length to achieve the optimal filtering.


%% D) Any frequency component satisfying |w| <= 0.3*pi will be reduced by a factor of 10
gain = 1;
Length = 10;
while gain > 0.1
   i =1;
   Length = Length + i;
   HH4 = passband(Length,wc);
   gain = abs(HH4(301))/abs(HH(301));
end
disp(Length);
%% D) Any frequency component satisfying 0.7*pi <= |w| <= pi will be reduced by a factor of 10

gains = 1;
Length2 = 10;
while gains > 0.1
   i =1;
   Length2 = Length2 + i;
   HH5 = passband(Length2,wc);
   gains = abs(HH5(701))/abs(HH(701));
end

disp(Length2);


%% E) Using sum of sinusiods filter 
nn = 0:1:100;
%sinusoid
xn = 5*cos(0.3*pi.*nn)+22*cos((0.44*pi.*nn)-(pi/3))+22*cos((0.7*pi.*nn)-(pi/4));
figure(4)
subplot(2,1,1);
plot(nn, xn);
title('Input', 'FontSize', 14);

bandpass = 2/L2.*cos(wc.*nn); %passband filter

output = conv(xn, bandpass);

subplot(2,1,2);
plot(nn,output(50:150));
title('Output', 'FontSize', 14);

%The sum of sinusiods is made up of 3 frequency components one at 0.3pi,
%0.44pi, and 0.7pi. This filter applied is a bandpass filter with the
%center frequency 0.44pi. center frequency at 0.44pi and with a length of
%L=20 we ensure that at the other frequency components are within the
%stopband. 

%% F) plot frequency response of sum of sinusiods
response = freqz(output, 1, ww);
figure(6)
plot(ww, abs(response));
title('Frequency Response of Output', 'FontSize', 14);
xlabel('Normalized Radial Frequency', 'FontSize', 14);
ylabel('Magnitude', 'FontSize', 14);

%Function that calculates the Frequency response at different lengths
%for a bandpass filter, at different center frequencies
function [frequencyResponse] = passband(length,centerFreq)
L = length; %Length of filter
n = 0:L-1; % 0<= n < L
wc = centerFreq; %center frequency
hn = 2/L.*cos(wc.*n); %passband filte

ww = 0:0.001*pi:pi;
frequencyResponse = freqz(hn, 1, ww);

end

