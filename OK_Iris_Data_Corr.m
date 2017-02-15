% clear 
% 
% strtdate = textread('OK_StartDates.txt', '%s', 'delimiter', ',');
% endate = textread('OK_EndDates.txt', '%s', 'delimiter', ',');
% 
% vecrate = [];
% locvec = [ ];
% matrix2 = [];
% 
% for tele=1:length(strtdate)
%     
%     strtvec = datevec(strtdate(tele));
%     endvec = datevec(endate(tele));
%     
% %     beginning and end times for window of interest
%     t1 = cal2sec(strtvec);
%     t2 = cal2sec(endvec);
%     
% %     get some gappy data using irisFetch
%     tc1 = sec2cal(t1);
%     tc2 = sec2cal(t2);
%     
%     dta = irisFetch.Traces('US','WMOK','*','BH*',datestr(tc1,31),datestr(tc2,31),...
%         'includePZ');
%     
%     ratemat = cell2mat({dta.sampleRate});
%     
%     ratemax = max(ratemat);
%     
%     matrix2 = [matrix2,ratemax];
%     
%     totmax = max(matrix2);
%   
% end
% 
% 
% save('Max_SRATE.mat', totmax')

load Tohokudata.mat
    