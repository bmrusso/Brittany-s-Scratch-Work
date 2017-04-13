% Plots the waveforms and picks the earthquakes

clc, clearvars -EXCEPT p_pick signal_pick

load Raton_WaveData.mat

waveform = all_wavedata{18};

% subplot(3,1,1)
plot(waveform(1).data)
% subplot(3,1,2)
% plot(waveform(2).data)
% subplot(3,1,3)
% plot(waveform(3).data)

% determining the time of the pick

gin_data = ginput;
num_sec = round(gin_data(:,1)/40);
local_dates = zeros(length(num_sec), 1);
local_time = addtodate(beforedate(188), num_sec, 'second');
picktime = datestr(local_time);

% second input

 gin_data = ginput;
num_sec = round(gin_data(:,1)/40);
local_dates = zeros(length(num_sec), 1);
local_time = addtodate(beforedate(188), num_sec, 'second');
picktime2 = datestr(local_time);   