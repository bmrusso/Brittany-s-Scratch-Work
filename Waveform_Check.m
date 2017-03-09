% Creates plots of the waveforms

clc, clear

load Raton_Corr.mat

[rows, col] = size(corrseismograms);

for i=223
   
    eq1 = corrseismograms(i*6-5,:);
    eq2 = corrseismograms(i*6-4,:);
    eq3 = corrseismograms(i*6-3,:);
    
    figure(i)
    subplot(3,1,1)
    plot(eq1)
    subplot(3,1,2)
    plot(eq2)
    subplot(3,1,3)
    plot(eq3)
    
end