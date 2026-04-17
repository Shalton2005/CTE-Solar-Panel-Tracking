% Legacy-compatible entry point for the dual-axis tracker simulation.
% Prefer running scripts/run_simulation.m for the production workflow.
clear;
clc;

addpath(fullfile(fileparts(mfilename('fullpath')), 'src'));

cfg = default_config();
results = simulate_tracker(cfg);
animate_tracker(results, cfg);
