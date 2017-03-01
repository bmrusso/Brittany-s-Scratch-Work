% Identifying local earthquakes by high passing the data of teleseisms 

clc, clear

[year,month,day,hour,mi,sec] = LoadComCat(datenum(2008, 1, 1), ...
        datenum(2017, 1, 1), 7, [-90 90 -180 180]);

for i=1:length(year)
    
    datevector = datenum(year(i), month(i), day(i), hour(i), mi(i), sec(i));
    
    date_end = addtodate(datevector, 3, 'hour');
    
    phc = irisFetch.Traces('TA','T25A','*','BH?',datestr(datevector, 31),...
        datestr(date_end, 31));
    
    for ii=1:3
        figure(i)
        subplot(6,1,ii)
        plot(phc(ii).data)
        f{ii} = hp(phc(ii).data, phc(ii).sampleRate,5);
        subplot(6,1,ii+3)
        plot(f{ii})
    end
end

