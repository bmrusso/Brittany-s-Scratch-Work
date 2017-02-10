% Removes the double counting of earthquakes for each zone

clc, clear

load mag5data.mat


%% Double Counting Correction For Bewton
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1997, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

disteq = distance(mean(zonecell{1}(:,2)), mean(zonecell{1}(:,1)), la, lo);

deglimit = km2deg(500);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(1997,1,1);
not_date = find(squaredate{1} < start_date);
squaredate{1}(not_date) = [ ];

magn{1}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{1} > 0);
m_after = find(totafter{1} >0);
dblecount = find(totsubtract{1} > 0 | totsubtract{1} < 0);

m5bewton7 = totsubtract{1};

%% Double Counting Correction For Cog
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1976, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

disteq = distance(mean(zonecell{2}(:,2)), mean(zonecell{2}(:,1)), la, lo);

deglimit = km2deg(500);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(1976,1,1);
not_date = find(squaredate{2} < start_date);
squaredate{1}(not_date) = [ ];

magn{2}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{2} > 0);
m_after = find(totafter{2} >0);
dblecount = find(totsubtract{2} > 0 | totsubtract{2} < 0);

m5cog7 = totsubtract{2};

%% Double Counting Correction For Dagger
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1998, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

disteq = distance(mean(zonecell{3}(:,2)), mean(zonecell{3}(:,1)), la, lo);

deglimit = km2deg(500);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(1998,1,1);
not_date = find(squaredate{3} < start_date);
squaredate{3}(not_date) = [ ];

magn{3}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{3} > 0);
m_after = find(totafter{3} >0);
dblecount = find(totsubtract{3} > 0 | totsubtract{3} < 0);

m5dagger7 = totsubtract{3};

%% Double Counting Correction For Fash
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1973, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

disteq = distance(mean(zonecell{4}(:,2)), mean(zonecell{4}(:,1)), la, lo);

deglimit = km2deg(500);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(1973,1,1);
not_date = find(squaredate{4} < start_date);
squaredate{4}(not_date) = [ ];

magn{4}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{4} > 0);
m_after = find(totafter{4} >0);
dblecount = find(totsubtract{4} > 0 | totsubtract{4} < 0);

m5fash7 = totsubtract{4};

%% Double Counting Correction For NCentArk
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2009, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

disteq = distance(mean(zonecell{5}(:,2)), mean(zonecell{5}(:,1)), la, lo);

deglimit = km2deg(500);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(2009,1,1);
not_date = find(squaredate{5} < start_date);
squaredate{5}(not_date) = [ ];

magn{5}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{5} > 0);
m_after = find(totafter{5} >0);
dblecount = find(totsubtract{5} > 0 | totsubtract{5} < 0);

% m5ncentark7 = totsubtract{5};

%% Double Counting Correction For Greeley
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2013, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

disteq = distance(mean(zonecell{6}(:,2)), mean(zonecell{6}(:,1)), la, lo);

deglimit = km2deg(500);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(2013,1,1);
not_date = find(squaredate{6} < start_date);
squaredate{6}(not_date) = [ ];

magn{6}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{6} > 0);
m_after = find(totafter{6} >0);
dblecount = find(totsubtract{6} > 0 | totsubtract{6} < 0);

m5greeley7 = totsubtract{6};

%% Double Counting Correction For Irving, NTX, Venus
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{7}(:,2)), mean(zonecell{7}(:,1)), la, lo);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(2008,1,1);
not_date = find(squaredate{7} < start_date);
squaredate{7}(not_date) = [ ];

magn{7}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{7} > 0);
m_after = find(totafter{7} >0);
dblecount = find(totsubtract{7} > 0 | totsubtract{7} < 0);

m5irving7 = totsubtract{7};

% For NTX

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

disteq = distance(mean(zonecell{8}(:,2)), mean(zonecell{8}(:,1)), la, lo);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(2008,1,1);
not_date = find(squaredate{8} < start_date);
squaredate{8}(not_date) = [ ];

magn{8}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{8} > 0);
m_after = find(totafter{8} >0);
dblecount = find(totsubtract{8} > 0 | totsubtract{8} < 0);

m5ntx7 = totsubtract{8};

% For Venus

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

disteq = distance(mean(zonecell{8}(:,2)), mean(zonecell{8}(:,1)), la, lo);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(2008,1,1);
not_date = find(squaredate{8} < start_date);
squaredate{8}(not_date) = [ ];

magn{8}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{8} > 0);
m_after = find(totafter{8} >0);
dblecount = find(totsubtract{8} > 0 | totsubtract{8} < 0);

% m5ntx7 = totsubtract{8};


%% Double Counting Correction For Greeley
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2001, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

disteq = distance(mean(zonecell{11}(:,2)), mean(zonecell{11}(:,1)), la, lo);

deglimit = km2deg(500);

largerdeg = find(disteq > deglimit);

y(largerdeg) = [ ];
mo(largerdeg) = [ ];
d(largerdeg) = [ ];
h(largerdeg) = [ ];
mi(largerdeg) = [ ];
s(largerdeg) = [ ];
ma(largerdeg) = [ ];

m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector

start_date = datenum(2001,1,1);
not_date = find(squaredate{11} < start_date);
squaredate{11}(not_date) = [ ];

magn{11}(not_date) = [ ];

% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{11} > 0);
m_after = find(totafter{11} >0);
dblecount = find(totsubtract{11} > 0 | totsubtract{11} < 0);

% m5greeley7 = totsubtract{6};



%Plotting the earthquakes

hold on
stem(squaredate{11}, magn{11}, 'g')
stem(m7date, ma, 'r--')
datetick('x', 1)

rateaft = find(totafter{11} >0);
ratebef = find(totbefore{11} > 0);

stem(m7date(rateaft), ma(rateaft), 'k')
stem(m7date(ratebef), ma(ratebef), 'b')

stem(m7date(rateaft)+7, ma(rateaft), 'c-')
stem(m7date(rateaft)-7, ma(rateaft), 'c-')

stem(m7date(ratebef)+7, ma(ratebef), 'm-')
stem(m7date(ratebef)-7, ma(ratebef), 'm-')

stem(m7date(1), ma(1), 'y--')
stem(m7date(2), ma(2), 'y--')
% stem(m7date(78), ma(78), 'y--')
% stem(m7date(79), ma(79), 'y--')
% 
hold off
