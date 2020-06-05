clear all;
load resp_pig.mat;
%1.(a) The sampling frequency is given as 200, therefore we know that the
%sampling period will be the inverse of this. 
SP=1/fs; 
%1.(b) Plotting all of the signals
N=20001;
T=(0:N-1)*SP;%Here I am creating an array of time so that I can plot the signals against time
figure;
plot(T,flw);
title('Respiratory Air Flow (litres/s)')
xlabel('Time (s)')
ylabel('Volume of Air Flow (litres)')
figure;
plot(T,mouth_pressure);
title('Pressure in the Mouth(cmH20)')
xlabel('Time (s)')
ylabel('Pressure (cmH20)')
figure;
plot(T,volume);
title('Volume (litres)')
xlabel('Time (s)')
ylabel('Volume (L)')
%1.(c)Respiratory frequency in cycles/minute and volume of inspired air per
%respiratory cycle
%By looking at the volume graph, we can see that there are 17 cycles in 60
%seconds 
cyclesPerMin=17;
%The volume of air inspired per cycle is 0.145L 
volInspiredAirPerCycle=0.145;
%1.(d) Convert flow signal from litres/s to litres/min 
flwPerMin=flw/60;
%1.(e) Plot resultant signal from 43 to 51 seconds 
Tmins=T/60;
%I want to find 43 and 51 seconds in units of minutes
a=43/60;
b=51/60;
%now i am looking for the indicies of these crossing points 
A=find(Tmins>a);
B=find(Tmins>b);
%The first index in A was 8602, and the last in B was 10202 so to
%include the full range from 43s-51s I chose to plot the range from Tmins(8601:10202)
figure;
plot(Tmins(8601:10202),flwPerMin(8601:10202));
title('Respiratory Air Flow (litres/min)')
xlabel('Time (mins)')
ylabel('Volume of Air Flow (litres)')
%1.(f)Calculate the amplitude and phase spectra of the respiratory air flow signal.
[amplitude,phase,frequency]=a_p_dft(flw,fs,N);
%I calculated the amplitude and phase spectra using the fast fourier
%transform
%1.(g) Plot the spectra signal in the frequency domain. 
figure;
plot(frequency,phase);
title('Phase Spectra in Frequency Domain (/Hz)')
xlabel('Frequency (Hz)')
ylabel('Phase Spectra')
%1.(h)By considering the respiratory frequency (see items b and c above) check that the
%first three peaks in the amplitude spectrum correspond to the first three harmoncis of
%the respiratory frequency
figure;
plot(amplitude(1:100));
title('Amplitude')
ylabel('Amplitude')











