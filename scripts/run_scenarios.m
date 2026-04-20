clear;
clc;

thisDir = fileparts(mfilename('fullpath'));
projectRoot = fileparts(thisDir);
addpath(fullfile(projectRoot, 'src'));

cfg = default_config();
scenarios = build_scenario_configs(cfg);
batch = run_scenario_batch(scenarios);

disp(batch.summaryTable);

if cfg.analysis.exportEnabled
    export_scenario_summary(batch, cfg, projectRoot);
end
