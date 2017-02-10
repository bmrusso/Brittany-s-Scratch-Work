% Does Something IDK yet

% -----------------------------------------------------------------------

clc, clear

%% For Mainshock 1 - Nov. 6, 2011


load zone_data.mat

longpolygon1 = [-96.8913, -96.8075,-96.7310,-96.6546,-96.6842,-96.7187,...
    -96.7705,-96.8198,-96.8913,-96.9357,-96.8987,-96.8716];

latpolygon1 = [35.4224,35.4399,35.4863,35.5212,35.5851,35.6025,35.5880,...
    35.5648,35.5241,35.4544,35.4195,35.4195];

nearms = inpolygon(lat{9}, long{9}, latpolygon1, longpolygon1);

aftershock1 = find(nearms == 1);

lat{9}(aftershock1) = [ ];
long{9}(aftershock1) = [ ];
year{9}(aftershock1) = [ ];
month{9}(aftershock1) = [ ];
day{9}(aftershock1) = [ ];
hour{9}(aftershock1) = [ ];
mnte{9}(aftershock1) = [ ];
sec{9}(aftershock1) = [ ];
magn{9}(aftershock1) = [ ];


%% For Mainshock 2 - Feb. 13, 2016


longpolygon2 = [-98.7934,-98.7824,-98.7464,-98.6623,-98.6612,-98.6926,...
    -98.7226,-98.7691,-98.7949,-98.7832];

latpolygon2 = [36.4418,36.4251,36.4369,36.5110,36.5459,36.5488,36.5316,...
    36.4909,36.4408,36.4295];

nearms2 = inpolygon(lat{9}, long{9}, latpolygon2, longpolygon2);

aftershock2 = find(nearms2 == 1);

lat{9}(aftershock2) = [ ];
long{9}(aftershock2) = [ ];
year{9}(aftershock2) = [ ];
month{9}(aftershock2) = [ ];
day{9}(aftershock2) = [ ];
hour{9}(aftershock2) = [ ];
mnte{9}(aftershock2) = [ ];
sec{9}(aftershock2) = [ ];
magn{9}(aftershock2) = [ ];



%% For Mainshock 3 - Sept. 9, 2016


longpolygon3 = [-96.9642,-96.9625,-96.8356,-96.8364,-96.9559];
latpolygon3 = [36.4712,36.3623,36.3583,36.4712,36.4692];

nearms3 = inpolygon(lat{9}, long{9}, latpolygon3, longpolygon3);

aftershock3 = find(nearms3 == 1);

lat{9}(aftershock3) = [ ];
long{9}(aftershock3) = [ ];
year{9}(aftershock3) = [ ];
month{9}(aftershock3) = [ ];
day{9}(aftershock3) = [ ];
hour{9}(aftershock3) = [ ];
mnte{9}(aftershock3) = [ ];
sec{9}(aftershock3) = [ ];
magn{9}(aftershock3) = [ ];


%% For Mainshock 4 - Nov. 7, 2016


longpolygon4 = [-96.8292,-96.7575,-96.7603,-96.8292,-96.8298];
latpolygon4 = [35.9633,35.9701,36.0187,36.0154,35.9590];

nearms4 = inpolygon(lat{9}, long{9}, latpolygon4, longpolygon4);

aftershock4 = find(nearms4 == 4);

lat{9}(aftershock4) = [ ];
long{9}(aftershock4) = [ ];
year{9}(aftershock4) = [ ];
month{9}(aftershock4) = [ ];
day{9}(aftershock4) = [ ];
hour{9}(aftershock4) = [ ];
mnte{9}(aftershock4) = [ ];
sec{9}(aftershock4) = [ ];
magn{9}(aftershock4) = [ ];
    

% ----------------------------------------------------------------------
    
    
    