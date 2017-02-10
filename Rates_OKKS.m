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

for y=2006:2016
    
    for m=1
        
        for d=1:31
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 =[numeq1, neq];
        end
    end
    
    for m=2
        for d=1:28
            
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 =[numeq1, neq];
        end
    end
    
    for m=3
        
        for d=1:31
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 =[numeq1, neq];
        end
    end
    
    for m=4
        
        for d=1:30
            
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 = [numeq1, neq];
        end
    end
    
    for m=5
        
        
        for d=1:31
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 =[numeq1, neq];
        end
    end
    
    for m=6
        
        for d=1:30
            
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 = [numeq1, neq];
        end
    end
    
    for m =7:8
        
        for d=1:31
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 =[numeq1, neq];
        end
    end
    
    for m = 9
        
        for d=1:30
            
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 = [numeq1, neq];
        end
    end
    
    for m = 10
        for d=1:31
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 =[numeq1, neq];
        end
    end
    
    for m = 11
        
        for d=1:30
            
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 = [numeq1, neq];
        end
    end
    
    for m = 12
        
        for d=1:31
            neq = length(find(year==y & month==m & day==d));
            
            numeq1 =[numeq1, neq];
        end
    end
end
% 
% firstdate=datenum(2006,1,1);
% lastdate=datenum(2016,12,31);
% 
% datevector = firstdate:lastdate;
% leapyears=[datenum(2008,2,29),datenum(2012,2,29),datenum(2016,2,29);
%     
% x = find(leapyears == datevectors);
% datevector(indexly) = [];
            
      