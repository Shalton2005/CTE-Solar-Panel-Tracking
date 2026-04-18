clear;
clc;

thisDir = fileparts(mfilename('fullpath'));
projectRoot = fileparts(thisDir);
addpath(fullfile(projectRoot, 'src'));

cfg = default_config();
analysis = run_tracking_analysis(cfg);

disp('Tracker performance metrics:');
disp(analysis.trackerMetrics.table);

disp('Fixed panel baseline metrics:');
disp(analysis.fixedMetrics.table);

disp('Estimated relative gain (%):');
disp(analysis.relativeGainPercent);

if cfg.analysis.exportEnabled
    export_simulation_artifacts(analysis, cfg, projectRoot);
end
