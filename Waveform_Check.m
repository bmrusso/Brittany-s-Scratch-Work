% Creates plots of the waveforms

load OK_Corr_Data.mat

[rows, col] = size(corrseismograms);

for i=108
    
    eq1 = corrseismograms(i*6-5,:);
    eq2 = corrseismograms(i*6-4,:);
    eq3 = corrseismograms(i*6-3,:);
    
    figure(i)
    subplot(6,1,1)
    plot(eq1)
    subplot(6,1,2)
    plot(eq2)
    subplot(6,1,3)
    plot(eq3)
    
end