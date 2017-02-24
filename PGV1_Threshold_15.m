% Picks earthquakes that meet a specific threshold for the degree os ground
% shaking and then counts the number of earthquakes before and after to
% show the rate of the occurance of earthquakes before or after a
% teleseism.

clc, clear

threshold = 0.0015;

load peak_ground_data.mat
load zone_data.mat

index15 = find(PGV >= threshold);

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
    
    y = y(index15);
    mo = mo(index15);
    d = d(index15);
    h = h(index15);
    mi = mi(index15);
    s = s(index15);
    la = la(index15);
    lo = lo(index15);
    ma = ma(index15);
    
    % Loop to find the number of earthquakes before and after in a 7 day
    % period
    
    quakebefore15 = [];
    quakeafter15 = [];
      
    for i=1:length(y)
        
        m7date(i) = datenum(y(i), mo(i), d(i), h(i), mi(i), s(i));
        
        % Find the number of earthquakes a week before
        
        endweek = find(squaredate{9} <= m7date(i));
        
        begweek = find(squaredate{9} > (m7date(i) - 1));
        
        numbf = length(intersect(endweek, begweek));
        
        % Find the number of earthquakes a week after
        
        date4 = find(squaredate{9} >= m7date(i));
        
        date5 = find(squaredate{9} < (m7date(i) + 1));
        
        numaf = length(intersect(date4, date5));
        
        % Making two variables containing all the earthquakes before and
        % after
        
        quakebefore15 = [quakebefore15, numbf];
        
        quakeafter15 = [quakeafter15, numaf];
        
    end
    
    totsubtract15 = quakeafter15 - quakebefore15;
    
    negindex = find(totsubtract15 < 0);
    posindex = find(totsubtract15 > 0);

    totsubtract15(negindex) = -1;     % Replacing 'more earthquakes before' with -1
    totsubtract15(posindex) = 1;      % Replacing 'more earthquakes after' wtih 1
    
    csum = cumsum(totsubtract15);
    
    hold on
    figure(5)
    plot(m7date, csum)
    plot(m7date, csum, 'x')
    
    save('shaking1_rate15.mat', 'quakebefore15', 'quakeafter15', 'totsubtract15', 'index15') 