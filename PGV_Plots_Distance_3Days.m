clc, clear 

load teleseism_distance.mat
load shaking_rate1_5.mat
load shaking_rate3.mat
load shaking_rate6.mat
load shaking_rate15.mat
load PGV_dc_data_3days.mat
load month_count.mat

csum15 = cumsum(totsubtract15);

kmlen1_5 = kmlen(index1_5);
kmlen3 = kmlen(index3);
kmlen6 = kmlen(index6);
kmlen15 = kmlen(index15);

index1_1_5 = find(kmlen1_5 < 3000);
index3_1_5 = find(kmlen1_5 >= 3000 & kmlen1_5 < 5000);
index5_1_5 = find(kmlen1_5 >= 5000 & kmlen1_5 < 7000);
index7_1_5 = find(kmlen1_5 >= 7000 & kmlen1_5 < 9000);
index9_1_5 = find(kmlen1_5 >= 9000 & kmlen1_5 < 11000);
index11_1_5 = find(kmlen1_5 >= 11000 & kmlen1_5 < 13000);
index13_1_5 = find(kmlen1_5 >= 13000 & kmlen1_5 < 15000);
index15_1_5 = find(kmlen1_5 >= 15000 & kmlen1_5 < 17000);

index1_3 = find(kmlen3 < 3000);
index3_3 = find(kmlen3 >= 3000 & kmlen3 < 5000);
index5_3 = find(kmlen3 >= 5000 & kmlen3 < 7000);
index7_3 = find(kmlen3 >= 7000 & kmlen3 < 9000);
index9_3 = find(kmlen3 >= 9000 & kmlen3 < 11000);
index11_3 = find(kmlen3 >= 11000 & kmlen3 < 13000);
index13_3 = find(kmlen3 >= 13000 & kmlen3 < 15000);
index15_3 = find(kmlen3 >= 15000 & kmlen3 < 17000);

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

figure(1)
hold on
yyaxis left
plot(m7date1_5, csum1_5)
plot(m7date1_5(index1_1_5), csum1_5(index1_1_5),'rx')
plot(m7date1_5(index3_1_5), csum1_5(index3_1_5),'y*')
plot(m7date1_5(index5_1_5), csum1_5(index5_1_5),'gx')
plot(m7date1_5(index7_1_5), csum1_5(index7_1_5),'cx')
plot(m7date1_5(index9_1_5), csum1_5(index9_1_5),'bx')
plot(m7date1_5(index11_1_5), csum1_5(index11_1_5),'m*')
plot(m7date1_5(index13_1_5), csum1_5(index13_1_5),'kx')
plot(m7date1_5(index15_1_5), csum1_5(index15_1_5),'r*')
yyaxis right
plot(datevector, totalcount)
datetick('x', 23)
title('PGV - Threshold 0.15x10^-^3')
hold off

figure(2)
hold on 
yyaxis left
plot(m7date3, csum3)
plot(m7date3(index1_3), csum3(index1_3),'rx')
plot(m7date3(index3_3), csum3(index3_3),'y*')
plot(m7date3(index5_3), csum3(index5_3),'gx')
plot(m7date3(index7_3), csum3(index7_3),'cx')
plot(m7date3(index9_3), csum3(index9_3),'bx')
plot(m7date3(index11_3), csum3(index11_3),'m*')
plot(m7date3(index13_3), csum3(index13_3),'kx')
plot(m7date3(index15_3), csum3(index15_3),'r*')
yyaxis right
plot(datevector, totalcount)
datetick('x', 23)
title('PGV - Threshold 0.3x10^-^3')
hold off

figure(3)
hold on
yyaxis left 
plot(m7date6, csum6)
plot(m7date6(index1_6), csum6(index1_6),'rx')
plot(m7date6(index3_6), csum6(index3_6),'y*')
plot(m7date6(index5_6), csum6(index5_6),'gx')
plot(m7date6(index7_6), csum6(index7_6),'cx')
plot(m7date6(index9_6), csum6(index9_6),'bx')
plot(m7date6(index11_6), csum6(index11_6),'m*')
plot(m7date6(index13_6), csum6(index13_6),'kx')
plot(m7date6(index15_6), csum6(index15_6),'r*')
yyaxis right
plot(datevector, totalcount)
datetick('x', 23)
title('PGV - Threshold 0.6x10^-^3')
hold off

figure(4)
hold on
yyaxis left 
plot(m7date15, csum15)
plot(m7date15(index1_15), csum15(index1_15),'rx')
plot(m7date15(index3_15), csum15(index3_15),'y*')
plot(m7date15(index5_15), csum15(index5_15),'gx')
plot(m7date15(index7_15), csum15(index7_15),'cx')
plot(m7date15(index9_15), csum15(index9_15),'bx')
plot(m7date15(index11_15), csum15(index11_15),'m*')
plot(m7date15(index13_15), csum15(index13_15),'kx')
plot(m7date15(index15_15), csum15(index15_15),'r*')
yyaxis right
plot(datevector, totalcount)
datetick('x', 23)
title('PGV - Threshold 1.5x10^-^3')
hold off
