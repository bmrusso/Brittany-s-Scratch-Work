% IDK YET

clc, clear

zoneyears = [1997, 1976, 1998, 1973, 2009, 2013, 2008, 2008, 2006, 1991, 2001, ...
    2015, 2011, 2008, 2010];

alldates = [ ];
enddates = [ ];

% for i=1:length(zoneyears)
    
[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2006, 1, 1), ...
        datenum(2017, 1, 1), 7, [-90 90 -180 180]);
    
    numbdate = datenum(y,mo,d,h,mi,s);
    
    gooddate = datestr(numbdate,31);
    

    
   laterdate = numbdate+0.0833;
   
gooddate2 = datestr(laterdate,31);

% enddates{i} = gooddate2;
    
% end
% 
% gooddate = char(gooddate);
% gooddate2 = char(gooddate2);
% 
% alldata = [charvec,gooddate, charspace,gooddate2, charvec2]

save OKdates