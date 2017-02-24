% Picks earthquakes that meet a specific threshold for the degree os ground
% shaking and then counts the number of earthquakes before and after to
% show the rate of the occurance of earthquakes before or after a
% teleseism.

clc, clear

threshold = 0.00015;

load peak_ground_data.mat
load zone_data.mat

index1_5 = find(PGV >= threshold);

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
    
    y = y(index1_5);
    mo = mo(index1_5);
    d = d(index1_5);
    h = h(index1_5);
    mi = mi(index1_5);
    s = s(index1_5);
    la = la(index1_5);
    lo = lo(index1_5);
    ma = ma(index1_5);
    
    % Loop to find the number of earthquakes before and after in a 7 day
    % period
    
    quakebefore1_5 = [];
    quakeafter1_5 = [];
      
    for i=1:length(y)
        
        m7date(i) = datenum(y(i), mo(i), d(i), h(i), mi(i), s(i));
        
        % Find the number of earthquakes a week before
        
        endweek = find(squaredate{9} <= m7date(i));
        
        begweek = find(squaredate{9} > (m7date(i) - 3));
        
        numbf = length(intersect(endweek, begweek));
        
        % Find the number of earthquakes a week after
        
        date4 = find(squaredate{9} >= m7date(i));
        
        date5 = find(squaredate{9} < (m7date(i) + 3));
        
        numaf = length(intersect(date4, date5));
        
        % Making two variables containing all the earthquakes before and
        % after
        
        quakebefore1_5 = [quakebefore1_5, numbf];
        
        quakeafter1_5 = [quakeafter1_5, numaf];
        
    end
    
    totsubtract1_5 = quakeafter1_5 - quakebefore1_5;
    
    negindex = find(totsubtract1_5 < 0);
    posindex = find(totsubtract1_5 > 0);

    totsubtract1_5(negindex) = -1;     % Replacing 'more earthquakes before' with -1
    totsubtract1_5(posindex) = 1;      % Replacing 'more earthquakes after' wtih 1
    
    csum = cumsum(totsubtract1_5);
    
    hold on
    figure(5)
    plot(m7date, csum)
    plot(m7date, csum, 'x')
    
    save('shaking3_rate1_5.mat', 'quakebefore1_5', 'quakeafter1_5', 'totsubtract1_5', 'index1_5') 