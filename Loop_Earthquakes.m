% The code pulls earthquake data for all magnitude 7 earthquakes in the
% world and all earthquakes in a specific area and sums the number of
% earthquakes 1 week before and 1 week after the teleseism for 19 zones and
% then puts it into varabiables.

clc, clear

% Empty vectors for looping

totbefore = [ ];
totafter = [ ];

% Pulls all the magnitude 7 earthquakes in the world

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1973, 1, 1), datenum(2017, 1, 9), ...
    7, [-90 90 -180 180]);

load zone_data.mat

% Loops over all the zones and stores the data into variables

for ii=1:length(zonelist)
    
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
    
    totbefore = [totbefore; quakebefore];
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

% Code to fix the double counting issue - changes for each case

dblecount = find(totsubtract(2,:) > 0 | totsubtract(2,:) < 0);
totsubtract(2,dblecount(end-1:end)) = 23;
totsubtract(2, dblecount(5)) = 5;

fixcog7 = totsubtract(2,:);

hold on
stem(squaredate{2}, magn{2}, 'g')
stem(m7date, ma, 'r--')

rateaft = find(totafter(2,:) >0);
ratebef = find(totbefore(2,:) > 0);

stem(m7date(rateaft), ma(rateaft), 'k')
stem(m7date(ratebef), ma(ratebef), 'b')

stem(m7date(rateaft)+7, ma(rateaft), 'c-')
stem(m7date(rateaft)-7, ma(rateaft), 'c-')

stem(m7date(ratebef)+7, ma(ratebef), 'm-')
stem(m7date(ratebef)-7, ma(ratebef), 'm-')
hold off
 
% subplot(2,1,2)
% hold on
% stem(squaredate{totlarger(2)}, magn{totlarger(2)}, 'g')
% stem(m7date, ma, 'r--')
% title('\bfRATON')
% hold off

save cog7fix.mat

