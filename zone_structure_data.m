% Pulls the iris fetch data.

strtdatelist=textread('./Teleseism_StrDates/Strt_Names.txt','%s');
enddatelist=textread('./Teleseism_EnDates/End_Names.txt','%s');

stationnames = {'BRAL', 'WMOK', 'MNTX', 'JCT', 'MIAR', 'ISCO', 'NATX', ...
    'WMOK', 'MVCO', 'SDCO', 'WMOK', 'NATX', 'ERPA'};

alldata=[];

for ii=1:length(stationnames)
    
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
    
    zonedata = [ ];
    
    for tele=1:length(junk1)
        
        strtvec = datevec(junk1(tele,:));
        endvec = datevec(junk2(tele,:));
        
        %     beginning and end times for window of interest
        t1 = cal2sec(strtvec);
        t2 = cal2sec(endvec);
        
        %     get some gappy data using irisFetch
        tc1 = sec2cal(t1);
        tc2 = sec2cal(t2);
        
        dta = irisFetch.Traces('US',stationnames(ii),'*','BH*',datestr(tc1,31),datestr(tc2,31),...
            'includePZ');  
        
        zonedata{tele} = dta;
        
    end
    
    alldata{ii} = zonedata;
    
end

save zone_structures.mat