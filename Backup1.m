% The code pulls earthquake data for all magnitude 7 earthquakes in the
% world and all earthquakes in a specific area and sums the number of
% earthquakes 1 week before and 1 week after the teleseism for 19 zones and
% then puts it into varabiables.

clc, clear

% Empty vectors for looping

totbefore = [ ];
totafter = [ ];

% Pulls all the magnitude 7 earthquakes in the world

[y,mo,d,h,mi,s] = LoadComCat(datenum(2011, 1, 1), datenum(2012, 1, 1), ...
        7, [-90 90 -180 180]);

% Pulls the file containing all the zones. 

zonelist=textread('./ISPOLYGONS2015/flist','%s');

% Loops over all the zones and stores the data into variables

for dummy=1:length(zonelist)
    
    % Pulling the specific zone
    
    zonebound=load(['./ISPOLYGONS2015/' zonelist{dummy}]);
    
    % Pulling all the earthquakes for the zone
   
    [year, month, day, hour, mnte, sec, lat, long] = LoadComCat(datenum(2011, 1, 1), ...
        datenum(2012, 1, 1), 0, [min(zonebound(:,2)) max(zonebound(:,2)) ...
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
    
    % Empty vectors for looping 
    
    quakebefore = [ ];
    quakeafter = [ ];
    
    % Converting date into numbers
    squaredate = datenum(year, month, day, hour, mnte, sec);
    
    % Loop to find the number of earthquakes before and after
    
    for i=1:length(y)
        
        m7date(i) = datenum(y(i), mo(i), d(i), h(i), mi(i), s(i));
        
        % Find the number of earthquakes a week before
        
        endweek = find(squaredate <= m7date(i));
        
        begweek = find(squaredate > (m7date(i) - 7));
        
        numbf = length(intersect(endweek, begweek));
        
        % Find the number of earthquakes a week after
        
        endweek = find(squaredate >= m7date(i));
        
        begweek = find(squaredate < (m7date(i) +7));
        
        numaf = length(intersect(endweek, begweek));
        
        % Making two variables containing all the earthquakes before and
        % after
        
        quakebefore = [quakebefore, numbf];
        
        quakeafter = [quakeafter, numaf];
    end
    
    % Columns are teleseisms and rows are zones
    
    totbefore = [totbefore; quakebefore];
    totafter = [totafter; quakeafter];
    
end

totsubtract = totafter - totbefore;

% Finding where there are more earthquakes before and after

negindex = find(totsubtract < 0);
posindex = find(totsubtract > 0);

totsubtract(negindex) = -1;     % Replacing 'more earthquakes before' with -1
totsubtract(posindex) = 1;      % Replacing 'more earthquakes after' wtih 1

%totsum=sum(totsubtract, 2);     % Total per zone 

