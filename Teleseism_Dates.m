% Provides the start and end dates of all the teleseisms for all the zones 

clc, clear

% Pulling teleseism data

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2010, 1, 1), ...
        datenum(2017, 1, 1), 7, [-90 90 -180 180]);
    
numdate = datenum(y, mo, d, h, mi, s);

strtdate = datestr(numdate, 31);

enddate = [ ];

for i=1:length(numdate)
    
    date2hr = addtodate(numdate(i), 2, 'hour');
    
    enddate = [enddate, date2hr];
    
end

endate = datestr(enddate, 31);