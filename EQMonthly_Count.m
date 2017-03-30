% Counts the number of earthquakes per month and per year

% -----------------------------------------------------------------------

clc, clearvars -EXCEPT yearly_data monthly_data

load zone_data.mat

%% Monthly

% 9 is the location of the Oklahoma data in the cell array
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
    
    % counts the numbe of earthquakes per month
    
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


% save month_count.mat

%% Yearly 

index = find(year{9} >= 2006);

eqyear = year{9}(index);

yearlist = unique(eqyear);

totalcount = [ ];
datevector = [ ];
total_years = [ ];

% counts the number of earthquakes per year
for yr=1:length(yearlist)
    
    yrindex = find(eqyear == yearlist(yr));
    
    yr_cnt = length(yrindex);
    
    year_date = datenum(yearlist(yr),1, 1);
    
    total_years = [total_years, year_date];
        
    totalcount = [totalcount, yr_cnt];
    
end

% ----------------------------------------------------------------------