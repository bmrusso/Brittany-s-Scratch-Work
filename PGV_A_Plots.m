
clc, clear

load num_eq_data.mat
load peak_ground_data.mat
load Fash_struct.mat

% magvec{9}(34) = [ ];
% magvec{9}(13) = [ ];
% 
% % Plots the Peak ground velocity and acceleration by the magnitude of the
% % teleseism
% figure(1)
% plot(magvec{9}', PGV, 'o', 'markerfacecolor', 'r')
% title('PGV vs. Magnitude')
% 
% figure(2)
% plot(magvec{9}', PGA, 'd', 'markerfacecolor', 'r')
% title('PGA vs Magnitude')

lavec(14) = [ ];
lovec(14) = [ ];
lovec(10) = [ ];
lavec(10) = [ ];
PGV_total(9) = [ ];
PGA_total(9) = [ ];
lavec(8) = [ ];
lovec(8) = [ ];

    

    
    %Determining the distance from the station to the teleseism
    deglen = distance(lavec{4}, lovec{4}, fash_data{length(fash_data)}(1).latitude,...
        fash_data{length(fash_data)}(1).longitude);
    
    kmlen = deg2km(deglen);
    
%     kmlen(34) = [];
%     kmlen(13) = [];
    
  % Plotting the distance from the station to the teleseism by the peak 
   %ground velocity and the peak ground acceleration
   
%     figure(1)
%     plot(kmlen', PGV_total{4}, 'o', 'markerfacecolor', 'b')
%     title('PGV vs Distance (km)')
%     
%     figure(2)
%     plot(kmlen', PGA_total{4}, 'd', 'markerfacecolor', 'b')
%     title('PGA vs Distance (km)')
    

    

% mag78 = find(magvec{i} >=7 & magvec{9} < 8);
% mag89 = find(magvec{9} >= 8 & magvec{9} < 9);
% mag910= find(magvec{9} >= 9 & magvec{9} < 10);
% 
% 
% figure(5)
% hold on
% plot(kmlen(mag78)', PGV(mag78), 'ok')
% plot(kmlen(mag89)', PGV(mag89), 'or')
% plot(kmlen(mag910)', PGV(mag910), 'o', 'markerfacecolor', 'c')
% title('PGV vs Distance (km)')
% hold off
% 
% figure(6)
% hold on
% plot(kmlen(mag78)', PGA(mag78), 'ok')
% plot(kmlen(mag89)', PGA(mag89), 'or')
% plot(kmlen(mag910)', PGA(mag910), 'o', 'markerfacecolor', 'c')
% title('PGA vs Distance (km)')
% hold off
% 
% save('teleseism_distance.mat', 'kmlen')