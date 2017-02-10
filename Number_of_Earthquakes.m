% The code pulls earthquake data for all magnitude 7 and larger earthquakes
% in the world and all earthquakes in a specific area and sums the number of
% earthquakes 1 week before and 1 week after the teleseism for 15 zones and
% then puts it into varabiables.

clc, clear

% Empty vectors for looping

totbefore = [];
totafter = [];
totsubtract = [];

% Pulls all the magnitude 7 earthquakes in the world

% Start years of all the zones 

zoneyears = [1997, 1976, 1998, 1973, 2009, 2013, 2008, 2008, 2006, 1991, 2001, ...
    2015, 2011, 2008, 2010];

load zone_data.mat

% Loops over all the zones and stores the data into variables

for ii=1:length(zonelist)
    
    [y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(zoneyears(ii), 1, 1), ...
        datenum(2017, 1, 1), 7, [-90 90 -180 180]);
    
    % Loop to find the number of earthquakes before and after in a 7 day
    % period
    
    quakebefore = [];
    quakeafter = [];
    
    for i=1:length(y)
        
        m7date(i) = datenum(y(i), mo(i), d(i), h(i), mi(i), s(i));
        
        % Find the number of earthquakes a week before
        
        endweek{ii} = find(squaredate{ii} <= m7date(i));
        
        begweek{ii} = find(squaredate{ii} > (m7date(i) - 7));
        
        numbf = length(intersect(endweek{ii}, begweek{ii}));
        
        % Find the number of earthquakes a week after
        
        date4{ii} = find(squaredate{ii} >= m7date(i));
        
        date5{ii} = find(squaredate{ii} < (m7date(i) + 7));
        
        numaf = length(intersect(date4{ii}, date5{ii}));
        
        % Making two variables containing all the earthquakes before and
        % after
        
        quakebefore = [quakebefore, numbf];
        
        quakeafter = [quakeafter, numaf];
       
    
        
    end
    
    %   Columns are teleseisms and rows are zones
    
    totbefore{ii} = quakebefore;
    totafter{ii} = quakeafter;
    totsubtract{ii} = totafter{ii} - totbefore{ii};
    
    % Finding where there are more earthquakes before and after
    
    negindex{ii} = find(totsubtract{ii} < 0);
    posindex{ii} = find(totsubtract{ii} > 0);

    totsubtract{ii}(negindex{ii}) = -1;     % Replacing 'more earthquakes before' with -1
    totsubtract{ii}(posindex{ii}) = 1;      % Replacing 'more earthquakes after' wtih 1
    
end
 

save num_eq_data.mat
