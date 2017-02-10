% Pulls induced earthquake data from the catalog and checks to see if its
% in one of the 15 zones of interest.

% -----------------------------------------------------------------------

clc, clear

% Pulls the file containing all the zones. 

zonelist=textread('./POLYGONS_2016/TOANALYZE/allregs','%s');

zonecell = { };

% Loops over all the zones and stores the data into variables

for dummy=1:length(zonelist)
    
    % Pulling the specific zone
    
    zonebound=load(['./POLYGONS_2016/TOANALYZE/' zonelist{dummy}]);
    
    zonecell{dummy} = zonebound;
    
    % Pulling all the earthquakes for the zone
    
    [year{dummy}, month{dummy}, day{dummy}, hour{dummy}, mnte{dummy}, ...
        sec{dummy}, lat{dummy}, long{dummy}, ~, magn{dummy}] = LoadComCat(datenum(1973, 1, 1), ...
        datenum(2017, 1, 1), 3, [min(zonebound(:,2)) max(zonebound(:,2)) ...
        min(zonebound(:,1)) max(zonebound(:,1))]);
    
    % Checking to see if the data is in the zone
    
    IN = inpolygon(lat{dummy}, long{dummy}, zonebound(:,2), zonebound(:,1));
    
    inbox = find(IN == 1);     
    
    % Specifying the data in the zones
    
    lat{dummy} = lat{dummy}(inbox);
    long{dummy} = long{dummy}(inbox);
    year{dummy} = year{dummy}(inbox);
    month{dummy} = month{dummy}(inbox);
    day{dummy} = day{dummy}(inbox);
    hour{dummy} = hour{dummy}(inbox);
    mnte{dummy} = mnte{dummy}(inbox);
    sec{dummy} = sec{dummy}(inbox);
    magn{dummy} = magn{dummy}(inbox);
    
    % Converting date into numbers
    squaredate{dummy} = datenum(year{dummy}, month{dummy}, day{dummy}, ...
        hour{dummy}, mnte{dummy}, sec{dummy});
end

save zone_data.mat