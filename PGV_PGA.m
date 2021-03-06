% Calculating the PGV and PGA of the teleseisms. 

% ----------------------------------------------------------------------

clc, clearvars -EXCEPT PGV_total PGA_total

load Youngs_Corr.mat
load MAX_SRATE.mat

% Pre-allocating memory

[rows, col] = size(corrseismograms);
PGV = zeros(rows/6, 1);
PGA = PGV;

% Time vector

t = 1:col;
dt = diff(t);

for i=1:rows/6
    
    eq1 = corrseismograms(i*6-5,:);
    eq2 = corrseismograms(i*6-4,:);
    eq3 = corrseismograms(i*6-3,:);
    
    % Vector Sum
    toteq = sqrt((eq1.^2) + (eq2.^2) + (eq3.^2));
    
    % Determining the PGV
    v = max(toteq);
    PGV(i) = v;
    
    % Differentiate 
    dv1 = diff(eq1);
    dv2 = diff(eq2);
    dv3 = diff(eq3);
    
    dv = sqrt((dv1.^2) + (dv2.^2) + (dv3.^2));

    dvdt = dv/(1/maxvector(1));
    
    % Determining the PGA
    a = max(dvdt);
    PGA(i) = a;
    
end

% -----------------------------------------------------------------------



