% Plotting maps for Brewton 

% ----------------------------------------------------------------------

clc, clear 

load zone_data.mat

deglimit = km2deg(500);

[y,mo,d,h,mi,s,la,lo,~,ma] = LoadComCat(datenum(1997, 1, 1), ...
    datenum(2017, 1, 1), 5, [25 45 -125 -70]);

% Calculates the distance from an EQ to the center of the zone

disteq = distance(mean(zonecell{1}(:,2)), mean(zonecell{1}(:,1)), la, lo);

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

hold on
plot(long{1}, lat{1}, 'o', 'markerfacecolor', 'r')
plot(lo, la, 's', 'markerfacecolor', 'k')
title('Brewton')
legend('Triggered Data', 'Mainshock', 'location', 'northwest')
xlabel('Longitude')
ylabel('Latitude')
hold off

% ----------------------------------------------------------------------
