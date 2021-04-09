clc
clear all
close all
load('EEG.mat')
Fs = 1;                       % Sampling frequency
T = 1/Fs;                     % Sampling period
L = 32399;                    % Length of signal
t = (0:L-1)*T;                % Time vector
Y = fft(val);
f = (0:length(Y)-1)*50/length(Y);
plot(f,abs(Y))
title('Magnitude')
val=abs(Y);