% Removes the double counting on the earthquakes that pass the specific
% threshold. 

clc, clear

% Load the threshold data

load zone_data.mat
load shaking_rate1_5.mat
load shaking_rate3.mat
load shaking_rate6.mat
load shaking_rate15.mat

% Load all the teleseism data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2006, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);

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


%Plotting the earthquakes

hold on
stem(squaredate{9}, magn{9}, 'g')
stem(m7date1_5, ma1_5, 'r--')
datetick('x', 1)

rateaft = find(quakeafter1_5 >0);
ratebef = find(quakebefore1_5 > 0);

stem(m7date1_5(rateaft), ma1_5(rateaft), 'k')
stem(m7date1_5(ratebef), ma1_5(ratebef), 'b')

stem(m7date1_5(rateaft)+7, ma1_5(rateaft), 'c-')
stem(m7date1_5(rateaft)-7, ma1_5(rateaft), 'c-')

stem(m7date1_5(ratebef)+7, ma1_5(ratebef), 'm-')
stem(m7date1_5(ratebef)-7, ma1_5(ratebef), 'm-')

stem(m7date1_5(19), ma1_5(19), 'y--')
stem(m7date1_5(21), ma1_5(21), 'y--')
stem(m7date1_5(22), ma1_5(22), 'y--')
stem(m7date1_5(23), ma1_5(23), 'y--')

hold off
