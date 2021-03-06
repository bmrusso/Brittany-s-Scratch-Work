% Counting the number of earthquakes on any given day in the Oklahoma -
% Kansas zone between the dates January 1, 2006 to December 31, 2016 within
% a 1 day time span. 

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

numeq1 = [ ];

% Looping to count the number of earthquakes per day

for y=2006:2016
    
    for m=1:12
        
        if m==2
            
            if y==2008 | y==2012 | y==2016
                
                for d=1:29
                    
                    neq = length(find(year==y & month==m & day==d));
                    
                    numeq1 =[numeq1, neq];
                end
                
            else
                for d=1:28
                    
                    neq = length(find(year==y & month==m & day==d));
                    
                    numeq1 =[numeq1, neq];
                end
                
            end
            
        elseif m==4 | m==6 | m==9 | m== 11
            
            for d=1:30
                
                neq = length(find(year==y & month==m & day==d));
                
                numeq1 =[numeq1, neq];
                
            end
        else
            
            for d=1:31
                
                neq = length(find(year==y & month==m & day==d));
                
                numeq1 =[numeq1, neq];
                
            end
        end
    end
end

% ----------------------------------------------------------------------

n = 1;
eq1 = [ ];

for i=1:length(numeq1)-n
    
    eq1 = [eq1, (numeq1(i+n) - numeq1(i))];
    
end

eqbefore = find(eq1 < 0);
eqafter = find(eq1 > 0);

eq1(eqbefore) = -1;
eq1(eqafter) = 1;

firstdate=datenum(2006,1,1);
lastdate=datenum(2016,12,31);

datevector = firstdate:lastdate;


datevector2 = datevector;
datevector2(1) = [ ];
%%
figure(1)
clf
hold on
plot(datevector, numeq1)
plot(datevector2, cumsum(eq1))
legend('Number of Earthquakes per 1 Day', 'Cumulative Sum of Earthquakes')
datetick('x', 1)
title('Cumulative Sum vs. the Number of Earthquakes per 1 Day')
xlabel('Date')
ylabel('Number of Earthquakes')
hold off 