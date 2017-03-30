% Plots the cumulative sum of the triggering count where double counting 
% has been account for, for the 1 day period against the date of the 
% teleseisms.

% ---------------------------------------------------------------------

clc, clear

% Plotting Cog

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1976, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixcog1);

m7date = datenum(y, mo, d, h, mi, s);

hold on
subplot(3,5,1)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Cog')
hold off

clear 

% Plotting Bewton

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1997, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixbewt1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,2)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Bewton')
hold off

clear 

% Plotting Dagger

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1998, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixdagger1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,3)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Dagger')
title('Cumulative Sum Plot - 1 Day')
hold off

clear 

% Plotting Fash

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1973, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixfash1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,4)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Fash')
hold off

clear 

% Plotting NCentArk

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2009, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixncentark1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,5)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('fsark')
hold off

clear 

% Plotting Greeley

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2013, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixgreeley1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,6)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Greeley')
hold off

clear 

% Plotting Irving, NTX, and Venus

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixirving1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,7)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Irving')
hold off

cum_sum1 = cumsum(fixntx1);

hold on
subplot(3,5,8)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('NTX')
hold off

cum_sum1 = cumsum(fixvenus1);

hold on
subplot(3,5,9)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Venus')
hold off

clear 

Plotting Oklahoma-Kansas

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2006, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixokks1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,10)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('OK/KS')
hold off

clear 

% Plotting Paradox

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1991, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixparadox1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,11)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Paradox')
hold off

clear 

% Plotting Raton

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2001, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixraton1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,12)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Raton')
hold off

clear 

% Plotting Sun City

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2015, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixsuncity1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,13)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('SunCity')
hold off

clear 

% Plotting Timp

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2011, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixtimp1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,14)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Timp')
hold off

clear 

% Plotting Youngs

load fixed_dc1

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2010, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixyoungs1);

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,15)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Youngs')
hold off