% Calculating the PGV and PGA of the teleseisms. 

clc, clear

load OK_Corr_Data.mat
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
toteq = eq1 + eq2 + eq3;

% Determining the PGV
abseq = abs(toteq);
v = max(abseq);
PGV(i) = v*10000; 

% Differentiate the vector sum
dv = diff(toteq);
dvdt = dv./dt;

% Determining the PGA
a = max(dvdt);
PGA(i) = a*10000;

end



