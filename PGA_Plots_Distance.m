clc, clear 

load teleseism_distance.mat
load shakingrate19.mat
load shakingrate6.mat
load shakingrate15.mat
load PGA_dc_data.mat
load month_count.mat

csum15 = cumsum(totsubtract15);
csum19 = cumsum(totsubtract19);
csum6 = cumsum(totsubtract6);

kmlen19 = kmlen(index19);
kmlen6 = kmlen(index6);
kmlen15 = kmlen(index15);

index1_19 = find(kmlen19 < 3000);
index3_19 = find(kmlen19 >= 3000 & kmlen19 < 5000);
index5_19 = find(kmlen19 >= 5000 & kmlen19 < 7000);
index7_19 = find(kmlen19 >= 7000 & kmlen19 < 9000);
index9_19 = find(kmlen19 >= 9000 & kmlen19 < 11000);
index11_19 = find(kmlen19 >= 11000 & kmlen19 < 13000);
index13_19 = find(kmlen19 >= 13000 & kmlen19 < 15000);
index15_19 = find(kmlen19 >= 15000 & kmlen19 < 17000);

index1_6 = find(kmlen6 < 3000);
index3_6 = find(kmlen6 >= 3000 & kmlen6 < 5000);
index5_6 = find(kmlen6 >= 5000 & kmlen6 < 7000);
index7_6 = find(kmlen6 >= 7000 & kmlen6 < 9000);
index9_6 = find(kmlen6 >= 9000 & kmlen6 < 11000);
index11_6 = find(kmlen6 >= 11000 & kmlen6 < 13000);
index13_6 = find(kmlen6 >= 13000 & kmlen6 < 15000);
index15_6 = find(kmlen6 >= 15000 & kmlen6 < 17000);

index1_15 = find(kmlen15 < 3000);
index3_15 = find(kmlen15 >= 3000 & kmlen15 < 5000);
index5_15 = find(kmlen15 >= 5000 & kmlen15 < 7000);
index7_15 = find(kmlen15 >= 7000 & kmlen15 < 9000);
index9_15 = find(kmlen15 >= 9000 & kmlen15 < 11000);
index11_15 = find(kmlen15 >= 11000 & kmlen15 < 13000);
index13_15 = find(kmlen15 >= 13000 & kmlen15 < 15000);
index15_15 = find(kmlen15 >= 15000 & kmlen15 < 17000);

begdate = datenum(2006,1,1);
lastdate = datenum(2018,1,1);

figure(1)
hold on 
yyaxis left
plot(m7date19, csum19)
plot(m7date19(index1_19), csum19(index1_19),'rx')
plot(m7date19(index3_19), csum19(index3_19),'y*')
plot(m7date19(index5_19), csum19(index5_19),'gx')
plot(m7date19(index7_19), csum19(index7_19),'cx')
plot(m7date19(index9_19), csum19(index9_19),'bx')
plot(m7date19(index11_19), csum19(index11_19),'mx')
plot(m7date19(index13_19), csum19(index13_19),'kx')
plot(m7date19(index15_19), csum19(index15_19),'r*')
yyaxis right
plot(monthly_data{1}{2}, monthly_data{1}{1})
datetick('x', 23)
title('PGA - Threshold 0.19x10^-^3')
hold off

figure(2)
hold on
yyaxis left
plot(m7date6, csum6)
plot(m7date6(index1_6), csum6(index1_6),'rx')
plot(m7date6(index3_6), csum6(index3_6),'y*')
plot(m7date6(index5_6), csum6(index5_6),'gx')
plot(m7date6(index7_6), csum6(index7_6),'cx')
plot(m7date6(index9_6), csum6(index9_6),'bx')
plot(m7date6(index11_6), csum6(index11_6),'mx')
plot(m7date6(index13_6), csum6(index13_6),'kx')
plot(m7date6(index15_6), csum6(index15_6),'r*')
yyaxis right
plot(monthly_data{1}{2}, monthly_data{1}{1}) 
datetick('x', 23)
title('PGA - Threshold 0.6x10^-^3')
hold off

figure(3)
hold on
yyaxis left
plot(m7date15, csum15)
plot(m7date15(index1_15), csum15(index1_15),'rx')
plot(m7date15(index3_15), csum15(index3_15),'y*')
plot(m7date15(index5_15), csum15(index5_15),'gx')
plot(m7date15(index7_15), csum15(index7_15),'cx')
plot(m7date15(index9_15), csum15(index9_15),'bx')
plot(m7date15(index11_15), csum15(index11_15),'mx')
plot(m7date15(index13_15), csum15(index13_15),'kx')
plot(m7date15(index15_15), csum15(index15_15),'r*')
yyaxis right
plot(monthly_data{1}{2}, monthly_data{1}{1})
datetick('x', 23)
title('PGA - Threshold 1.5x10^-^3')
hold off
