% Loads the local earthquakes within each zone and then counts the number
% of earthquakes per 7 days. Then the number of earthquakes the day before
% is subtracted from the number of earthquakes of the given day to
% determine if there were more earthquakes that day or the day before. 

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

% Counts the number of earthquakes within a 7 day period. 
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

% subtracts the number of earthquakes a week before from the given week
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

datevector2 = datevector;
datevector2(1:7) = [ ];

% -----------------------------------------------------------------------

%%
figure(1)
clf
hold on
plot(datevector, numeq7)
plot(datevector2, cumsum(eq7))
legend('Number of Earthquakes per 7 Days', 'Cumulative Sum of Earthquakes')
datetick('x', 1)
title('Cumulative Sum vs. the Number of Earthquakes per 7 Day')
xlabel('Date')
ylabel('Number of Earthquakes')
hold off 