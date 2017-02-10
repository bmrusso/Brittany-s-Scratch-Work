% a function to extract data from output of irisFetch
function dtaf = extractdatairis(dta,sr1,tc1,tc2,nd1)
% 
% dta: the irisFetch structure
% sr1: sample rate
% tc1: start of time window in calendar format used by irisFetch
% tc2: end of time window in calendar format used by irisFetch
% nd1: the no data value or no data flag (e.g., -(2^31), NaN, etc)

% expected data length
dtaf = zeros(sr1*round((datenum(tc2)-datenum(tc1))*24*60*60)+1,1);

% the previous time (updated in loop), set to beginning of window initially
dprev = datenum(tc1);
% sample countr number
countr = 1;
% number of data fragments (bb)
[aa bb] = size(dta);
for ii=1:bb
    
    % how many samples in gap since previous?
    ngp = round((dta(ii).startTime-dprev)*24*60*60*sr1 - 1);
    
    % if a gap, fill it in
    if (ngp > 0)
        dtaf(countr:(countr+ngp-1)) = nd1;
        countr = countr + ngp;
    else
    end
    
    % now past gap, put in some real data
    stwin = countr;
    fnwin = stwin + dta(ii).sampleCount-1;
    dtaf(stwin:fnwin) = dta(ii).data;
    
    % update the new previous time and advance the counter by 1
    dprev = dta(ii).endTime;
    countr = fnwin+1;
end

% how many samples in gap at end?
% could also assume we did the above correct and add in the necessary 
% number of missing samples to achieve the expected data length

% if no data
if (bb == 0)
    
    dtaf = nd1*ones(sr1*round((datenum(tc2)-datenum(tc1))*24*60*60)+1,1);
    
% if there was data
else

dtaf(countr:end) = nd1;

end


