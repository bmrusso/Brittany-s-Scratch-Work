% Number of Earthquakes before and after the 16th event

% Loading all the earthquake data for magnitude 7 in 2011 and all the 
% earthquake data for the specific region. 

[y,mo,d,h,mi,s] = LoadComCat(datenum(2011, 1, 1), datenum(2012, 1, 1), 7);

[year, month, day, hour, min, sec] = LoadComCat(datenum(2011, 1, 1), ...
    datenum(2012, 1, 1), 0, [36.6 37.5 -105.3 -104.4]);

% Converting date into numbers

for i=1:length(y)

eqdate = datenum(y(i), mo(i), d(i));

date1 = datenum(year, month, day);

% Find the number of earthquakes a week before 

date2(i) = find(date1 <= eqdate(i));

date3(i) = find(date1 > (eqdate(i) - 8));

numbf(i) = length(intersect(date2(i), date3(i)));

% Find the number of earthquakes a week after

date4(i) = find(date1 >= eqdate(i));

date5(i) = find(date1 < (eqdate(i) +8));

numaf(i) = length(intersect(date4(i), date5(i)));

end

numbf(i)
