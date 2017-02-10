clear

% Empty vectors for looping

totbefore = [];
totafter = [];
totsubtract = [];

deglimit = km2deg(500);

% Pulls all the magnitude 7 earthquakes in the world



load zone_data.mat

% Loops over all the zones and stores the data into variables


    
    % Pulls EQ data for the entire United States
    
    [y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1991, 1, 1), ...
        datenum(2017, 1, 1), 5, [25 45 -125 -70]);
    
    % Calculates the distance from an EQ to the center of the zone
    
    disteq = distance(mean(zonecell{10}(:,2)), mean(zonecell{10}(:,1)), la, lo);
    
    % Finding where the distance is greater than 500 km and removing it.
    
    largerdeg = find(disteq > deglimit);
    
    y(largerdeg) = [ ];
    mo(largerdeg) = [ ];
    d(largerdeg) = [ ];
    h(largerdeg) = [ ];
    mi(largerdeg) = [ ];
    s(largerdeg) =  [ ];
    ma(largerdeg) = [ ];
    
    % Loop to find the number of earthquakes before and after
    
    quakebefore = [];
    quakeafter = [];
    
    for i=1:length(y)
        
        m5date(i) = datenum(y(i), mo(i), d(i), h(i), mi(i), s(i));
        
        % Find the number of earthquakes a week before
        
        endweek = find(squaredate{10} <= m5date(i));
        
        begweek = find(squaredate{10} > (m5date(i) - 7));
        
        numbf = length(intersect(endweek, begweek));
        
        % Find the number of earthquakes a week after
        
        date4 = find(squaredate{10} >= m5date(i));
        
        date5 = find(squaredate{10} < (m5date(i) + 7));
        
        numaf = length(intersect(date4, date5));
        
        % Making two variables containing all the earthquakes before and
        % after
        
        quakebefore = [quakebefore, numbf];
        
        quakeafter = [quakeafter, numaf];
        
    end
    
    
   