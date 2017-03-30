% Creates plots of the waveforms from the instrument corrected data

% ----------------------------------------------------------------------

clc, clear

load OK_Corr_Data.mat

[rows, col] = size(corrseismograms);

% Plots the data

for i=9
   
    eq1 = corrseismograms(i*6-5,:);
    eq2 = corrseismograms(i*6-4,:);
    eq3 = corrseismograms(i*6-3,:);
    
    figure(i)
    subplot(3,1,1)
    plot(eq1)
    title('Example of Good Waveforms')
    subplot(3,1,2)
    plot(eq2)
    ylabel('Amplitude')
    subplot(3,1,3)
    plot(eq3)
    xlabel('Seconds from the Start Time')
    
end

% ----------------------------------------------------------------------