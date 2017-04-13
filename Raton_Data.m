% Pulls all the earthquakes in the Raton Basin

clc, clear

% Pulls the file containing all the zones.

zonelist=textread('./POLYGONS_2016/TOANALYZE/allregs','%s');


% Loops over all the zones and stores the data into variables

% Pulling the specific zone

zonebound=load(['./POLYGONS_2016/TOANALYZE/' zonelist{11}]);


% Pulling all the earthquakes for the zone

[year, month, day, hour, mnte, ...
    sec, lat, long, ~, magn] = LoadComCat(datenum(2008, 5, 25), ...
    datenum(2017, 1, 1), 0, [min(zonebound(:,2)) max(zonebound(:,2)) ...
    min(zonebound(:,1)) max(zonebound(:,1))]);

% Checking to see if the data is in the zone

IN = inpolygon(lat, long, zonebound(:,2), zonebound(:,1));

inbox = find(IN == 1);

% Specifying the data in the zones

lat = lat(inbox);
long = long(inbox);
year = year(inbox);
month = month(inbox);
day = day(inbox);
hour = hour(inbox);
mnte = mnte(inbox);
sec = sec(inbox);
magn = magn(inbox);

% Converting date into numbers
beforedate = datenum(year, month, day, hour, mnte, sec);

for i=1:length(beforedate)
    
    afterdate = addtodate(beforedate(i), 3, 'minute');

    wave_data = irisFetch.Traces('TA','T25A','*','BH?',datestr(beforedate(i), 31),...
        datestr(afterdate, 31));
    
    all_wavedata{i} = wave_data;
    
end
