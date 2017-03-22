% Identifying local earthquakes by high passing the data of teleseisms

clc, clearvars -EXCEPT localeq_dates

load MAX_SRATE.mat

[year,month,day,hour,mi,sec] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

datevector = datenum(year, month, day, hour, mi, sec);
    
date_end = addtodate(datevector(121), 3, 'hour');

phc = irisFetch.Traces('TA','T25A','*','BH?',datestr(datevector(121), 31),...
    datestr(date_end, 31));

if length(phc) > 0
    
    for ii=1:3
        
        subplot(6,1,ii)
        plot(phc(ii).data)
        f{ii} = hp(phc(ii).data, phc(ii).sampleRate,5);
        subplot(6,1,ii+3)
        plot(f{ii})
    end
    
end
% 
% gin_data = ginput;
% 
% num_sec = round(gin_data(:,1)/40);
% 
% local_dates = zeros(length(num_sec), 1);
% 
% for i=1:length(num_sec)
%     
%     local_time = addtodate(datevector(121), num_sec(i), 'second');
%     
%     local_dates(i,:) = local_time;
%     
% end
% 
% localeq = datestr(local_dates);

