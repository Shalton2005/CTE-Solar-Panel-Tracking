function batch = run_scenario_batch(scenarios)
%RUN_SCENARIO_BATCH Executes analysis across scenario configurations.

if nargin < 1
    scenarios = build_scenario_configs(default_config());
end

n = numel(scenarios);
entries = repmat(struct('name', '', 'analysis', []), 1, n);
summaryRows = table();

for i = 1:n
    analysis = run_tracking_analysis(scenarios(i).cfg);
    entries(i).name = scenarios(i).name;
    entries(i).analysis = analysis;

    row = analysis.trackerMetrics.table;
    row.Mode = repmat("tracker", height(row), 1);
    row.Scenario = repmat(string(scenarios(i).name), height(row), 1);
    row.RelativeGainPercent = repmat(analysis.relativeGainPercent, height(row), 1);

    summaryRows = [summaryRows; row]; %#ok<AGROW>
end

batch.generatedAt = datetime('now');
batch.scenarioCount = n;
batch.entries = entries;
batch.summaryTable = movevars(summaryRows, {'Scenario', 'Mode'}, 'Before', 1);
end
