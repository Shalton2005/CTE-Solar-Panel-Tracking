clear;
clc;

thisDir = fileparts(mfilename('fullpath'));
projectRoot = fileparts(thisDir);
addpath(fullfile(projectRoot, 'src'));

cfg = default_config();
sync_config_to_simulink(cfg, 'solar_tracking_with_PIDcontrol');

disp('Simulink parameters synchronized to base workspace.');
