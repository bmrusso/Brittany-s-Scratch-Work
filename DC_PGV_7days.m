% Removes the double counting on the earthquakes that pass the specific
% threshold.

clc, clear

% Load the threshold data

load zone_data.mat
load shaking_rate1_5.mat
load shaking_rate3.mat
load shaking_rate6.mat
load shaking_rate15.mat
load teleseism_distance.mat

% Load all the teleseism data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2006, 1, 1), datenum(2017, 1, 1), ...
    7, [-90 90 -180 180]);

y(34)= [];
mo(34) =[];
d(34)= [];
h(34) =[];
mi(34)= [];
s(34) =[];
ma(34) =[];
y(13)= [];
mo(13) =[];
d(13)= [];
h(13) =[];
mi(13)= [];
s(13) =[];
ma(13) =[];

ma1_5 = ma(index1_5);
ma3 = ma(index3);
ma6 = ma(index6);
ma15 = ma(index15);

m7date = datenum(y, mo, d,h,mi,s);
m7date1_5 = m7date(index1_5);
m7date3 = m7date(index3);
m7date6 = m7date(index6);
m7date15 = m7date(index15);

% Removing Unnecessary dates from vector

start_date = datenum(2006,1,1);
not_date = find(squaredate{9} < start_date);
squaredate{9}(not_date) = [ ];

magn{9}(not_date) = [ ];

% Correcting for double counting when threshold is 0.00015

m_before = find(quakebefore1_5 > 0);
m_after = find(quakeafter1_5 >0);
dblecount = find(totsubtract1_5 > 0 | totsubtract1_5 < 0);
totsubtract1_5(18) = 0;
totsubtract1_5(19) = 0;
totsubtract1_5(22) = 0;
totsubtract1_5(23) = 0;
totsubtract1_5(37) = 0;
totsubtract1_5(39) = 0;
csum1_5 = cumsum(totsubtract1_5);

% Correcting for double counting when threshold is 0.0003

m_before = find(quakebefore3 > 0);
m_after = find(quakeafter3 >0);
dblecount = find(totsubtract3 > 0 | totsubtract3 < 0);
totsubtract3(12) = 0;
totsubtract3(13) = 0;
totsubtract3(16) = 0;
totsubtract3(17) = 0;
totsubtract3(25) = 0;
csum3 = cumsum(totsubtract3);

% Correcting for double counting when threshold is 0.0006

m_before = find(quakebefore6 > 0);
m_after = find(quakeafter6 >0);
dblecount = find(totsubtract6 > 0 | totsubtract6 < 0);
totsubtract6(4) = 0;
csum6 = cumsum(totsubtract6);

%Plotting the earthquakes

% figure(1)
% hold on
% plot(m7date1_5, csum1_5)
% plot(m7date1_5, csum1_5,'x')
% datetick('x', 23)
% hold off
% 
% figure(2)
% hold on 
% plot(m7date3, csum3)
% plot(m7date3, csum3, 'x')
% datetick('x', 23)
% hold off
% 
% figure(3)
% hold on
% plot(m7date6, csum6)
% plot(m7date6, csum6, 'x')
% datetick('x', 23)
% hold off
% 
% figure(4)
% hold on
% plot(m7date15, cumsum(totsubtract15))
% plot(m7date15, cumsum(totsubtract15),'x')
% datetick('x', 23)
% hold off

save PGV_dc_data.mat