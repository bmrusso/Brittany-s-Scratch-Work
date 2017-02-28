% Removes the double counting on the earthquakes that pass the specific
% threshold.

clc, clear

% Load the threshold data

load zone_data.mat
load shaking3_rate1_5.mat
load shaking3_rate3.mat
load shaking3_rate6.mat
load shaking3_rate15.mat

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

hold on
stem(squaredate{9}, magn{9}, 'g')
stem(m7date3, ma3, 'r--')
datetick('x', 1)

rateaft = find(quakeafter3 >0);
ratebef = find(quakebefore3 > 0);

stem(m7date3(rateaft), ma3(rateaft), 'k')
stem(m7date3(ratebef), ma3(ratebef), 'b')

stem(m7date3(rateaft)+3, ma3(rateaft), 'c-')
stem(m7date3(rateaft)-3, ma3(rateaft), 'c-')

stem(m7date3(ratebef)+3, ma3(ratebef), 'm-')
stem(m7date3(ratebef)-3, ma3(ratebef), 'm-')

% stem(m7date3(37), ma3(37), 'y--')
% stem(m7date3(38), ma3(38), 'y--')
% stem(m7date3(39), ma3(39), 'y--')
% stem(m7date3(40), ma3(40), 'y--')
hold off

save PGV_dc_data_3days.mat