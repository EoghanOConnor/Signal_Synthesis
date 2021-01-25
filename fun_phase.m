%fun_phase.m file
clear all;
close all;

Fs=8000; %sample frequency
mag1=65.11; %mag for sig1
freq1=796.7; %frequency for sig1
mag2=52.24; %mag for sig2
freq2=1055; %frequency for sig2
time = 0:1/Fs:1; % time for signals 
delay=pi/Fs; %delay for sig2

sig1= mag1*cos(2*pi*freq1*time) + mag2*cos(2*pi*freq2*time);
soundsc(sig1,Fs)
pause(1)
sig2= mag1*cos(2*pi*freq1*(time-delay)) + mag2*cos(2*pi*freq2*(time ));
soundsc(sig2,Fs)

%Plotting periods of sig1 and sig2
figure(1)
subplot(2,1,1)
plot(sig1(1:100),'r')
xlabel('Time')
ylabel('Magnitude')
hold on;
plot(sig2(1:100),'g')

mag3=100.24;%mag for sig3 and sig4
freq3=4000; %freq for sig3 and sig4
delay2=pi/(4*Fs); % the delay for sig4

%2 new signals 
sig3= mag3*cos(2*pi*freq3*(time));
sig4= mag3*cos(2*pi*freq3*(time)) + mag2*cos(2*pi*freq2*(time-delay2 ));

%the sound of the signals being played.
soundsc(sig3,Fs)
soundsc(sig4,Fs)

%Plotting 3 different periods of sig3 and sig4
figure(2)
subplot(3,1,1)
plot(sig3(1:3),'r')
xlabel('Time')
ylabel('Magnitude')
hold on;
plot(sig4(1:2),'g')

figure(2)
subplot(3,1,2)
plot(sig3(100:105),'r')
xlabel('Time')
ylabel('Magnitude')
hold on;
plot(sig4(100:105),'g')

figure(2)
subplot(3,1,3)
plot(sig3(200:210),'r')
xlabel('Time')
ylabel('Magnitude')
hold on;
plot(sig4(200:210),'g')