% Removes the double counting on the earthquakes that pass the specific
% threshold.

clc, clearvars -EXCEPT or_dates

% Load the threshold data

load zone_data.mat
load PGV_All7.mat
load teleseism_distance.mat

magn(10)= [ ];

%% For Cog
% Load all the teleseism data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1976, 1, 1), datenum(2017, 1, 1), ...
    7, [-90 90 -180 180]);

remove_vector = [560, 522, 428, 407, 399, 394, 387, 386, 363, 362, 354,...
    353, 352, 351, 349, 345, 344, 343, 342, 341, 335, 334, 333, 331, 330,...
    329, 328, 324, 309, 308, 298, 292, 291, 287, 286, 280, 272, 271, 269,...
    268, 265, 261, 258, 257, 256, 252, 249, 246, 242, 241, 240, 249, 238,...
    235, 234, 231, 230, 228, 210, 209, 208, 203];
    
    y(remove_vector) = [ ];
    mo(remove_vector) = [ ];
    d(remove_vector) = [ ];
    h(remove_vector) = [ ];
    mi(remove_vector) = [ ];
    s(remove_vector) = [ ];
    ma(remove_vector) = [ ];

ma_index = ma(all_index{3}{2});

date_num = datenum(y, mo, d,h,mi,s);
m7date = date_num(all_index{3}{2});


% Removing Unnecessary dates from vector

start_date = datenum(1976,1,1);
not_date = find(squaredate{2} < start_date);
squaredate{2}(not_date) = [ ];

magn{2}(not_date) = [ ];

% Correcting for double counting when threshold is 0.00015

m_before = find(all_before{3}{2} > 0);
m_after = find(all_after{3}{2} >0);
all_subtract{3}{2}(19) = 0;
all_subtract{3}{2}(20) = 0;

%% NCArk

clear y mo d h mi s 

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2009, 1, 1), datenum(2017, 1, 1), ...
    7, [-90 90 -180 180]);

remove_vector = [107, 87, 66];

    y(remove_vector) = [ ];
    mo(remove_vector) = [ ];
    d(remove_vector) = [ ];
    h(remove_vector) = [ ];
    mi(remove_vector) = [ ];
    s(remove_vector) = [ ];
    ma(remove_vector) = [ ];

ma_index = ma(all_index{3}{5});

date_num = datenum(y, mo, d,h,mi,s);
m7date = date_num(all_index{3}{5});


% Removing Unnecessary dates from vector

start_date = datenum(2009,1,1);
not_date = find(squaredate{5} < start_date);
squaredate{5}(not_date) = [ ];

magn{5}(not_date) = [ ];

% Correcting for double counting when threshold is 0.00015

m_before = find(all_before{3}{5} > 0);
m_after = find(all_after{3}{5} >0);
all_subtract{3}{2}(9) = 0;
all_subtract{3}{2}(10) = 0;

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
all_subtract{3}{9}(19) = 0;
all_subtract{3}{9}(20) = 0;
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

%% SunCity 

clear y mo d h mi s 
 
[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2015, 1, 1), datenum(2017, 1, 1), ...
    7, [-90 90 -180 180]);

remove_vector = 16;

    y(remove_vector) = [ ];
    mo(remove_vector) = [ ];
    d(remove_vector) = [ ];
    h(remove_vector) = [ ];
    mi(remove_vector) = [ ];
    s(remove_vector) = [ ];
    ma(remove_vector) = [ ];

ma_index = ma(all_index{3}{11});

date_num = datenum(y, mo, d,h,mi,s);
m7date = date_num(all_index{3}{11});


% Removing Unnecessary dates from vector

start_date = datenum(2015,1,1);
not_date = find(squaredate{11} < start_date);
squaredate{11}(not_date) = [ ];

magn{11}(not_date) = [ ];

% Correcting for double counting when threshold is 0.00015

m_before = find(all_before{3}{11} > 0);
m_after = find(all_after{3}{11} >0);
all_subtract{3}{11}(3) = 0;

% % Plotting the cumulative sum
% 
% for ii=1:3
%     
%     for i=1:length(all_subtract{ii})
%         
%         csum = cumsum(all_subtract{ii}{i});
%         
%         y = year_cell{i}(all_index{ii}{i});
%         mo = month_cell{i}(all_index{ii}{i});
%         d = day_cell{i}(all_index{ii}{i});
%         h = hour_cell{i}(all_index{ii}{i});
%         mi = min_cell{i}(all_index{ii}{i});
%         s = sec_cell{i}(all_index{ii}{i});
%         la = lat_cell{i}(all_index{ii}{i});
%         lo = long_cell{i}(all_index{ii}{i});
%         ma = mag_cell{i}(all_index{ii}{i});
%         
%         date_plot = datenum(y, mo, d, h, mi, s);
%         
%         figure(ii)
%         subplot(3,5,i)
%         hold on 
%         plot(date_plot, csum)
%         plot(date_plot, csum, '*')
%         datetick('x',2)
%         
%     end
% end

% save('shaking_dc_ones.mat', 'all_subtract')