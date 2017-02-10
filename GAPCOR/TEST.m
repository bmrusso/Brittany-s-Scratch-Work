% % fetch_testr: Fill in gaps from irisFetch
clear all

% beginning and end times for window of interest
t1 = cal2sec([2016 10 31 6 0 0]);
t2 = cal2sec([2016 10 31 7 0 0]);

% get some gappy data using irisFetch
tc1 = sec2cal(t1);
tc2 = sec2cal(t2);

dta = irisFetch.Traces('AV','OKNC','--','BHZ',datestr(tc1,31),datestr(tc2,31),'includePZ');

% no data value to insert in gaps, for example NaN or -(2^31)
nd1 = -(2^31);

% sample rate of data
% this works for gappy data as long as the sample rate does not change
sr1 = dta.sampleRate;
dtaf = extractdatairis(dta,sr1,tc1,tc2,nd1);


%%% high pass before instrument correcting
% sr1 = sample rate
% nd1 = the no data value, the value inserted into the gaps. I like to use -(2^31) since that number is not possible with 24 bit digitizers. If you want to use NaN, that's not possible with this code. I have to send you a different code.
% sfctr = filter out periods (s) higher than twice this value

dtaf=dtaf(:)';
gapzero=hipass_gp(sr1*50,dtaf,nd1);


pzz=find(dta(1).sacpz.zeros==0);
keepzer=setdiff(1:length(dta(1).sacpz.zeros),pzz(1));
dta(1).sacpz.zeros=dta(1).sacpz.zeros(keepzer);
corrgapzero=rm_instrum_resp(gapzero,-12345,dta(1).sampleRate,dta(1).sacpz.poles,dta(1).sacpz.zeros,.5,10,3,3,1/dta(1).sensitivity,dta(1).sensitivityFrequency,5,0);



