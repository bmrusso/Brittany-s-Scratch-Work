% Plots the cumulative sum of the triggering count where double counting 
% has been account for, for the 7 day period against the date of the 
% teleseisms.

% ---------------------------------------------------------------------

clc, clear

%% Plotting Cog

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1976, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{2}(:,2)), mean(zonecell{2}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,1)
plot(m5date, cumsum(totsubtract{2}))
datetick('x', 1)
legend('Cog')
hold off



%% Plotting Bewton 

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1997, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{1}(:,2)), mean(zonecell{1}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,2)
plot(m5date, cumsum(totsubtract{1}))
datetick('x', 1)
legend('Bewton')
hold off



%% Plotting Dagger

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1998, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{3}(:,2)), mean(zonecell{3}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,3)
plot(m5date, cumsum(totsubtract{3}))
datetick('x', 1)
legend('Dagger')
hold off


%% Plotting Fash

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1973, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{4}(:,2)), mean(zonecell{4}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,4)
plot(m5date, cumsum(totsubtract{4}))
datetick('x', 1)
legend('Fash')
hold off



%% Plotting NCentArk

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2009, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{5}(:,2)), mean(zonecell{5}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,5)
plot(m5date, cumsum(totsubtract{5}))
datetick('x', 1)
legend('NCentArk')
hold off



%% Plotting Greeley

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2013, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{6}(:,2)), mean(zonecell{6}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,6)
plot(m5date, cumsum(totsubtract{6}))
datetick('x', 1)
legend('Greeley')
hold off


%% Plotting Irving

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{7}(:,2)), mean(zonecell{7}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,7)
plot(m5date, cumsum(totsubtract{7}))
datetick('x', 1)
legend('Irving')
hold off


%% Plotting NTX

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{8}(:,2)), mean(zonecell{8}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,8)
plot(m5date, cumsum(totsubtract{8}))
datetick('x', 1)
legend('NTX')
hold off


%% Plotting Venus

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{14}(:,2)), mean(zonecell{14}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,9)
plot(m5date, cumsum(totsubtract{14}))
datetick('x', 1)
legend('Venus')
hold off


%% Plotting OK/KS

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2006, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{9}(:,2)), mean(zonecell{9}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,10)
plot(m5date, cumsum(totsubtract{9}))
datetick('x', 1)
legend('OK/KS')
hold off


%% Plotting Paradox

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1991, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{10}(:,2)), mean(zonecell{10}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,11)
plot(m5date, cumsum(totsubtract{10}))
datetick('x', 1)
legend('Paradox')
hold off



%% Plotting Raton

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2001, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{11}(:,2)), mean(zonecell{11}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,12)
plot(m5date, cumsum(totsubtract{11}))
datetick('x', 1)
legend('Raton')
hold off


%% Plotting Sun City

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2015, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{12}(:,2)), mean(zonecell{12}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,13)
plot(m5date, cumsum(totsubtract{12}))
datetick('x', 1)
legend('Sun City')
hold off


%% Plotting Timp

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2011, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{13}(:,2)), mean(zonecell{13}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,14)
plot(m5date, cumsum(totsubtract{13}))
datetick('x', 1)
legend('Timp')
hold off


%% Plotting Youngs

clear

load mag5data.mat

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2010, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

deglimit = km2deg(500);

disteq = distance(mean(zonecell{15}(:,2)), mean(zonecell{15}(:,1)), la, lo);

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);

m5date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,15)
plot(m5date, cumsum(totsubtract{15}))
datetick('x', 1)
legend('Youngs')
hold off


% ----------------------------------------------------------------------

