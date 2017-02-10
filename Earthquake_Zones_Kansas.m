% Pulling Earthquake Data from 2014 to Present with a Magnitude of Zero or
% higher and then sorting into bounds. 

% Pulling Earthquake Data

% [y, m, d, ~, ~, ~, lat, long, ~, ~, ~]= LoadComCat(datenum(2014, 1,1), ...
%     datenum(2017, 1, 4), 0, [36.95 37.35 -98.1 -97.5]);

% In the Polygon

shap = shaperead('Areas_of_Seismic_Concern.shp');

for i=1:5
    IN = inpolygon(lat,long, shap(i).Y, shap(i).X);
    zone{i} = find(IN ==1);
end

zones = [zone{1}, zone{2}, zone{3}, zone{4}, zone{5}];

nozone = setdiff(1:length(lat),zones);