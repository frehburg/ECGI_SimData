function path = loadcase()
path = uigetdir('ECGI_SimData\data\','Select a Case File');
disp(path)
% load in the ecg readings at each electrode
ecg_64 = loadmat(append(path,'\ecgs\BSM_(nijmegen_64).refECG'));
disp(ecg_64)

