% Oklahoma Kansas theoretical earthquake rate graph
% Using the rand function to randomly generate when teleseisms occur to
% create a graph to see if it matches the actual one that we produced using
% actual USGS earthquake data. 

clc, clear

% Pulls the file containing all the zones.

zonelist=textread('./POLYGONS_2016/TOANALYZE/allregs','%s');

% Loops over all the zones and stores the data into variables

zonebound=load(['./POLYGONS_2016/TOANALYZE/', zonelist{9}]);

[year, month, day, hour, mnte, sec, lat, long, ~, magn] = LoadComCat(...
    datenum(2006, 1, 1), datenum(2017, 1, 1), 3, [min(zonebound(:,2)) ...
    max(zonebound(:,2)) min(zonebound(:,1)) max(zonebound(:,1))]);

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

zonedate = datenum(year, month, day, hour, mnte, sec);

teles = [ ];

 for i=1:1000
    
    d = rand([1, 184]);
    
    teles = [teles; d];
    
 end 
 
telesdate = 2006+(11*teles);

for i=1:1000
    
    telesdate(i,:) = datenum(floor(telesdate(i)),1,(telesdate(i) - floor(telesdate(i)))*100);
    
end

endweek = find(zonedate <= telesdate & zonedate > (telesdate - 7));

