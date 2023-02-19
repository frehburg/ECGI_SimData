function loadcase(path)
clc
clear
%path = uigetdir('ECGI_SimData\raw_data\','Select a Case File');
disp(path)
% extract case name
C = strsplit(path,'\');
name = string(C(9));
% create the directory that stores the csv files
mkdir('ECGI_SimData\data', name)

% file names
ecg_simulation_filename = 'ecgs\';
model_file_name = 'model\';
ecg_64_filename = 'BSM_(nijmegen_64).refECG';
lead_locations_filename = 'BSM_(nijmegen_64).elec';
ventricular_beats_filename = 'ventricular_beats';
atrial_beats_filename = 'atrial_beats';
beat_filename = '\beat1\user.source';

export_filename = '\data\';



% load in the ecg readings at each electrode, for 500 measurements
% columns: time, rows: electrodes
ecg_64 = loadmat(append(path,'\',ecg_simulation_filename,ecg_64_filename));
writematrix(ecg_64,append('ECGI_SimData',export_filename,name,'\ecg_64.csv'));

% load in the locations for each of the electrodes
lead_locations = loadmat(append(path,'\',ecg_simulation_filename,'\',lead_locations_filename));
writematrix(lead_locations,append('ECGI_SimData',export_filename,name,'\lead_locations.csv'));

% load in the geometry files of atria, ventricles and thorax
%thorax
[thorax_vertices, thorax_triangles] = loadtri(append(path,'\',model_file_name,'\thorax.tri'));
writematrix(thorax_vertices,append('ECGI_SimData',export_filename,name,'\thorax_vertices.csv'));
writematrix(thorax_triangles,append('ECGI_SimData',export_filename,name,'\thorax_triangles.csv'));
%right blood cavity
[rcav_vertices, rcav_triangles] = loadtri(append(path,'\',model_file_name,'\rcav.tri'));
writematrix(rcav_vertices,append('ECGI_SimData',export_filename,name,'\rcav_vertices.csv'));
writematrix(rcav_triangles,append('ECGI_SimData',export_filename,name,'\rcav_triangles.csv'));
%left blood cavity
[lcav_vertices, lcav_triangles] = loadtri(append(path,'\',model_file_name,'\lcav.tri'));
writematrix(lcav_vertices,append('ECGI_SimData',export_filename,name,'\lcav_vertices.csv'));
writematrix(lcav_triangles,append('ECGI_SimData',export_filename,name,'\lcav_triangles.csv'));

% TMP = transmembrane potential, electrical potential on heart
% atria
if exist(append(path,'\',ventricular_beats_filename),'dir') 
    atrial_beats = loadmat(append(path,'\',atrial_beats_filename,beat_filename));
    writematrix(atrial_beats,append('ECGI_SimData',export_filename,name,'\atrial_beats.csv'));
end

% ventricles
if exist(append(path,'\',atrial_beats_filename),'dir') 
    ventricular_beats = loadmat(append(path,'\',ventricular_beats_filename,beat_filename));
    writematrix(ventricular_beats,append('ECGI_SimData',export_filename,name,'\ventricular_beats.csv'));
end

% what is blood cavity?

