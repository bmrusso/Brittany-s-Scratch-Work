% Picks earthquakes that meet a specific threshold for the degree os ground
% shaking and then counts the number of earthquakes before and after to
% show the rate of the occurance of earthquakes before or after a
% teleseism.

clc, clear

threshold = 0.0003;

load peak_ground_data.mat
load zone_data.mat

index3 = find(PGV >= threshold);

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(2006, 1, 1), ...
        datenum(2017, 1, 1), 7, [-90 90 -180 180]);
    
    y(34)= [];
    mo(34) =[];
    d(34)= [];
    h(34) =[];
    mi(34)= [];
    s(34) =[];
    la(34)= [];
    lo(34) =[];
    ma(34) =[];
    y(13)= [];
    mo(13) =[];
    d(13)= [];
    h(13) =[];
    mi(13)= [];
    s(13) =[];
    la(13)= [];
    lo(13) =[];
    ma(13) =[];
    
    y = y(index3);
    mo = mo(index3);
    d = d(index3);
    h = h(index3);
    mi = mi(index3);
    s = s(index3);
    la = la(index3);
    lo = lo(index3);
    ma = ma(index3);
    
    % Loop to find the number of earthquakes before and after in a 7 day
    % period
    
    quakebefore3 = [];
    quakeafter3 = [];
      
    for i=1:length(y)
        
        m7date(i) = datenum(y(i), mo(i), d(i), h(i), mi(i), s(i));
        
        % Find the number of earthquakes a week before
        
        endweek = find(squaredate{9} <= m7date(i));
        
        begweek = find(squaredate{9} > (m7date(i) - 7));
        
        numbf = length(intersect(endweek, begweek));
        
        % Find the number of earthquakes a week after
        
        date4 = find(squaredate{9} >= m7date(i));
        
        date5 = find(squaredate{9} < (m7date(i) + 7));
        
        numaf = length(intersect(date4, date5));
        
        % Making two variables containing all the earthquakes before and
        % after
        
        quakebefore3 = [quakebefore3, numbf];
        
        quakeafter3 = [quakeafter3, numaf];
        
    end
    
    totsubtract3 = quakeafter3 - quakebefore3;
    
    negindex = find(totsubtract3 < 0);
    posindex = find(totsubtract3 > 0);

    totsubtract3(negindex) = -1;     % Replacing 'more earthquakes before' with -1
    totsubtract3(posindex) = 1;      % Replacing 'more earthquakes after' wtih 1
    
    csum3 = cumsum(totsubtract3);
    

save('shaking_rate3.mat', 'quakebefore3', 'quakeafter3', 'totsubtract3', 'index3') 