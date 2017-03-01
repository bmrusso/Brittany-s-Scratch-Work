% Fetches iris data for the telelseisms and applies the fixes of missing
% data and then does the instrument correction

clc, clear all

load Max_SRATE.mat
load zone_structures.mat

strtdate = textread('OK_StartDates.txt', '%s', 'delimiter', ',');
endate = textread('OK_EndDates.txt', '%s', 'delimiter', ',');

uncorrseismograms=zeros(length(strtdate)*6,totmax*7197);
corrseismograms=uncorrseismograms;
time=uncorrseismograms;

for tele=1:length(strtdate)
    
    strtvec = datevec(strtdate(tele));
    endvec = datevec(endate(tele));
    
    % beginning and end times for window of interest
    t1 = cal2sec(strtvec);
    t2 = cal2sec(endvec);
    
    % get some gappy data using irisFetch
    tc1 = sec2cal(t1);
    tc2 = sec2cal(t2);
    
    dta = irisFetch.Traces('US','WMOK','*','BH*',datestr(tc1,31),datestr(tc2,31),...
        'includePZ');
    
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
            
            for ii=1:length(channelnames)
                
                if nameindex{ii} == 1
                    continue
                else
                    nameindex{ii} = 0;
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
            
            corrseismograms(6*tele-(6-numchan),1:length(corrgapzero)) = corrgapzero;
            
        end
        
    end
    
end


save('OK_Corr_Data.mat', 'corrseismograms', 'channels','-v7.3')
