
clc, clear

load shaking_dc_PGA.mat
load month_count.mat
load yearly_count.mat

ok_data1 = cumsum(all_subtract{1}{9}); 
ok_data2 = cumsum(all_subtract{2}{9});
ok_data3 = cumsum(all_subtract{3}{9});

raton_data1 = cumsum(all_subtract{1}{10});
raton_data2 = cumsum(all_subtract{2}{10});
raton_data3 = cumsum(all_subtract{3}{10});

figure(1)
hold on 
yyaxis left
plot(or_dates{1}{1}, ok_data1)
plot(or_dates{1}{1}, ok_data1, 'ro')
yyaxis right
plot(monthly_data{1}{2}, monthly_data{1}{1})
title('Oklahoma')
legend( 'Monthly EQ Rate', 'Location','NorthWest')
datetick('x',2)
hold off

figure(2)
hold on 
yyaxis left
plot(or_dates{1}{2}, ok_data2)
plot(or_dates{1}{2}, ok_data2, 'ro')
yyaxis right
plot(monthly_data{1}{2}, monthly_data{1}{1})
title('Oklahoma')
legend('Cumulative Sum','Teleseism','Monthly EQ Rate', 'Location','NorthWest')
datetick('x', 2)
hold off

figure(3)
hold on 
yyaxis left
plot(or_dates{1}{3}, ok_data3)
plot(or_dates{1}{3}, ok_data3, 'ro')
yyaxis right
plot(monthly_data{1}{2}, monthly_data{1}{1})
title('Oklahoma')
legend('Cumulative Sum','Teleseism','Monthly EQ Rate','Location','NorthWest')
datetick('x',2)
hold off

figure(4)
hold on 
yyaxis left
plot(or_dates{2}{1}, raton_data1)
plot(or_dates{2}{1}, raton_data1, 'ro')
yyaxis right
plot(monthly_data{2}{2}, monthly_data{2}{1})
title('Raton')
legend('Cumulative Sum','Teleseism', 'Monthly EQ Rate','Location','NorthWest')
datetick('x',2)
hold off

figure(5)
hold on 
yyaxis left
plot(or_dates{2}{2}, raton_data2)
plot(or_dates{2}{2}, raton_data2, 'ro')
yyaxis right
plot(monthly_data{2}{2}, monthly_data{2}{1})
title('Raton')
legend('Cumulative Sum','Teleseism','Monthly EQ Rate','Location', 'NorthWest')
datetick('x',2)
hold off

figure(6)
hold on 
yyaxis left
plot(or_dates{2}{3}, raton_data3)
plot(or_dates{2}{3}, raton_data3, 'ro')
yyaxis right
plot(monthly_data{2}{2}, monthly_data{2}{1})
title('Raton')
legend('Cumulative Sum','Teleseism','Monthly EQ Rate','Location','NorthWest')
datetick('x',2)
hold off

figure(7)
hold on 
yyaxis left
plot(or_dates{1}{1}, ok_data1)
plot(or_dates{1}{1}, ok_data1, 'ro')
yyaxis right
plot(yearly_data{1}{2}, yearly_data{1}{1})
title('Oklahoma')
legend('Yearly EQ Rate','Location','NorthWest')
datetick('x',2)
hold off

figure(8)
hold on 
yyaxis left
plot(or_dates{1}{2}, ok_data2)
plot(or_dates{1}{2}, ok_data2, 'ro')
yyaxis right
plot(yearly_data{1}{2}, yearly_data{1}{1})
title('Oklahoma')
legend('Cumulative Sum','Telseism','Yearly EQ Rate','Location','NorthWest')
datetick('x',2)
hold off

figure(9)
hold on 
yyaxis left
plot(or_dates{1}{3}, ok_data3)
plot(or_dates{1}{3}, ok_data3, 'ro')
yyaxis right
plot(yearly_data{1}{2}, yearly_data{1}{1})
title('Oklahoma')
legend('Cumulative Sum','Teleseism', 'Yearly EQ Rate','Location','NorthWest')
datetick('x',2)
hold off

figure(10)
hold on 
yyaxis left
plot(or_dates{2}{1}, raton_data1)
plot(or_dates{2}{1}, raton_data1, 'ro')
yyaxis right
plot(yearly_data{2}{2}, yearly_data{2}{1})
title('Raton')
legend('Cumulative Sum','Teleseism', 'Yearly EQ Rate','Location','NorthWest')
datetick('x',2)
hold off

figure(11)
hold on 
yyaxis left
plot(or_dates{2}{2}, raton_data2)
plot(or_dates{2}{2}, raton_data2, 'ro')
yyaxis right
plot(yearly_data{2}{2}, yearly_data{2}{1})
title('Raton')
legend('Cumulative Sum','Teleseism', 'Yearly EQ Rate','Location','NorthWest')
datetick('x',2)
hold off

figure(12)
hold on 
yyaxis left
plot(or_dates{2}{3}, raton_data3)
plot(or_dates{2}{3}, raton_data3, 'ro')
yyaxis right
plot(yearly_data{2}{2}, yearly_data{2}{1})
title('Raton')
legend('Cumulative Sum','Teleseism', 'Yearly EQ Rate','Location','NorthWest')
datetick('x',2)
hold off