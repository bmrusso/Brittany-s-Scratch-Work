% Finding the envelope for the data and looking for the mean and then
% determining if the values are too large and then removing them from the
% data set

clc, clear 

load MAX_SRATE.mat

[year,month,day,hour,mi,sec] = LoadComCat(datenum(2008, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

datevector = datenum(year, month, day, hour, mi, sec);
datevector(1:7) = [];

x = 0:(1/40)/3600:432000*((1/40)/3600);

%%
% bef_date = datevector - hours(3);
% 
% tot_val{1} = zeros(1, 155);
% tot_val{2} = zeros(1, 155);
% tot_val{3} = zeros(1, 155);
% 
% for i=1:length(datevector)
%     
%     phc = irisFetch.Traces('TA','T25A','*','BH?',datestr(bef_date(i), 31),...
%         datestr(datevector(i), 31));
%     
%     f{1} = hp(phc(1).data, phc(1).sampleRate,5);
%     enval1 = envelope(detrend(f{1}));
%     
%     f{2} = hp(phc(2).data, phc(2).sampleRate,5);
%     enval2 = envelope(detrend(f{2}));
%     
%     f{3} = hp(phc(3).data, phc(3).sampleRate,5);
%     enval3 = envelope(detrend(f{3}));
%     
%     tot_val{1}(i) = median(enval1);
%     tot_val{2}(i) = median(enval2);
%     tot_val{3}(i) = median(enval3);
% end
% 
% index1 = find(tot_val{1} > 9.5773);
% index2 = find(tot_val{2} > 11.6910);
% index3 = find(tot_val{3} > 8.9184);

%% 

tot_val{1} = zeros(1, 155);
tot_val{2} = zeros(1, 155);
tot_val{3} = zeros(1, 155);

for i=1:length(datevector)
    
    date_end = addtodate(datevector(i), 3, 'hour');
    
    phc = irisFetch.Traces('TA','T25A','*','BH?',datestr(datevector(i), 31),...
        datestr(date_end, 31));
    
    f{1} = hp(phc(1).data, phc(1).sampleRate,5);
    enval1 = envelope(detrend(f{1}));
    
    f{2} = hp(phc(2).data, phc(2).sampleRate,5);
    enval2 = envelope(detrend(f{2}));
    
    f{3} = hp(phc(3).data, phc(3).sampleRate,5);
    enval3 = envelope(detrend(f{3}));
    
    tot_val{1}(i) = median(enval1);
    tot_val{2}(i) = median(enval2);
    tot_val{3}(i) = median(enval3);
end

index1 = find(tot_val{1} > 11.1370);
index2 = find(tot_val{2} > 13.8265);
index3 = find(tot_val{3} > 10.2770);