% Removes the double counting of earthquakes for each zone

clc, clear

load num_eq_data3.mat


%% Double Counting Correction For Bewton

clc
clear y mo d h mi s ma

% Pulling Teleseism Data 

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1997, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector 

start_date = datenum(1997,1,1);
not_date = find(squaredate{1} < start_date);
squaredate{1}(not_date) = [ ];

magn{1}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

dblecount = find(totsubtract{1} > 0 | totsubtract{1} < 0);

fixbewt3 = totsubtract{1}; % Corrected for double counting


%% Double Counting Correction For Cog

clc
clear y mo d h mi s ma

% Pulling Teleseism Data 

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1976, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d, h, mi, s);

% Removing Unnecessary dates from vector 

start_date = datenum(1976,1,1);
not_date = find(squaredate{2} < start_date);
squaredate{2}(not_date) = [ ];

magn{2}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{2} > 0);
m_after = find(totafter{2} >0);
dblecount = find(totsubtract{2} > 0 | totsubtract{2} < 0);
totsubtract{2}(483) = 0;
totsubtract{2}(484) = 0;

fixcog3 = totsubtract{2}; % Corrected for double counting


%%  Double Counting Correction For Dagger
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1998, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d);

% Removing Unnecessary dates from vector

start_date = datenum(1998,1,1);
not_date = find(squaredate{3} < start_date);
squaredate{3}(not_date) = [ ];

magn{3}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{3} > 0);
m_after = find(totafter{3} >0);
dblecount = find(totsubtract{3} > 0 | totsubtract{3} < 0);

fixdagger3 = totsubtract{3}; % Corrected for double counting


%% Double Counting Correction For Fash
clc
clear y mo d h mi s ma

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1973, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

% Removing Unnecessary dates from vector

start_date = datenum(1973,1,1);
not_date = find(squaredate{4} < start_date);
squaredate{4}(not_date) = [ ];

magn{4}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{4} > 0);
m_after = find(totafter{4} >0);
dblecount = find(totsubtract{4} > 0 | totsubtract{4} < 0);
totsubtract{4}(528) = 0;

fixfash3 = totsubtract{4}; % Corrected for double counting
 

%% Double Counting Correction For NCentArk

clc
clear y mo d h mi s ma 

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2009, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

% Removing Unnecessary dates from vector

start_date = datenum(2009,1,1);
not_date = find(squaredate{5} < start_date);
squaredate{5}(not_date) = [ ];

magn{5}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{5} > 0);
m_after = find(totafter{5} >0);
dblecount = find(totsubtract{5} > 0 | totsubtract{5} < 0);
totsubtract{5}(48) = 0;
totsubtract{5}(49) = 0;

fixncentark3 = totsubtract{5}; % Corrected for double counting


%% Double Counting Correction For Greeley

clc
clear y mo d h mi s ma 

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2013, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

% Removing Unnecessary dates from vector

start_date = datenum(2013,1,1);
not_date = find(squaredate{6} < start_date);
squaredate{6}(not_date) = [ ];

magn{6}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{6} > 0);
m_after = find(totafter{6} >0);
dblecount = find(totsubtract{6} > 0 | totsubtract{6} < 0);

fixgreeley3 = totsubtract{6}; % Corrected for double counting

%% Double Counting Correction For Irving, NTX and Venus

clc
clear y mo d h mi s ma 

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2008, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

start_date = datenum(2008,1,1);

% Irving

% Removing Unnecessary dates from vector

not_date = find(squaredate{7} < start_date);
squaredate{7}(not_date) = [ ];

magn{7}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{7} > 0);
m_after = find(totafter{7} >0);
dblecount = find(totsubtract{7} > 0 | totsubtract{7} < 0);

fixirving3 = totsubtract{7}; % Corrected for double counting

% NTX

% Removing Unnecessary dates from vector

not_date = find(squaredate{8} < start_date);
squaredate{8}(not_date) = [ ];

magn{8}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{8} > 0);
m_after = find(totafter{8} >0);
dblecount = find(totsubtract{8} > 0 | totsubtract{8} < 0);

fixntx3 = totsubtract{8}; % Corrected for double counting

% Venus 

% Removing Unnecessary dates from vector

not_date = find(squaredate{14} < start_date);
squaredate{14}(not_date) = [ ];

magn{14}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{14} > 0);
m_after = find(totafter{14} >0);
dblecount = find(totsubtract{14} > 0 | totsubtract{14} < 0);
totsubtract{14}(126) = 0;

fixvenus3 = totsubtract{14}; % Corrected for double counting


%% Double Counting Correction For OK/KS

clc
clear y mo d h mi s ma 

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2006, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

% Removing Unnecessary dates from vector

start_date = datenum(2006,1,1);
not_date = find(squaredate{9} < start_date);
squaredate{9}(not_date) = [ ];

magn{9}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{9} > 0);
m_after = find(totafter{9} >0);
dblecount = find(totsubtract{9} > 0 | totsubtract{9} < 0);

totsubtract{9}(88) = 0;
totsubtract{9}(89) = 0;
totsubtract{9}(90) = 0;
totsubtract{9}(96) = 0;
totsubtract{9}(108) = 0;
totsubtract{9}(109) = 0;
totsubtract{9}(133) = 0;
totsubtract{9}(139) = 0;
totsubtract{9}(142) = 0;
totsubtract{9}(162) = 0;
totsubtract{9}(166) = 0;
totsubtract{9}(168) = 1;
totsubtract{9}(173) = 1;

fixokks3 = totsubtract{9}; % Corrected for double counting


%% Double Counting Correction For Paradox

clc
clear y mo d h mi s ma 

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(1991, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

% Removing Unnecessary dates from vector

start_date = datenum(1991,1,1);
not_date = find(squaredate{10} < start_date);
squaredate{10}(not_date) = [ ];

magn{10}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{10} > 0);
m_after = find(totafter{10} >0);
dblecount = find(totsubtract{10} > 0 | totsubtract{10} < 0);

fixparadox3 = totsubtract{10}; % Corrected for double counting


%% Double Counting Correction For Raton

clc
clear y mo d h mi s ma 

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2001, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

% Removing Unnecessary dates from vector

start_date = datenum(2001,1,1);
not_date = find(squaredate{11} < start_date);
squaredate{11}(not_date) = [ ];

magn{11}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{11} > 0);
m_after = find(totafter{11} >0);
dblecount = find(totsubtract{11} > 0 | totsubtract{11} < 0);
totsubtract{11}(160) = 0;
totsubtract{11}(161) = 0;
totsubtract{11}(167) = 0;
totsubtract{11}(213) = 0;
totsubtract{11}(215) = 0;

fixraton3 = totsubtract{11}; % Corrected for double counting


%% Double Counting Correction For Sun City

clc
clear y mo d h mi s ma 

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2015, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

% Removing Unnecessary dates from vector

start_date = datenum(2015,1,1);
not_date = find(squaredate{12} < start_date);
squaredate{12}(not_date) = [ ];

magn{12}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{12} > 0);
m_after = find(totafter{12} >0);
dblecount = find(totsubtract{12} > 0 | totsubtract{12} < 0);
totsubtract{12}(13) = 0;

fixsuncity3 = totsubtract{12}; % Corrected for double counting


%% Double Counting Correction For Timp

clc
clear y mo d h mi s ma 

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2011, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

% Removing Unnecessary dates from vector

start_date = datenum(2011,1,1);
not_date = find(squaredate{13} < start_date);
squaredate{13}(not_date) = [ ];

magn{13}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{13} > 0);
m_after = find(totafter{13} >0);
dblecount = find(totsubtract{13} > 0 | totsubtract{13} < 0);

fixtimp3 = totsubtract{13}; % Corrected for double counting

%% Double Counting Correction For Youngs

clc
clear y mo d h mi s ma 

% Pulling Teleseism Data

[y,mo,d,h,mi,s,~,~,~,ma] = LoadComCat(datenum(2010, 1, 1), datenum(2017, 1, 1), ...
        7, [-90 90 -180 180]);
    
m7date = datenum(y, mo, d,h,mi,s);

% Removing Unnecessary dates from vector

start_date = datenum(2010,1,1);
not_date = find(squaredate{15} < start_date);
squaredate{15}(not_date) = [ ];

magn{15}(not_date) = [ ];
    
% Code to fix the double counting issue - changes for each case

m_before = find(totbefore{15} > 0);
m_after = find(totafter{15} >0);
dblecount = find(totsubtract{15} > 0 | totsubtract{15} < 0);

fixyoungs3 = totsubtract{15}; % Corrected for double counting


%Plotting the earthquakes

% hold on
% stem(squaredate{15}, magn{15}, 'g')
% stem(m7date, ma, 'r--')
% datetick('x', 1)
% 
% rateaft = find(totafter{15} >0);
% ratebef = find(totbefore{15} > 0);
% 
% stem(m7date(rateaft), ma(rateaft), 'k')
% stem(m7date(ratebef), ma(ratebef), 'b')
% 
% stem(m7date(rateaft)+7, ma(rateaft), 'c-')
% stem(m7date(rateaft)-7, ma(rateaft), 'c-')
% 
% stem(m7date(ratebef)+7, ma(ratebef), 'm-')
% stem(m7date(ratebef)-7, ma(ratebef), 'm-')

% stem(m7date(12), ma(12), 'y--')
% stem(m7date(13), ma(13), 'y--')
% stem(m7date(78), ma(78), 'y--')
% stem(m7date(79), ma(79), 'y--')

% hold off

save fixed_dc3