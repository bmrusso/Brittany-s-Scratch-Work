% Fetches iris data for the telelseisms and applies the fixes of missing
% data and then does the instrument correction

clc, clear all

load Max_SRATE.mat
load zone_structures.mat

strtdatelist=textread('./Teleseism_StrDates/Strt_Names.txt','%s');
enddatelist=textread('./Teleseism_EnDates/End_Names.txt','%s');


for i=1:length(alldata)
    
    uncorrseismograms=zeros(length(alldata{i})*6,maxvector(i)*7197);
    corrseismograms=uncorrseismograms;
    
        fid = fopen(['./Teleseism_StrDates/' strtdatelist{i}]);
    srtdata = textscan(fid, '%s%s');
    fclose(fid)
    
    fid = fopen(['./Teleseism_EnDates/' enddatelist{i}]);
    enddata = textscan(fid, '%s%s');
    fclose(fid)
    
    srtdata1 = num2str(cell2mat(srtdata{1}));
    srtdata2 = cell2mat(srtdata{2});
    
    enddata1 = num2str(cell2mat(enddata{1}));
    enddata2 = cell2mat(enddata{2});
    
    junk1 = [];
    junk2 = [];
    zonedata = [];
    
    for ii=1:length(alldata{i})
        
        dta = alldata{i}{ii};
        
        junk1 = [junk1;srtdata1(ii,:), ' ', srtdata2(ii,:)];
        junk2 = [junk2;enddata1(ii,:), ' ', enddata2(ii,:)];
        
        strtvec = datevec(junk1(ii,:));
        endvec = datevec(junk2(ii,:));
        
        %     beginning and end times for window of interest
        t1 = cal2sec(strtvec);
        t2 = cal2sec(endvec);
        
        %     get some gappy data using irisFetch
        tc1 = sec2cal(t1);
        tc2 = sec2cal(t2);
        
        % Displays when there is more than one location
        channellocations = [ ];
        
        for loco=1:length(dta)
            
            channellocations{loco} = dta(loco).location;
        end
        
        if length(channellocations) < 1
            continue
        else
            index = strcmp(channellocations, channellocations(1));
            moreindex = find(index == 0);
            dta(moreindex) = [];
        end
        
        % no data value to insert in gaps, for example NaN or -(2^31)
        nd1 = -(2^31);
        
        channelnames = [ ];
        chnames = [ ];
        channels = [ ];
        
        % Determines the number of unique channels
        
        
        for numdata=1:length(dta)
            
            channelnames{numdata} = dta(numdata).channel;
            
            chnames = unique(channelnames);
            
            if length(dta) < 0
                channels{numdata} = 0;
            else
                channels{numdata} = chnames;
            end
            
        end
        
        if length(dta) < 1
            
            continue
        else
            
            namevec = [];
            indexvec = [];
            
            for numchan=1:length(chnames)
                
                % Determining the index specific to their respective channel
                
                nameindex = strfind(channelnames, chnames(numchan));
                
                for x=1:length(channelnames)
                    
                    if nameindex{x} == 1
                        continue
                    else
                        nameindex{x} = 0;
                    end
                    
                end
                
                namevec{numchan} = cell2mat(nameindex);
                
                index = find(namevec{numchan} == 1);
                
                indexvec{numchan} = index; %Index of the channels
                
                % sample rate of data
                % this works for gappy data as long as the sample rate does not change
                sr1 = dta.sampleRate;
                dtaf = extractdatairis(dta(numchan),sr1,tc1,tc2,nd1);
                
                
                %%% high pass before instrument correcting
                % sr1 = sample rate
                % nd1 = the no data value, the value inserted into the gaps. I like to use
                % -(2^31) since that number is not possible with 24 bit digitizers. If you
                % want to use NaN, that's not possible with this code. I have to send you a different code.
                % sfctr = filter out periods (s) higher than twice this value
                
                dtaf=dtaf(:)';
                gapzero=hipass_gp(sr1*50,dtaf,nd1);
                
                
                pzz=find(dta(numchan).sacpz.zeros==0);
                
                keepzer=setdiff(1:length(dta(numchan).sacpz.zeros),pzz(numchan));
                
                dta(numchan).sacpz.zeros=dta(numchan).sacpz.zeros(keepzer);
                
                corrgapzero=rm_instrum_resp(gapzero,-12345,dta(numchan).sampleRate,dta(numchan).sacpz.poles,...
                    dta(numchan).sacpz.zeros,.02,10,3,3,1/dta(numchan).sensitivity,dta(numchan).sensitivityFrequency,5,0);
                
                corrseismograms(6*ii-(6-numchan),1:length(corrgapzero)) = corrgapzero;
                
            end
            
        end
        
    end
    
    corr_data{i} = corrseismograms;
    channellist{i} = channels;
    
end

save('Corr_Data.mat', 'corr_data', 'channellist','-v7.3')
