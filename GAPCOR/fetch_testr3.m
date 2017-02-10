% fetch_testr: Fill in gaps from irisFetch
clear all

% beginning and end times for window of interest
t1 = cal2sec([2016 10 31 6 0 0]);
t2 = cal2sec([2016 10 31 7 0 0]);

% get some gappy data using irisFetch
tc1 = sec2cal(t1);
tc2 = sec2cal(t2);

dta = irisFetch.Traces('AV','OKNC','--','BHZ',datestr(tc1,31),datestr(tc2,31),'includePZ');

% no data value to insert in gaps, for example NaN or -(2^31)
nd1 = NaN;%-(2^31);
% sample rate of data
% this works for gappy data as long as the sample rate does not change
sr1 = dta.sampleRate;
dtaf = extractdatairis(dta,sr1,tc1,tc2,nd1);

broad=dta;

for i=1:1%!%length(broad)
    pzz=find(dta(i).sacpz.zeros==0);
    keepzer=setdiff(1:length(broad(i).sacpz.zeros),pzz(1));
    broad(i).sacpz.zeros=broad(i).sacpz.zeros(keepzer);
    broadcorr{i}=rm_instrum_resp(dtaf,-12345,broad(i).sampleRate,broad(i).sacpz.poles,broad(i).sacpz.zeros,.5,10,3,3,1/broad(i).sensitivity,broad(i).sensitivityFrequency,5,0);
end


% figure
% plot(dtaf(1:end)); axis([0 length(dtaf) -100000 100000])
% 
% 

