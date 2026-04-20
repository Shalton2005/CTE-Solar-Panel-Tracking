clear;
clc;

thisDir = fileparts(mfilename('fullpath'));
projectRoot = fileparts(thisDir);
addpath(fullfile(projectRoot, 'src'));

requiredFiles = {
    fullfile(projectRoot, 'SunPosition.m')
    fullfile(projectRoot, 'solar_tracking_with_PIDcontrol.slx')
    fullfile(projectRoot, 'src', 'run_tracking_analysis.m')
    fullfile(projectRoot, 'scripts', 'run_analysis.m')
    fullfile(projectRoot, 'scripts', 'run_scenarios.m')
};

for i = 1:numel(requiredFiles)
    if exist(requiredFiles{i}, 'file') ~= 2
        error('Missing required file: %s', requiredFiles{i});
    end
end

cfg = default_config();
analysis = run_tracking_analysis(cfg);
assert(isfield(analysis, 'relativeGainPercent'));

disp('QA preflight checks completed successfully.');
