% Counting the number of earthquakes on any given day in the Oklahoma -
% Kansas zone between the dates January 1, 2006 to December 31, 2016 within
% a 7 day time span. 

% ----------------------------------------------------------------------
clc, clear

% Pulls the file containing all the zones.

zonelist=textread('./POLYGONS_2016/TOANALYZE/allregs','%s');

% Loops over all the zones and stores the data into variables

zonebound=load(['./POLYGONS_2016/TOANALYZE/', zonelist{9}]);

[year, month, day, hour, mnte, sec, lat, long, ~, magn] = LoadComCat(...
    datenum(2006, 1, 1), datenum(2017, 1, 1), 3, [min(zonebound(:,2)) ...
    max(zonebound(:,2)) min(zonebound(:,1)) max(zonebound(:,1))]);

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

numeq7 = [ ];

% Looping to count the number of earthquakes per day

for y=2006:2016
    
    for m=1:12
        
        if m==2
            
            if y==2008 | y==2012 | y==2016
                for d=1:29
                    
                    neq = length(find(year==y & month==m & day>=d & day<=d+6));
                    
                    numeq7 =[numeq7, neq];
                end
                
            else
                for d=1:28
                    
                    neq = length(find(year==y & month==m & day>=d & day<=d+6));
                    
                    numeq7 =[numeq7, neq];
                end
                
            end
            
        elseif m==4 | m==6 | m==9 | m== 11
            
            for d=1:30
                
                neq = length(find(year==y & month==m & day>=d & day<=d+6));
                
                numeq7 =[numeq7, neq];
                
            end
        else
            
            for d=1:31
                neq = length(find(year==y & month==m & day>=d & day<=d+6));
                
                numeq7 =[numeq7, neq];
                
            end
        end
    end
end

n = 7;
eq7 = [ ];

% Subtracting the 3 day time spans from each other 

for i=1:length(numeq7)-n
    
    eq7 = [eq7, (numeq7(i+n) - numeq7(i))];
    
end

eqbefore = find(eq7 < 0);
eqafter = find(eq7 > 0);

eq7(eqbefore) = -1;
eq7(eqafter) = 1;

firstdate=datenum(2006,1,1);
lastdate=datenum(2016,12,31);

datevector = firstdate:lastdate;


%% Random Vectors of 1, -1 and 0.

% Creating random vectors of 1, -1 and 0 to see if the actual data fits in
% the random walk

randvector = [ ];

for i=1:1000

random1 = randi([-1 1], 1, 184);

randvector = [randvector; random1];

end

randcumsum = cumsum(randvector, 2);

% ----------------------------------------------------------------------

%%
% figure(1)
% clf
% hold on
% % plot(datevector, numeq7)
% plot(datevector2, cumsum(eq7), 'r')
% datetick('x', 1)
% title('7 Days')


load fixed_dc7

 [y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2006, 1, 1), ...
     datenum(2017, 1, 1), 7, [-90 90 -180 180]);

cum_sum1 = cumsum(fixokks7);

m7date = datenum(y, mo, d, h, mi, s);


% plot(m7date, cum_sum1*7)
% datetick('x', 1)
% legend('Incremental', 'OK/KS - Fixed *7')
% hold off

    hold on
plot(m7date, cum_sum1, 'k', 'linewidth', 2.5)
plot(m7date, randcumsum')
legend('Actual Data')
title('Oklahoma Random Walk - 7 Days')
datetick('x',1)
xlabel('Date')
ylabel('Cumulative Sum')
hold off
