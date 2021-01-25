%addcosine.m function file
function x= addcosines(time,freq_X,mag_Y)%function inputs


x = zeros(1,length(time));%array to store values
for i= 1:length(mag_Y)
    x = x + mag_Y(i)*cos(2*pi*freq_X(i)*time);%values created using cosine
end
end