% Finds the max sample rate of each teleseism using data previously
% downloaded from the IRIS catalog.

% ----------------------------------------------------------------------

clc, clear

load zone_structures.mat

% Pre-allocating data
maxvector = zeros(length(alldata), 1);

% Determines the maximum sample rate in the data
for ii=1:length(alldata)
    
    matrix2 = [];
    matrix3 =[];
    
    for i=1:length(alldata{ii})
        
        strct = alldata{ii}{i};
        
        ratemat = cell2mat({strct.sampleRate});
        
        ratemax = max(ratemat);
        
        matrix2 = [matrix2,ratemax];
        matrix3 = [matrix3, ratemat];
        
        totmax = max(matrix2);
    end
    
    maxvector(ii) = totmax;
    
end


save('Max_SRATE.mat',  'maxvector', 'matrix3')

% ----------------------------------------------------------------------    