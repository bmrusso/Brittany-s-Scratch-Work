clc, clear all

strtdate = textread('OK_StartDates.txt', '%s', 'delimiter', ',');
endate = textread('OK_EndDates.txt', '%s', 'delimiter', ',');

vecrate = [];

% for tele=1:length(strtdate)
    
%     strtvec = datevec(strtdate(tele));
%     endvec = datevec(strtdate(tele));
    
%     % beginning and end times for window of interest
%     t1 = cal2sec(strtvec);
%     t2 = cal2sec(endvec);
%     
%     % get some gappy data using irisFetch
%     tc1 = sec2cal(t1);
%     tc2 = sec2cal(t2);
    
    dta = irisFetch.Traces('US','WMOK','*','BH*','2016-12-25 14:22:27','2016-12-25 16:22:24',...
        'includePZ');
    
%     if length(dta) > 0
  
    sprate = cell2mat({dta.sampleRate});
    spmax = max(sprate);
    vecrate = [vecrate, spmax];
    
%     else
%         vecrate = [vecrate, 0];
%     end
    
% end





    