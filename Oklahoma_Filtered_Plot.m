% Counting the  number of local earthquakes before and after a teleseism
% for the Raton Basin and plotting the rate on a graph

clc, clear

load Oklahoma_filtered.mat
load peak_ground_data.mat

rem_vec = [2, 17];

before_vector = zeros(1, 40);
after_vector = zeros(1, 40);

for i=1:length(BeOK_data)
    
    befnumeq = length(BeOK_data{i});
    aftnumeq = length(OK_data{i});
    
    before_vector(i) = befnumeq;
    after_vector(i) = aftnumeq;
    
end
  
sub_vector = after_vector - before_vector;

negindex = find(sub_vector < 0);
sub_vector(negindex) = -1;

posindex = find(sub_vector > 0);
sub_vector(posindex) = 1;

figure(1)
hold on
plot(datevector, cumsum(sub_vector))
plot(datevector, cumsum(sub_vector),'ro')
datetick('x',2)
ylim([-7 7])
hold off

% removing data points 
[year,month,day,hour,mi,sec] = LoadComCat(datenum(2006, 1, 1), ...
    datenum(2017, 1, 1), 7, [-90 90 -180 180]);

comp_datevec = datenum(year, month, day, hour, mi, sec);

begindex = find(datevector(1) == comp_datevec);
endindex = find(datevector(end) == comp_datevec);
num_index = begindex:endindex;

OKPGA = PGA_total{8}(num_index);
OKPGV = PGV_total{8}(num_index);

OKPGA(rem_vec) = [ ];
OKPGA(rem_vec) = [ ];
datevector(rem_vec) = [ ];

v_threshold = [0.0028, 0.0014, 0.00020];
a_threshold = [0.0024, 0.0010, 0.00045];

for i=1:length(v_threshold)
    
    v_localeq = OK_dates;
    
    v_index = find(OKPGV >= v_threshold(i));
    PGV_localeq{i} = v_localeq(v_index);
    PGV_index{i} = v_index;
    
end

for i=1:length(a_threshold)
    
    a_localeq = OK_dates;
    
    a_index = find(OKPGA >= a_threshold(i));
    PGA_localeq{i} = a_localeq(a_index);
    PGA_index{i} = a_index;
    
end

x = [datevector(1), datevector(end)];
y = [0 0];

figure(2)
hold on 
plot(datevector(PGV_index{3}), cumsum(sub_vector(PGV_index{3})))
plot(datevector(PGV_index{3}), cumsum(sub_vector(PGV_index{3})), 'ro')
title('PGV - Thres 2.0x10^-^4')
datetick('x',2)
ylim([-3 3])
hold off

figure(3)
hold on
plot(datevector(PGV_index{2}), cumsum(sub_vector(PGV_index{2})))
plot(datevector(PGV_index{2}), cumsum(sub_vector(PGV_index{2})), 'ro')
title('PGV - Thres 1.4x10^-^3')
datetick('x',2)
hold off

figure(4)
hold on
plot(datevector(PGA_index{3}), cumsum(sub_vector(PGA_index{3})))
plot(datevector(PGA_index{3}), cumsum(sub_vector(PGA_index{3})), 'ro')
title('PGA - Thres 4.5x10^-^4')
datetick('x',2)
ylim([-2 2])
hold off

figure(5)
hold on 
plot(datevector(PGA_index{2}), cumsum(sub_vector(PGA_index{2})))
plot(datevector(PGA_index{2}), cumsum(sub_vector(PGA_index{2})), 'ro')
title('PGA - Thres 1.0x10^-^3')
datetick('x',2)
hold off

% figure(6)
% hold on
% plot(datevector(PGA_index{1}), cumsum(sub_vector(PGA_index{1})))
% plot(datevector(PGA_index{1}), cumsum(sub_vector(PGA_index{1})), 'ro')
% title('PGA - Thres 2.4x10^-^3')
% datetick('x',2)
% hold off
% 
% figure(7)
% hold on 
% plot(datevector(PGV_index{1}), cumsum(sub_vector(PGV_index{1})))
% plot(datevector(PGV_index{1}), cumsum(sub_vector(PGV_index{1})), 'ro')
% title('PGV - Thres 2.8x10^-^3')
% datetick('x',2)
% hold off