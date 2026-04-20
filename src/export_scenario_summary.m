function export_scenario_summary(batch, cfg, projectRoot)
%EXPORT_SCENARIO_SUMMARY Writes scenario batch summary artifacts to disk.

if nargin < 3
    projectRoot = pwd;
end

outputDir = fullfile(projectRoot, cfg.analysis.outputDir);
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

writetable(batch.summaryTable, fullfile(outputDir, 'scenario_summary.csv'));
save(fullfile(outputDir, 'scenario_batch.mat'), 'batch');

disp(['Scenario summary exported to: ', outputDir]);
end
