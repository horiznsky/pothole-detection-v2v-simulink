% Adds all required folders (models, inputs, Plant, VehicleConfig) to path
rootDir = fileparts(mfilename('fullpath'));
addpath(genpath(rootDir));

% Open the main Simulink model
open_system('PotholeDetection3D.slx');