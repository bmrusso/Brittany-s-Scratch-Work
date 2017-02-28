% Counts the number of earthquakes per month

clc, clear

load zone_data.mat

index = find(year{9} >= 2006);

eqyear = year{9}(index);
eqmonth = month{9}(index);

yearlist = unique(eqyear);
monthlist = unique(eqmonth);

totalcount = [ ];
datevector = [ ];

for yr=1:length(yearlist)
    
    nummonth = eqmonth;
    
    yrindex = find(eqyear == yearlist(yr));
    
    nummonth = nummonth(yrindex);
    
    monthcount = [ ];
    date3 = [ ];
    
    for mth=1:length(monthlist)
        
        mnthindex = find(nummonth == monthlist(mth));
        
        count = length(mnthindex);
        
        monthcount = [monthcount, count];
        
        date2 = datenum(yearlist(yr), monthlist(mth), 1);
        
        date3 = [date3, date2];
        
    end
    
    totalcount = [totalcount, monthcount];
    
    datevector = [datevector, date3];
    
end


save month_count.mat            