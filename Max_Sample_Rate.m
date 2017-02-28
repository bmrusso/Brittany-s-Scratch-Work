clc, clear

load zone_structures.mat

maxvector = zeros(length(alldata), 1);

for ii=1:length(alldata)
    
    matrix2 = [];
    matrix3 =[];
    
    for i=1:length(alldata{ii})
        
        ratemat = cell2mat({dta.sampleRate});
        
        ratemax = max(ratemat);
        
        matrix2 = [matrix2,ratemax];
        matrix3 = [matrix3, ratemat];
        
        totmax = max(matrix2);
    end
    
    maxvector(ii) = totmax;
    
end


save('Max_SRATE.mat',  'maxvector', 'matrix3')

    