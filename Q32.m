
L = 10; %Length of filter
wc = 0.44*pi; %center frequency
HH = passband(L,wc); %calls function that finds the freq response

%find the max gain
Hmax = max(abs(HH));

w1 = 0.44*pi;
w2 = 0.3*pi;
w3 = 0.7*pi;

%finding gain at the specified places
gain1 = abs(HH(441));
fprintf('Gain at w1=%g: %g\n', w1, gain1);
gain2 = abs(HH(301));
fprintf('Gain at w1=%g: %g\n', w2, gain2);
gain3 = abs(HH(701));
fprintf('Gain at w1=%g: %g\n', w3, gain3);

%find all locations that have a gain > 0.707*Hmac
locations = find(abs(HH) > 0.707*Hmax);
found = ww(locations);
fprintf('Frequencies with abs(H) > 0.707*Hmax: %s\n', join(string(found), ', '));

figure(1)
subplot(2,1,1);
plot(ww, abs(HH))
subplot(2,1,2);
plot(ww, angle(HH))
xlabel("Normalized Radian Frequency");

L2 = 20; %Length of filter
HH2 = passband(L2,wc); %calls function that finds the freq response

%find the max gain
Hmax2 = max(abs(HH2));


%finding gain at the specified places
gain12 = abs(HH2(441));
fprintf('Gain at w1=%g: %g\n', w1, gain12);
gain22 = abs(HH2(301));
fprintf('Gain at w1=%g: %g\n', w2, gain22);
gain32 = abs(HH2(701));
fprintf('Gain at w1=%g: %g\n', w3, gain32);

%find all locations that have a gain > 0.707*Hmac
locations2 = find(abs(HH2) > 0.707*Hmax2);
found2 = ww(locations2);
fprintf('Frequencies with abs(H) > 0.707*Hmax: %s\n', join(string(found2), ', '));

figure(2)
subplot(2,1,1);
plot(ww, abs(HH2))
subplot(2,1,2);
plot(ww, angle(HH2))
xlabel("Normalized Radian Frequency");


xlabel("Normalized Radian Frequency");

L3 = 40; %Length of filter
HH3 = passband(L3,wc); %calls function that finds the freq response

%find the max gain
Hmax3 = max(abs(HH3));


%finding gain at the specified places
gain13 = abs(HH3(441));
fprintf('Gain at w1=%g: %g\n', w1, gain13);
gain23 = abs(HH3(301));
fprintf('Gain at w1=%g: %g\n', w2, gain23);
gain33 = abs(HH3(701));
fprintf('Gain at w1=%g: %g\n', w3, gain33);

%find all locations that have a gain > 0.707*Hmac
locations3 = find(abs(HH3) > 0.707*Hmax3);
found3 = ww(locations3);
fprintf('Frequencies with abs(H) > 0.707*Hmax: %s\n', join(string(found3), ', '));

figure(3)
subplot(2,1,1);
plot(ww, abs(HH3))
subplot(2,1,2);
plot(ww, angle(HH3))
xlabel("Normalized Radian Frequency");





function [frequencyResponse] = passband(length,centerFreq)
L = length; %Length of filter
n = 0:L-1; % 0<= n < L
wc = centerFreq; %center frequency
hn = 1/L.*cos(wc.*n); %passband filte

ww = 0:0.001*pi:pi;
frequencyResponse = freqz(hn, 1, ww);

end
