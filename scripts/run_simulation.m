clear;
clc;

thisDir = fileparts(mfilename('fullpath'));
projectRoot = fileparts(thisDir);
addpath(fullfile(projectRoot, 'src'));

cfg = default_config();
results = simulate_tracker(cfg);
animate_tracker(results, cfg);
