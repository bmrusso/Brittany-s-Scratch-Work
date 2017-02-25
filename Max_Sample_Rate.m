clc, clear 

strtdatelist=textread('./Teleseism_StrDates/Strt_Names.txt','%s');
enddatelist=textread('./Teleseism_EnDates/End_Names.txt','%s');

fid = fopen(['./Teleseism_StrDates/' strtdatelist{1}]);
srtdata = textscan(fid, '%s%s');
fclose(fid)

fid2 = fopen(['./Teleseism_EnDates/' enddatelist{1}]);
endata = textscan(fid2, '%s%s');
fclose(fid2)

srtdata1 = num2str(cell2mat(srtdata{1}));
srtdata2 = cell2mat(srtdata{2});

enddata1 = num2str(cell2mat(endata{1}));
enddata2 = cell2mat(endata{2});

junk1 = [];
junk2 = [];

for i=1:length(srtdata{1})
    
    junk1 = [junk1;srtdata1(i,:), ' ', srtdata2(i,:)];
    junk2 = [junk2;enddata1(i,:), ' ', enddata2(i,:)];
    
end

vecrate = [];
locvec = [ ];
matrix2 = [];
matrix3 = [];

for tele=57%:length(strtdate)
    
    strtvec = datevec(junk1(tele));
    endvec = datevec(junk2(tele));
    
%     beginning and end times for window of interest
    t1 = cal2sec(strtvec);
    t2 = cal2sec(endvec);
    
%     get some gappy data using irisFetch
    tc1 = sec2cal(t1);
    tc2 = sec2cal(t2);
    
    dta = irisFetch.Traces('US','WMOK','*','BH*',datestr(tc1,31),datestr(tc2,31),...
        'includePZ');
    
    ratemat = cell2mat({dta.sampleRate});
    
    ratemax = max(ratemat);
    
    matrix2 = [matrix2,ratemax];
    matrix3 = [matrix3, ratemat];
    
    totmax = max(matrix2);
  
end
% 
% 
% save('Max_SRATE.mat', totmax')

% load Tohokudata.mat
    