function export_simulation_artifacts(analysis, cfg, projectRoot)
%EXPORT_SIMULATION_ARTIFACTS Exports analysis outputs to MAT and CSV files.

if nargin < 3
    projectRoot = pwd;
end

outputDir = fullfile(projectRoot, cfg.analysis.outputDir);
if ~exist(outputDir, 'dir')
    mkdir(outputDir);
end

save(fullfile(outputDir, cfg.analysis.exportMatFile), 'analysis', 'cfg');

summary = [
    addvars(analysis.trackerMetrics.table, "tracker", 'Before', 1, 'NewVariableNames', 'Mode')
    addvars(analysis.fixedMetrics.table, "fixed", 'Before', 1, 'NewVariableNames', 'Mode')
];
summary.RelativeGainPercent = [analysis.relativeGainPercent; NaN];

writetable(summary, fullfile(outputDir, cfg.analysis.exportCsvFile));

disp(['Artifacts exported to: ', outputDir]);
end
