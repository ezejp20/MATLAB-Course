%% Matlab Coursework 2, Student Number: 1759846
clear all;
%%
% *%2.(a) Calculate the sampling rate (fs) of the signal?*
load ecg.mat;
%The sampling rate is given as fs=360; this means the sampling rate is 360
%samples per second. 
%%
% *%2.(b) Estimate (calculation or described visual inspection) the heart-rate*
%In order to estimate the heart rate, I will plot the signal. First I need
%to mane a time array using the length of the V1 array and the sampling
%rate.
SP=1/fs; %This is calculating the sampling period
N=50000; %This is because I can see that the number of values in the signal is 50000
T=(0:N-1)*SP;%Here I am creating an array of time so that I can plot the signal against time
figure;
plot(T(1:3600),V1(1:3600));% I decided to plot only a small area of the graph so that I could easily count the number of peaks visually. 
title('ECG')
xlabel('Time (s)')
ylabel('Voltage (mV)')
%Over a period of 10 seconds I counted 13 peaks, meaning 13 heartbeats.
%This gives a heart rate of 13*6 bpm (beats per minute).
hr=13*6; %The heart rate is 78 bpm. 
%%
% *%2.(c)Zoom in on the signal and by visual inspection, look for the presence of noise at
% specific frequency*
figure;
plot(T,V1);% This time I plotted the entire signal to have a look. 
title('ECG')
xlabel('Time (s)')
ylabel('Voltage (mV)')
%The noise occurs between 900 and 1000 mV. 
%%
% *2.(d)Apply a low-pass filter, using the instructions*
fc=100; % filter cut-off frequency
filter_parameters.N=2; % the ‘order’ of the filter (default value)
fllter_parameters.type='butter';% the type of filter (‘Butterworth’)
filter_parameters.lphp='low'; % set the filter to low-pass
[b,a]=make_digital_filter(fc,fs,filter_parameters);
V1_lp=filtfilt(b,a,V1); % apply the filter

%%
% *2.(e)Determine, by visual inspection, whether the filter affects the output.*
figure;
plot(T,V1_lp);% I am plotting the filtered signal  
title('Filtered ECG')
xlabel('Time (s)')
ylabel('Filtered Voltage (mV)')
% I couldn't see any difference - to check I will subtract the two arrays
% from each other and plot the result:
VT=V1-V1_lp;
figure
plot(T,VT);% I am plotting the unfiltered signal minus the filtered signal
title('Unfiltered ECG - Filtered ECG')
xlabel('Time (s)')
ylabel('Voltage (mV)')
% This shows there was some effect of the filtering that wasn't visible by
% eye, because it was only making a difference of 0-4mV, and the previous graph goes all the way up to 1000mV.  
%%
% *2.(f)Lower the cut-off frequency and determine, approximately, what the minimum
% acceptable cut-off frequency is.* 
fc=5; % filter cut-off frequency
[b,a]=make_digital_filter(fc,fs,filter_parameters);
V1_lp=filtfilt(b,a,V1); % apply the filter
figure
plot(T(1:3600),V1_lp(1:3600));
title('Filtered ECG with fc=5')
xlabel('Time (s)')
ylabel('Voltage (mV)')
fc=10; % filter cut-off frequency
[b,a]=make_digital_filter(fc,fs,filter_parameters);
V1_lp=filtfilt(b,a,V1); % apply the filter
figure
plot(T(1:3600),V1_lp(1:3600));
title('Filtered ECG with fc=10')
xlabel('Time (s)')
ylabel('Voltage (mV)')
fc=20; % filter cut-off frequency
[b,a]=make_digital_filter(fc,fs,filter_parameters);
V1_lp=filtfilt(b,a,V1); % apply the filter
figure
plot(T(1:3600),V1_lp(1:3600));
title('Filtered ECG with fc=20')
xlabel('Time (s)')
ylabel('Voltage (mV)')
% Looking at the previous plots, I would say that the lowest acceptable
% cutoff frequency would be 20, as this just about preserves the
% information given in the original signal. 
%%
% *2.(g)Assuming that an anti-alias filter had been applied to the analogue ECG signal
% with the cut-off frequency selected in f, what is the minimum sampling rate that
% might have been used?* 
%
