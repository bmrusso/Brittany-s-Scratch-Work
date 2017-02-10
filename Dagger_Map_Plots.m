% Plotting maps for Dagger

% ----------------------------------------------------------------------

clc, clear 

load zone_data.mat

deglimit = km2deg(500);

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1998, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

% Calculates the distance from an EQ to the center of the zone

disteq = distance(mean(zonecell{3}(:,2)), mean(zonecell{3}(:,1)), la, lo);

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
plot(long{3}, lat{3}, 'o', 'markerfacecolor', 'r')
plot(lo(1), la(1), 's', 'markerfacecolor', 'b')
title('Dagger - Mainshock 1')
legend('Triggered Data', 'Mainshock')
xlabel('Longitude')
ylabel('Latitude')
hold off

figure(2)
hold on
plot(long{3}, lat{3}, 'o', 'markerfacecolor', 'r')
plot(lo(2), la(2), 's', 'markerfacecolor', 'b')
title('Dagger - Mainshock 2')
legend('Triggered Data', 'Mainshock', 'location', 'northwest')
xlabel('Longitude')
ylabel('Latitude')
hold off

% ----------------------------------------------------------------------