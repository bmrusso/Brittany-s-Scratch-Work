% Finding the envelope for the data and looking for the mean and then
% determining if the values are too large and then removing them from the
% data set
% Raton Data from 1/1/2008 until 1/1/2017 at TA T25A
% Oklahoma data from 3/13/2010 until 2/20/2012 at TA V35A

clc, clear 

load All_OKFiltered.mat 

%% Before a teleseism

tot_val{1} = zeros(1, 40);
tot_val{2} = zeros(1, 40);
tot_val{3} = zeros(1, 40);

for i=1:length(filt_data_af)
    
    if length(filt_data_af{i}) > 0
        
    f{1} = hp(filt_data_af{i}(1).data, filt_data_af{i}(1).sampleRate,5);
    enval1 = envelope(detrend(f{1}));
    
    f{2} = hp(filt_data_af{i}(2).data, filt_data_af{i}(2).sampleRate,5);
    enval2 = envelope(detrend(f{2}));
    
    f{3} = hp(filt_data_af{i}(3).data, filt_data_af{i}(3).sampleRate,5);
    enval3 = envelope(detrend(f{3}));
    
    tot_val{1}(i) = median(enval1);
    tot_val{2}(i) = median(enval2);
    tot_val{3}(i) = median(enval3);
    
    else 
    tot_val{1}(i) = 0;
    tot_val{2}(i) = 0;
    tot_val{3}(i) = 0;
    end
end

% index1 = find(tot_val{1} > 9.5773);
% index2 = find(tot_val{2} > 11.6910);
% index3 = find(tot_val{3} > 8.9184);

%% After a teleseism

% tot_val{1} = zeros(1, 155);
% tot_val{2} = zeros(1, 155);
% tot_val{3} = zeros(1, 155);
% 
% for i=1:length(datevector)
%     
%     date_end = addtodate(datevector(i), 3, 'hour');
%     
%     phc = irisFetch.Traces('TA','T25A','*','BH?',datestr(datevector(i), 31),...
%         datestr(date_end, 31));
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
% index1 = find(tot_val{1} > 11.1370);
% index2 = find(tot_val{2} > 13.8265);
% index3 = find(tot_val{3} > 10.2770);