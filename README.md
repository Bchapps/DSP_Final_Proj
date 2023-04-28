# DSP_Final_Proj

# Frequency Response of FIR Nulling Filters
## About the Project:
## Getting Started:
### Installation
The programs and files in this repository are intended to be run in Matlab. Ensure that all files downloaded in this repository are within the user's "Current Folder" in the Matlab environment.
## Frequency Response: Bandpass and Nulling Filters: Lab P-12 -- 3 Lab Exercise
### Nulling Filters for Rejection: 3.1 (P_12_Q3_1)
A nulling filter is designed to null out frequencies of .44pi and .7pi. This is done by taking the coefficients of a simple nulling filter (1, 2*cos(omega), and 1) , and inputting the two frequencies desired to be nulled out in for omega. Now, there are two different nulling filters for two different frequencies. These filters are then cascaded to null both frequencies out. This is done by a convolution. 

A unfiltered signal is genreated as "xn". This signal is put through the filter to filter out two of the three sinusoidal components in it. What is left over is just 5cos(0.3*pi) and that is what is displayed. 

THIS FILE SHOULD RUN WITH NO FURTHER INSTRUCTION REQUIRED. AN HTML VIEW IS ALSO GENERATED IF RUNNING IT IS NOT DESIRED. 


### Simple Bandpass Filter Design: 3.2


## DLTI GUI and Nulling Filters: Lab S-5 -- 2 Lab Exercise
### Removing Interference from a Speech Signal: 2.3
The purpose of this exercise was to design and use an FIR nulling filter to remove two very large amplitude sinusoids at 1555 Hz and 2222 Hz from a given desired speech signal file, "xxbad".

**Filter design**

A cascaded nulling FIR filter was the chosen design for this project. Each of the two cascaded filters nulls one of the two large amplitude sinusoids. They are then cascaded into one equivalent filter. The process of solving for the coefficients of a single second-order FIR filter is shown below:

y[n] = b<sub>0</sub>x[n] + b<sub>1</sub>x[n-1] + b<sub>2</sub>x[n-2]

H(e<sup>jomega</sup>) = b<sub>0</sub> + b<sub>1</sub>e<sup>-jomega</sup> + b<sub>2</sub>e<sup>-2j*omega</sup>
  where omega is the one of the large amplitude sinusoids normalized by the sampling frequency.

We want this response to go to zero at the unwanted frequencies (omega), so we can solve as follows:

b<sub>0</sub> + b<sub>1</sub>cos(omega) + b<sub>2</sub>cos(2omega) - j(b<sub>1</sub>sin(omega) + b<sub>2</sub>sin(omega)) = 0

**....**

After some solving, we get:

b<sub>1</sub> = -2b<sub>2</sub>cos(omega) and b<sub>0</sub> = b<sub>2</sub>

Our coefficients are then represented as shown below:

h[n] = {b<sub>0</sub>, -2b<sub>0</sub>cos(omega), b<sub>0</sub>} where  b<sub>0</sub> = 1


In the program, six coefficients exist to represent the two FIR nulling filters that cancel out the two large sinusoids. These coefficients are then convolved together, and the convolved coefficients are then convolved with the initial distorted signal. They are passed into a frequency response vector. When this program plays, the initial distorted audio signal will play. After a built-in delay of 4 seconds, the filtered audio signal will play.


RUNNING THE Q2_3final.m VERSION OF THIS QUESTION SHOULD RUN WITH NO FURTHER INSTRUCTION REQUIRED. THE ONLY OPPORTUNITY FOR IT TO NOT RUN AS DESIGNED IS IF THE SOUND FILE DOESN'T GET LOADED IN PROPERLY. THE CODE IS DESIGNED TO HAVE IT WITHIN THE SAME FOLDER AND SHOULD DOWNLOAD THAT WAY. 
