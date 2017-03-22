% Removes the double counting on the earthquakes that pass the specific
% threshold.

clc, clearvars -EXCEPT or_dates

% Load the threshold data

load zone_data.mat
load PGV_All1.mat
load teleseism_distance.mat

magn(10)= [ ];

%% OKKS

clear y mo d h mi s 

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2006, 1, 1), datenum(2017, 1, 1), ...
    7, [-90 90 -180 180]);

remove_vector = [122, 99, 34, 13, 5];

    y(remove_vector) = [ ];
    mo(remove_vector) = [ ];
    d(remove_vector) = [ ];
    h(remove_vector) = [ ];
    mi(remove_vector) = [ ];
    s(remove_vector) = [ ];
    ma(remove_vector) = [ ];

ma_index = ma(all_index{3}{9});

date_num = datenum(y, mo, d,h,mi,s);
ok_date{1} = date_num(all_index{1}{9});
ok_date{2} = date_num(all_index{2}{9});
ok_date{3} = date_num(all_index{3}{9});

% Removing Unnecessary dates from vector

start_date = datenum(2006,1,1);
not_date = find(squaredate{9} < start_date);
squaredate{9}(not_date) = [ ];

magn{9}(not_date) = [ ];

% Correcting for double counting when threshold is 0.00015

m_before = find(all_before{3}{9} > 0);
m_after = find(all_after{3}{9} >0);
all_subtract{3}{9}(15) = 0;
all_subtract{3}{9}(16) = 0;
all_subtract{3}{9}(30) = 0;
all_subtract{3}{9}(32) = 0;


%% Raton

clear y mo d h mi s 

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2001, 1, 1), datenum(2017, 1, 1), ...
    7, [-90 90 -180 180]);

remove_vector = [223, 137, 124, 98, 92, 58, 40, 39, 28];

    y(remove_vector) = [ ];
    mo(remove_vector) = [ ];
    d(remove_vector) = [ ];
    h(remove_vector) = [ ];
    mi(remove_vector) = [ ];
    s(remove_vector) = [ ];
    ma(remove_vector) = [ ];

ma_index = ma(all_index{3}{10});

date_num = datenum(y, mo, d,h,mi,s);
raton_date{1} = date_num(all_index{1}{10});
raton_date{2} = date_num(all_index{2}{10});
raton_date{3} = date_num(all_index{3}{10});

% Removing Unnecessary dates from vector

start_date = datenum(2001,1,1);
not_date = find(squaredate{10} < start_date);
squaredate{10}(not_date) = [ ];

magn{10}(not_date) = [ ];

% Correcting for double counting when threshold is 0.00015

m_before = find(all_before{3}{10} > 0);
m_after = find(all_after{3}{10} >0);
all_subtract{3}{10}(22) = 0;
all_subtract{3}{10}(23) = 0;

%% Plotting the cumulative sum

for ii=1:3
    
    for i=1:length(all_subtract{ii})
        
        csum = cumsum(all_subtract{ii}{i});
        
        y = year_cell{i}(all_index{ii}{i});
        mo = month_cell{i}(all_index{ii}{i});
        d = day_cell{i}(all_index{ii}{i});
        h = hour_cell{i}(all_index{ii}{i});
        mi = min_cell{i}(all_index{ii}{i});
        s = sec_cell{i}(all_index{ii}{i});
        la = lat_cell{i}(all_index{ii}{i});
        lo = long_cell{i}(all_index{ii}{i});
        ma = mag_cell{i}(all_index{ii}{i});
        
        date_plot = datenum(y, mo, d, h, mi, s);
        
        figure(ii)
        subplot(3,5,i)
        hold on 
        plot(date_plot, csum)
        plot(date_plot, csum, '*')
        datetick('x',2)
        
    end
end

