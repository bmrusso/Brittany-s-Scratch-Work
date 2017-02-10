% The code pulls earthquake data for all magnitude 7 earthquakes in the
% world and all earthquakes in a specific area and sums the number of
% earthquakes 1 week before and 1 week after the teleseism for 19 zones and
% then puts it into varabiables.

clc, clear

% Empty vectors for looping

totbefore = [ ];
totafter = [ ];

% Pulls all the magnitude 7 earthquakes in the world

 [y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1973, 1, 1), ...
        datenum(2017, 1, 1), 7, [-90 90 -180 180]);

load zone_data.mat

% Loops over all the zones and stores the data into variables

for ii=1:length(zonelist)
    
    [y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(zoneyears(ii), 1, 1), ...
        datenum(2017, 1, 1), 7, [-90 90 -180 180]);
    
    % Loop to find the number of earthquakes before and after
    
    quakebefore = [ ];
    quakeafter = [ ];
    
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
    
    totbefore = [totbefore, quakebefore];
    totafter = [totafter; quakeafter];
    
end

totsubtract = totafter - totbefore;

% Finding where there are more earthquakes before and after

negindex = find(totsubtract < 0);
posindex = find(totsubtract > 0);

totsubtract(negindex) = -1;     % Replacing 'more earthquakes before' with -1
totsubtract(posindex) = 1;      % Replacing 'more earthquakes after' wtih 1

eqrates = totsubtract;

totsum=sum(totsubtract, 2);     % Total per zone
