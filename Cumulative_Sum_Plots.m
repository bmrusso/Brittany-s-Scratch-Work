% Plots the cumulative sum of the triggering count where double counting 
% has NOT been account for, for the 7 day period against the date of the 
% teleseisms.

% ---------------------------------------------------------------------

clc, clear

% Plotting Cog

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1976, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{2});

m7date = datenum(y, mo, d, h, mi, s);

hold on
figure 
subplot(3,5,1)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Cog')
hold off

clear 

% Plotting Bewton

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1997, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{1});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,2)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Bewton')
hold off

clear 

% Plotting Dagger

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1998, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{3});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,3)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Dagger')
hold off

clear 

% Plotting Fash

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1973, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{4});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,4)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Fash')
hold off

clear 

% Plotting NCentArk

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2009, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{5});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,5)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('fsark')
hold off

clear 

% Plotting Greeley

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2013, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{6});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,6)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Greeley')
hold off

clear 

% Plotting Irving, NTX, Venus

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{7});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,7)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Irving')
hold off

cum_sum1 = cumsum(totsubtract{8});

hold on
subplot(3,5,8)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('NTX')
hold off

cum_sum1 = cumsum(totsubtract{14});

hold on
subplot(3,5,9)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Venus')
hold off

clear 

% Plotting Oklahoma-Kansas

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2006, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{9});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,10)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('OK/KS')
hold off

clear 

% Plotting Paradox

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1991, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{10});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,11)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Paradox')
hold off

clear 

% Plotting Raton

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2001, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{11});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,12)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Raton')
hold off

clear 

% Plotting Sun City

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2015, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{12});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,13)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('SunCity')
hold off

clear 

% Plotting Timp

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2011, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{13});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,14)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Timp')
hold off

clear 

% Plotting Youngs

load num_eq_data.mat

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2010, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(totsubtract{15});

m7date = datenum(y, mo, d, h, mi, s);
hold on
subplot(3,5,15)
plot(m7date, cum_sum1)
datetick('x', 1)
legend('Youngs')
hold off

