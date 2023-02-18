function loadcase()
clc
clear
path = uigetdir('ECGI_SimData\data\','Select a Case File');
disp(path)
% extract case name
C = strsplit(path,'\');
name = string(C(9));
% create the directory that stores the csv files
mkdir('ECGI_SimData\export', name)

% file names
ecg_simulation_filename = 'ecgs\';
ecg_64_filename = 'BSM_(nijmegen_64).refECG';
lead_locations_filename = 'BSM_(nijmegen_64).elec';
ventricular_beats_filename = 'ventricular_beats';
atrial_beats_filename = 'atrial_beats';
beat_filename = '\beat1\user.source';

export_filename = '\export\';



% load in the ecg readings at each electrode, for 500 measurements
% columns: time, rows: electrodes
ecg_64 = loadmat(append(path,'\',ecg_simulation_filename,ecg_64_filename));
writematrix(ecg_64,append('ECGI_SimData',export_filename,name,'\ecg_64.csv'));
disp(ecg_64)

% load in the locations for each of the electrodes
lead_locations = loadmat(append(path,'\',ecg_simulation_filename,'\',lead_locations_filename));
writematrix(lead_locations,append('ECGI_SimData',export_filename,name,'\lead_locations.csv'));
disp(lead_locations)

% load in the geometry files of atria, ventricles and thorax

% TMP = transmembrane potential, electrical potential on heart
% atria
if exist(append(path,ventricular_beats_filename),'dir') 
    atrial_beats = loadmat(append(path,atrial_beats_filename,beat_filename));
    disp(atrial_beats)
end

% ventricles
if exist(append(path,atrial_beats_filename),'dir') 
    ventricular_beats = loadmat(append(path,ventricular_beats_filename,beat_filename))
    disp(ventricular_beats)
end


