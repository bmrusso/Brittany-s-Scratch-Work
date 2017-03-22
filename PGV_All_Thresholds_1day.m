% Picks earthquakes that meet a specific threshold for the degree of ground
% shaking and then counts the number of earthquakes before and after to
% show the rate of the occurance of earthquakes before or after a
% teleseism.

clc, clear

load peak_ground_data.mat
load zone_data.mat

% Removing the Paradox data
squaredate(10) = [ ];
PGV_total =  [PGV_total(1:7), PGV_total(7), PGV_total(8:12), PGV_total(7),...
    PGV_total(13)];
PGV_total(10) = [ ];

% Setting the Threshold
threshold = [0.0028, 0.0014, 0.00020];


% Vector of start years for each zone
year_vector = [1997, 1976, 1998, 1973, 2009, 2013, 2008, 2008, 2006, 2001, 2015,...
    2011, 2008, 2010];

% Creating a cell array of all the data points that were removed for
% each zone
remove_vector{1} = [290, 283, 277, 270, 260, 190, 177, 175, 174, 143, 142];
remove_vector{2} = [560, 522, 428, 407, 399, 394, 387, 386, 363, 362, 354,...
    353, 352, 351, 349, 345, 344, 343, 342, 341, 335, 334, 333, 331, 330,...
    329, 328, 324, 309, 308, 298, 292, 291, 287, 286, 280, 272, 271, 269,...
    268, 265, 261, 258, 257, 256, 252, 249, 246, 242, 241, 240, 249, 238,...
    235, 234, 231, 230, 228, 210, 209, 208, 203];
remove_vector{3} = [297, 292, 244, 233, 215, 155, 143, 138, 137, 128, 118, ...
    103, 94];
remove_vector{4} = [575, 570, 536, 532, 526, 481, 448, 447, 444, 439, 434,...
    431, 430,415, 408, 405, 396, 395, 393, 392, 391, 387, 385, 384, 383, ...
    377, 376, 375, 374, 368, 366, 365, 364, 361, 360, 359, 358, 348];
remove_vector{5} = [107, 87, 66];
remove_vector{6} = 63;
remove_vector{7} = [129, 128, 127, 126, 125, 85, 57, 51, 50, 49, 38, 37, 20, 7];
remove_vector{8} = [129, 128, 127, 126, 125, 85, 57, 51, 50, 49, 38, 37, 20, 7];
remove_vector{9} = [122, 99, 34, 13, 5];
remove_vector{10} = [223, 137, 124, 98, 92, 58, 40, 39, 28];
remove_vector{11} = 16;
remove_vector{12} = [76, 75, 74, 73, 72, 66, 64, 32, 4];
remove_vector{13} = [129, 128, 127, 126, 125, 85, 57, 51, 50, 49, 38, 37, 20, 7];
remove_vector{14} = [87, 70];

% for thres=1:length(threshold)

for zones=1:length(year_vector)
    
    % Pulling all the earthquake data
    [y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(year_vector(zones), 1, 1), ...
        datenum(2017, 1, 1), 7, [-90 90 -180 180]);
    
    % Removing the data bad data from the earthquake data
    
        y(remove_vector{zones})= [];
        mo(remove_vector{zones}) =[];
        d(remove_vector{zones})= [];
        h(remove_vector{zones}) =[];
        mi(remove_vector{zones})= [];
        s(remove_vector{zones}) =[];
        la(remove_vector{zones})= [];
        lo(remove_vector{zones}) =[];
        ma(remove_vector{zones}) =[];
        
        PGV_total{zones}(remove_vector{zones}) = [ ];
            
    year_cell{zones} = y;
    month_cell{zones} = mo;
    day_cell{zones} = d;
    hour_cell{zones} = h;
    min_cell{zones} = mi;
    sec_cell{zones} = s;
    lat_cell{zones} = la;
    long_cell{zones} = lo;
    mag_cell{zones} = ma;
    
end

for thres=1:length(threshold)
    
    for ii=1:length(year_cell)
        
        
        % Only pulling the data that is above the specified threshold
        
        index = find(PGV_total{ii} >= threshold(thres));
        
        thres_index{ii} = index;
        
        if length(index) == 0
            
            totsubtract{ii} = [ ];
            
        else
            
            y = year_cell{ii}(index);
            mo = month_cell{ii}(index);
            d = day_cell{ii}(index);
            h = hour_cell{ii}(index);
            mi = min_cell{ii}(index);
            s = sec_cell{ii}(index);
            la = lat_cell{ii}(index);
            lo = long_cell{ii}(index);
            ma = mag_cell{ii}(index);
            
            % Loop to find the number of earthquakes before and after in a 7 day
            % period
            
            quakebefore = [];
            quakeafter = [];
            
            for i=1:length(y)
                
                m7date(i) = datenum(y(i), mo(i), d(i), h(i), mi(i), s(i));
                
                % Find the number of earthquakes a week before
                
                endweek{ii} = find(squaredate{ii} <= m7date(i));
                
                begweek{ii} = find(squaredate{ii} > (m7date(i) - 1));
                
                numbf = length(intersect(endweek{ii}, begweek{ii}));
                
                % Find the number of earthquakes a week after
                
                date4{ii} = find(squaredate{ii} >= m7date(i));
                
                date5{ii} = find(squaredate{ii} < (m7date(i) + 1));
                
                numaf = length(intersect(date4{ii}, date5{ii}));
                
                % Making two variables containing all the earthquakes before and
                % after
                
                quakebefore = [quakebefore, numbf];
                
                quakeafter = [quakeafter, numaf];
                
            end
            
            totbefore{ii} = quakebefore;
            totafter{ii} = quakeafter;
            totsubtract{ii} = totafter{ii} - totbefore{ii};
            
            negindex{ii} = find(totsubtract{ii} < 0);
            posindex{ii} = find(totsubtract{ii} > 0);
            
            totsubtract{ii}(negindex{ii}) = -1;     % Replacing 'more earthquakes before' with -1
            totsubtract{ii}(posindex{ii}) = 1;      % Replacing 'more earthquakes after' wtih 1
            
        end
        
    end
    
    all_index{thres} = thres_index;
    all_before{thres} = totbefore;
    all_after{thres} = totafter;
    all_subtract{thres} = totsubtract;
    
end

save('PGV_All1.mat') 