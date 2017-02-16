
clc, clear

load num_eq_data.mat
load peak_ground_data.mat

% Plots the Peak ground velocity and acceleration by the magnitude of the
% teleseism
figure(1)
plot(magvec{9}', PGV, 'o')

figure(2)
plot(magvec{9}', PGA, 'o')

% Determining the distance from the station to the teleseism
deglen = distance(lavec{9}, lovec{9}, 34.7379, -98.7807);

kmlen = deg2km(deglen);

% Plotting the distance from the station to the teleseism by the peak
% ground velocity and the peak ground acceleration 
figure(3)
plot(kmlen', PGV, 'o')

figure(4)
plot(kmlen', PGA, 'o')