function tests = test_scenario_batch
%TEST_SCENARIO_BATCH Functional tests for scenario sweep flow.

tests = functiontests(localfunctions);
end

function testScenarioDefinitions(tc)
scenarios = build_scenario_configs(default_config());
verifyGreaterThanOrEqual(tc, numel(scenarios), 3);

names = string({scenarios.name});
verifyEqual(tc, numel(unique(names)), numel(names));
end

function testScenarioBatchSummary(tc)
scenarios = build_scenario_configs(default_config());
batch = run_scenario_batch(scenarios);

verifyEqual(tc, batch.scenarioCount, numel(scenarios));
verifyTrue(tc, istable(batch.summaryTable));
verifyTrue(tc, any(strcmp('Scenario', batch.summaryTable.Properties.VariableNames)));
verifyTrue(tc, any(strcmp('RelativeGainPercent', batch.summaryTable.Properties.VariableNames)));
end
