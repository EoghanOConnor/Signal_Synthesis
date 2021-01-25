%sigsynth.m file
clear all;
close all;

load('trumpet');%Loading Trumpet sound
Fs=30000; % sampling frequency
sound(trumpet,Fs)% running the sound with 11kHz freq
pause(3);%pause to seperate the sounds

Y = fft(trumpet, 512);% take the fft of trumpet
Ymag = abs(Y(1:257)); % take the mag of Y
f = Fs * (0:256)/512; % get a meaningful axis 
t = 0:1/Fs:(length(trumpet) * 1/Fs);
subplot(2,1,1)
stem(f, Ymag); % plot Ymag (only half the points are needed)
title('Original')
xlabel("Frequency (Hz)")
ylabel("Magnitude")


%To get the top 10 amp values and freq
mag = maxk(Ymag, 1); %Get the 10 highest values of Ymag
freq = zeros(1,1); %array of zeros for freq

for i=1:length(Ymag) %for loops of length of Ymag
    for j = 1:length(mag) 
        if(Ymag(i) == mag(j))%if the Ymag value is the same as mag value
            freq(j) = f(i); % let freq equal the corresponding from f array.
        end
    end
end

%Using the cosine function, created seperately.
out_Y= addcosines(t,freq,mag);



% Plotting new points of Freq & Mag
subplot(2,1,2)
stem(freq,mag);
title('Synth')
xlabel("Frequency (Hz)")
ylabel("Magnitude")
subplot(2,1,1)
%Fs=11000;
sound(out_Y,Fs)