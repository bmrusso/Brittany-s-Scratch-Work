% Plotting maps for Paradox

% ----------------------------------------------------------------------

clc, clear 

load zone_data.mat

deglimit = km2deg(500);

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1991, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

% Calculates the distance from an EQ to the center of the zone

disteq = distance(mean(zonecell{10}(:,2)), mean(zonecell{10}(:,1)), la, lo);

% Finding where the distance is greater than 500 km and removing it.

smallerdeg = find(disteq <= deglimit);

y = y(smallerdeg);
mo = mo(smallerdeg);
d = d(smallerdeg);
h = h(smallerdeg);
mi = mi(smallerdeg);
s = s(smallerdeg);
ma = ma(smallerdeg);
la = la(smallerdeg);
lo = lo(smallerdeg);

figure(1)
hold on
plot(long{10}, lat{10}, 'o', 'markerfacecolor', 'r', 'markeredgecolor', 'r')
plot(lo(1), la(1), 's', 'markerfacecolor', 'k', 'markeredgecolor', 'k')
title('Paradox - Mainshock 1')
legend('Triggered Data', 'Mainshock', 'location', 'northwest')
hold off

figure(2)
hold on
plot(long{10}, lat{10}, 'o', 'markerfacecolor', 'r', 'markeredgecolor', 'r')
plot(lo(2), la(2), 's', 'markerfacecolor', 'k', 'markeredgecolor', 'k')
title('Paradox - Mainshock 2')
legend('Triggered Data', 'Mainshock', 'location', 'northwest')
hold off

figure(3)
hold on
plot(long{10}, lat{10}, 'o', 'markerfacecolor', 'r', 'markeredgecolor', 'r')
plot(lo(3), la(3), 's', 'markerfacecolor', 'k', 'markeredgecolor', 'k')
title('Paradox - Mainshock 3')
legend('Triggered Data', 'Mainshock', 'location', 'northwest')
xlabel('Longitude')
ylabel('Latitude')
hold off

figure(4)
hold on
plot(long{10}, lat{10}, 'o', 'markerfacecolor', 'r', 'markeredgecolor', 'r')
plot(lo(4), la(4), 's', 'markerfacecolor', 'k', 'markeredgecolor', 'k')
title('Paradox - Mainshock 4')
legend('Triggered Data', 'Mainshock', 'location', 'northwest')
xlabel('Longitude')
ylabel('Latitude')
hold off

figure(5)
hold on
plot(long{10}, lat{10}, 'o', 'markerfacecolor', 'r', 'markeredgecolor', 'r')
plot(lo(5), la(5), 's', 'markerfacecolor', 'k', 'markeredgecolor', 'k')
title('Paradox - Mainshock 5')
legend('Triggered Data', 'Mainshock', 'location', 'northwest')
xlabel('Longitude')
ylabel('Latitude')
hold off

figure(6)
hold on
plot(long{10}, lat{10}, 'o', 'markerfacecolor', 'r', 'markeredgecolor', 'r')
plot(lo(6), la(6), 's', 'markerfacecolor', 'k', 'markeredgecolor', 'k')
title('Paradox- Mainshock 6')
legend('Triggered Data', 'Mainshock')
xlabel('Longitude')
ylabel('Latitude')
hold off

figure(7)
hold on
plot(long{10}, lat{10}, 'o', 'markerfacecolor', 'r', 'markeredgecolor', 'r')
plot(lo(7), la(7), 's', 'markerfacecolor', 'k', 'markeredgecolor', 'k')
title('Paradox - Mainshock 7')
legend('Triggered Data', 'Mainshock')
xlabel('Longitude')
ylabel('Latitude')
hold off
% ----------------------------------------------------------------------