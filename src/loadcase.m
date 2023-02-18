function [ecg_64,lead_locations,atrial_beats,ventricular_beats] = loadcase()
clc
clear
path = uigetdir('ECGI_SimData\data\','Select a Case File');
disp(path)
% file names

ecg_simulation_filename = 'ecgs\';
ecg_64_filename = 'BSM_(nijmegen_64).refECG';
lead_locations_filename = 'BSM_(nijmegen_64).elec';
ventricular_beats_filename = 'ventricular_beats';
atrial_beats_filename = 'atrial_beats';
beat_filename = '\beat1\user.source';



% load in the ecg readings at each electrode, for 500 measurements
% columns: time, rows: electrodes
ecg_64 = loadmat(append(path,'\',ecg_simulation_filename,ecg_64_filename));
disp(ecg_64)

% load in the locations for each of the electrodes
lead_locations = loadmat(append(path,'\',ecg_simulation_filename,'\',lead_locations_filename));
disp(lead_locations)

% load in the geometry files of atria, ventricles and thorax

% TMP = transmembrane potential
% atria
atria_available = false;
if exist(append(path,ventricular_beats_filename),'dir') 
    atria_available = true;
    atrial_beats = loadmat(append(path,atrial_beats_filename,beat_filename));
    disp(atrial_beats)
end

% ventricles
ventricles_available = false;
if exist(append(path,atrial_beats_filename),'dir') 
    ventricles_available = true;
    ventricular_beats = loadmat(append(path,ventricular_beats_filename,beat_filename))
    disp(ventricular_beats)
end
%how do i load atria??


