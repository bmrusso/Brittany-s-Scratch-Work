clc, clear

[year,month,day,hour,mi,sec] = LoadComCat(datenum(2010, 3, 13), ...
  datenum(2012, 2, 20), 7, [-90 90 -180 180]);

datevector = datenum(year, month, day, hour, mi, sec);

for i=1:length(datevector)
date_end = addtodate(datevector(i), 3, 'hour');
bef_date = datevector - hours(3);

phc = irisFetch.Traces('TA','V35A','*','BH?',datestr(bef_date(i), 31),...
    datestr(datevector(i), 31));

phc2 = irisFetch.Traces('TA','V35A','*','BH?',datestr(datevector(i), 31),...
    datestr(date_end, 31));

filt_data{i} = phc;

filt_data_af{i} = phc2;
end