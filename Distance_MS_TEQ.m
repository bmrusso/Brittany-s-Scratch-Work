% Code that calculates the distance for the mainshock to the triggered
% earthquake and determines the minimum distance to the closest earthquake
% in km. 

% ----------------------------------------------------------------------

clc, clear

load zone_data.mat

load mag5data.mat


allmin = [ ];

for zone=1:length(latcell)
    
    eqvec = [ ];
    
    for eqindex=1:length(latcell{zone})
        
        eqdist = distance(latcell{zone}(eqindex), loncell{zone}(eqindex), lat{zone}, long{zone});
        
        mineq = min(eqdist);
        
        eqvec = [eqvec; mineq];
        
    end
    
    allmin{zone} = eqvec;

end

km100 = km2deg(100);

for i=1:length(latcell)

    for x=1:length(allmin{i})
    
        if allmin{i}(x) >= km100

allmin{i}(x) = 0;

        else
            
            allmin{i}(x) = 1;
            
        end
    end
end


