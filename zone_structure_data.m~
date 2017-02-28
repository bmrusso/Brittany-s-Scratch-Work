% Pulls the iris fetch data.

strtdatelist=textread('./Teleseism_StrDates/Strt_Names.txt','%s');
enddatelist=textread('./Teleseism_EnDates/End_Names.txt','%s');

    
    fid = fopen(['./Teleseism_StrDates/' strtdatelist{ii}]);
    srtdata = textscan(fid, '%s%s');
    fclose(fid)
    
    fid = fopen(['./Teleseism_EnDates/' enddatelist{ii}]);
    enddata = textscan(fid, '%s%s');
    fclose(fid)
    
    srtdata1 = num2str(cell2mat(srtdata{1}));
    srtdata2 = cell2mat(srtdata{2});
    
    enddata1 = num2str(cell2mat(enddata{1}));
    enddata2 = cell2mat(enddata{2});
    
    junk1 = [];
    junk2 = [];
    
    for i=1:length(srtdata{1})
        
        junk1 = [junk1;srtdata1(i,:), ' ', srtdata2(i,:)];
        junk2 = [junk2;enddata1(i,:), ' ', enddata2(i,:)];
        
    end
    
    for tele=1:length(junk1)
        
        strtvec = datevec(junk1(tele,:));
        endvec = datevec(junk2(tele,:));
        
        %     beginning and end times for window of interest
        t1 = cal2sec(strtvec);
        t2 = cal2sec(endvec);
        
        %     get some gappy data using irisFetch
        tc1 = sec2cal(t1);
        tc2 = sec2cal(t2);

dta_brewt = irisFetch.Traces('US','BRAL','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

    end

dta_cog = irisFetch.Traces('US','WMOK','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

dta_dagger = irisFetch.Traces('US','MNTX','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

dta_fash = irisFetch.Traces('US','JCT','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

dta_ncark = irisFetch.Traces('US','MIAR','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

dta_greeley = irisFetch.Traces('US','ISCO','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

dta_irving = irisFetch.Traces('US','NATX','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

dta_ntx = dta_irving;

dta_okks = dta_cog;

dta_paradox = irisFetch.Traces('US','MVCO','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

dta_raton = irisFetch.Traces('US','SDCO','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

dta_suncity = dta_cog;

dta_timp = dta_irving;

dta_venus = dta_irving;

dta_youngs = irisFetch.Traces('US','ERPA','*','BH*',datestr(tc1,31),datestr(tc2,31),...
    'includePZ');

save zone_structures.mat