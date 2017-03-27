% Raton theoretical earthquake rate graph
% Using the rand function to randomly generate when teleseisms occur to
% create a graph to see if it matches the actual one that we produced using
% actual USGS earthquake data.

% -----------------------------------------------------------------------

clc, clear

% Pulls the file containing all the zones.

zonelist=textread('./POLYGONS_2016/TOANALYZE/allregs','%s');

% Loops over all the zones and stores the data into variables

zonebound=load(['./POLYGONS_2016/TOANALYZE/', zonelist{11}]);

[year, month, day, hour, mnte, sec, lat, long, ~, magn] = LoadComCat(...
    datenum(2001, 1, 1), datenum(2017, 1, 1), 3, [min(zonebound(:,2)) ...
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

dateteles = [ ];
totbefore = [ ];
totafter = [ ];

% Looping to create random teleseisms

for i=1:1000
    
    numrand = rand([1, 255]);
    
    % Converting decimels into usable dates
    
    randdate = 2001+(11*numrand);
    
    % Converting into Julian Time
    
    telesdate = datenum(floor(randdate),1,(randdate - floor(randdate))*365);
    
    % Sorting the data from least to greatest to plot correctly 
    
    telesdate = sort(telesdate);
    
    quakebefore = [ ];
    quakeafter = [ ];
    
    % Looping to count the number of earthquakes before and after a
    % teleseism
    
    for ii=1:255
        
        endweek = length(find(zonedate <= telesdate(ii) & zonedate > ...
            (telesdate(ii) - 3)));
        
        begweek = length(find(zonedate >= telesdate(ii) & zonedate < ...
            (telesdate(ii) + 3)));
        
        quakebefore = [quakebefore, endweek];
        quakeafter = [quakeafter, begweek];
        
    end
    
    totbefore = [totbefore; quakebefore];
    totafter = [totafter; quakeafter];
    dateteles = [dateteles; telesdate];
    
end

teles = totafter - totbefore; 

negindex = find(teles < 0);
posindex = find(teles > 0);

teles(negindex) = -1;
teles(posindex) = 1;

% -----------------------------------------------------------------------

figure 

    hold on
    plot(dateteles(1,:), sum(cumsum(teles)))
    datetick('x', 1)
    hold off
    
    