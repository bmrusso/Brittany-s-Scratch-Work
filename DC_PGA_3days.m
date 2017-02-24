% Removes the double counting on the earthquakes that pass the specific
% threshold.

clc, clear

% Load the threshold data

load zone_data.mat
load shakingrate15_3.mat
load shakingrate6_3.mat
load shakingrate19_3.mat

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

ma15 = ma(index15);
ma6 = ma(index6);
ma19 = ma(index19);

m7date = datenum(y, mo, d,h,mi,s);
m7date19 = m7date(index19);
m7date6 = m7date(index6);
m7date15 = m7date(index15);

% Removing Unnecessary dates from vector

start_date = datenum(2006,1,1);
not_date = find(squaredate{9} < start_date);
squaredate{9}(not_date) = [ ];

magn{9}(not_date) = [ ];

% Correcting for double counting when threshold is 0.00015

m_before = find(quakebefore19 > 0);
m_after = find(quakeafter19 >0);
totsubtract19(25) = 0;
totsubtract19(26) = 0;
totsubtract19(29) = 0;
totsubtract19(30) = 0;
totsubtract19(40) = 0;
totsubtract19(44) = 0;
totsubtract19(46) = 0;

% Correcting for double counting when threshold is 0.0003

m_before = find(quakebefore15 > 0);
m_after = find(quakeafter15 >0);
totsubtract15(4) = 0;

% Correcting for double counting when threshold is 0.0006

m_before = find(quakebefore6 > 0);
m_after = find(quakeafter6 >0);
totsubtract6(7) = 0;
totsubtract6(9) = 0;
totsubtract6(10) = 0;
totsubtract6(14) = 0;

%Plotting the earthquakes
hold on
stem(squaredate{9}, magn{9}, 'g')
stem(m7date6, ma6, 'r--')
datetick('x', 1)

rateaft = find(quakeafter6 >0);
ratebef = find(quakebefore6 > 0);

stem(m7date6(rateaft), ma6(rateaft), 'k')
stem(m7date6(ratebef), ma6(ratebef), 'b')

stem(m7date6(rateaft)+3, ma6(rateaft), 'c-')
stem(m7date6(rateaft)-3, ma6(rateaft), 'c-')

stem(m7date6(ratebef)+3, ma6(ratebef), 'm-')
stem(m7date6(ratebef)-3, ma6(ratebef), 'm-')

stem(m7date6(14), ma6(14), 'y--')
stem(m7date6(13), ma6(13), 'y--')
stem(m7date6(15), ma6(15), 'y--')
stem(m7date6(16), ma6(16), 'y--')
hold off

