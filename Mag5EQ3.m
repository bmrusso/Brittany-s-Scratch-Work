% Gathering Catalog data for magnitude 5 earthquakes near the zones

clc, clear

% Empty vectors for looping

totbefore = [];
totafter = [];
totsubtract = [];

deglimit = km2deg(500);

% Pulls all the magnitude 7 earthquakes in the world

zoneyears = [1997, 1976, 1998, 1973, 2009, 2013, 2008, 2008, 2006, 1991, 2001, ...
    2015, 2011, 2008, 2010];

load zone_data.mat

% Loops over all the zones and stores the data into variables

for ii=1:length(zonelist)
    
    % Pulls EQ data for the entire United States
    
    [y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(zoneyears(ii), 1, 1), ...
        datenum(2017, 1, 1), 5, [25 45 -125 -70]);
    
    % Calculates the distance from an EQ to the center of the zone
    
    disteq = distance(mean(zonecell{ii}(:,2)), mean(zonecell{ii}(:,1)), la, lo);
    
    % Finding where the distance is greater than 500 km and removing it.
    
    smallerdeg = find(disteq <= deglimit);
    
    y = y(smallerdeg);
    mo = mo(smallerdeg);
    d = d(smallerdeg);
    h = h(smallerdeg);
    mi = mi(smallerdeg);
    s = s(smallerdeg);
    ma = ma(smallerdeg);
    
    % Loop to find the number of earthquakes before and after
    
    quakebefore = [];
    quakeafter = [];
    
    for i=1:length(y)
        
        m7date(i) = datenum(y(i), mo(i), d(i), h(i), mi(i), s(i));
        
        % Find the number of earthquakes a week before
        
        endweek{ii} = find(squaredate{ii} <= m7date(i));
        
        begweek{ii} = find(squaredate{ii} > (m7date(i) - 3));
        
        numbf = length(intersect(endweek{ii}, begweek{ii}));
        
        % Find the number of earthquakes a week after
        
        date4{ii} = find(squaredate{ii} >= m7date(i));
        
        date5{ii} = find(squaredate{ii} < (m7date(i) + 3));
        
        numaf = length(intersect(date4{ii}, date5{ii}));
        
        % Making two variables containing all the earthquakes before and
        % after
        
        quakebefore = [quakebefore, numbf];
        
        quakeafter = [quakeafter, numaf];
        
    end
    
    % Columns are teleseisms and rows are zones
    
    totbefore{ii} = quakebefore;
    totafter{ii} = quakeafter;
    totsubtract{ii} = totafter{ii} - totbefore{ii};
    
    % Finding where there are more earthquakes before and after
    
    negindex{ii} = find(totsubtract{ii} < 0);
    posindex{ii} = find(totsubtract{ii} > 0);
    
    totsubtract{ii}(negindex{ii}) = -1;     % Replacing 'more earthquakes before' with -1
    totsubtract{ii}(posindex{ii}) = 1;      % Replacing 'more earthquakes after' wtih 1
        all_dates{ii} = m7date;

end

%save mag5data3

hold on
csum1 = cumsum(totsubtract{9});
plot(all_dates{9},csum1,'ro')
plot(all_dates{9},csum1)
datetick('x',2)
xlabel('Date')
ylabel('Cumulative Sum')
title('Cumulative Sum of the Mainshocks')
hold off