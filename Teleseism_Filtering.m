% Identifying local earthquakes by high passing the data of teleseisms
% Raton Data from 1/1/2008 until 1/1/2017 at TA T25A
% Oklahoma data from 3/13/2010 until 2/20/2012 at TA V35A

clc, clearvars -EXCEPT OK_dates OK_data BeOK_dates BeOK_data

% load filtered_data.mat
load peak_ground_data.mat
% load Raton_Corr.mat

%% Picking EQs
load MAX_SRATE.mat



[year,month,day,hour,mi,sec] = LoadComCat(datenum(2010, 3, 13), ...
  datenum(2012, 2, 20), 7, [-90 90 -180 180]);

datevector = datenum(year, month, day, hour, mi, sec);
    
% date_end = addtodate(datevector(40), 3, 'hour');
bef_date = datevector - hours(3);

phc = irisFetch.Traces('TA','V35A','*','BH?',datestr(bef_date(17), 31),...
    datestr(datevector(17), 31));


if length(phc) > 0
    
    for ii=1:3
        x = 0:(1/40)/3600:(length(phc(ii).data)-1)*((1/40)/3600);
        f{ii} = hp(phc(ii).data, phc(ii).sampleRate,5);
        figure(3)
        subplot(6,1,ii)
        plot(x, f{ii})
        subplot(6,1,ii+3)
        plot(f{ii})
        spectrogram(f{ii}, 1000, [ ], [ ], 40, 'power', 'yaxis')
    end
    
%     for ii=1:3
%          f{ii} = hp(phc(ii).data, phc(ii).sampleRate,5);
% 
%         figure(4)
%         subplot(6,1,ii)
%         plot(phc(ii).data)
%         subplot(6,1,ii+3)
%  
%         spectrogram(phc(ii).data, 1000, [ ], [ ], 40, 'power', 'yaxis')
%     end

end

gin_data = ginput;

num_sec = round(gin_data(:,1)*3600);

local_dates = zeros(length(num_sec), 1);

for i=1:length(num_sec)
    
    local_time = addtodate(datevector(40), num_sec(i), 'second');
    
    local_dates(i,:) = local_time;
    
end

localeq = datestr(local_dates);

%% Using EQ Above Threshold

% [year,month,day,hour,mi,sec] = LoadComCat(datenum(2001, 1, 1), ...
%     datenum(2017, 1, 1), 7, [-90 90 -180 180]);
% 
% num_index = find(year < 2008);
% PGA_total{10}(num_index) = [ ];
% PGV_total{10}(num_index) = [ ];
% 
% v_threshold = [0.0028, 0.0014, 0.00020];
% a_threshold = [0.0024, 0.0010, 0.00045];
% 
% for i=1:length(v_threshold)
%     
%     v_localeq = localeq_dates;
%     
%     v_index = find(PGV_total{10} >= v_threshold(i));
%     PGV_localeq{i} = v_localeq(v_index);
%     PGV_index{i} = v_index;
%     
% end
% 
% for i=1:length(a_threshold)
%     
%     a_localeq = localeq_dates;
%     
%     a_index = find(PGA_total{10} >= a_threshold(i));
%     PGA_localeq{i} = a_localeq(a_index);
%     PGA_index{i} = v_index;
%     
% end
%  