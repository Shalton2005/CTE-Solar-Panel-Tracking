function tests = test_tracking_analysis
%TEST_TRACKING_ANALYSIS Functional tests for analysis pipeline.

tests = functiontests(localfunctions);
end

function testTrackerOutputsWithinBounds(tc)
cfg = default_config();
analysis = run_tracking_analysis(cfg);

verifyTrue(tc, all(analysis.trackerResults.panelAzimuthDeg >= cfg.controller.angleMinDeg));
verifyTrue(tc, all(analysis.trackerResults.panelAzimuthDeg <= cfg.controller.angleMaxDeg));
verifyTrue(tc, all(analysis.trackerResults.panelElevationDeg >= cfg.controller.angleMinDeg));
verifyTrue(tc, all(analysis.trackerResults.panelElevationDeg <= cfg.controller.angleMaxDeg));
end

function testMetricFieldsExist(tc)
cfg = default_config();
analysis = run_tracking_analysis(cfg);

requiredFields = {
    'meanAbsErrorAzimuthDeg',
    'meanAbsErrorElevationDeg',
    'rmseAzimuthDeg',
    'rmseElevationDeg',
    'peakAbsErrorAzimuthDeg',
    'peakAbsErrorElevationDeg',
    'settlingTimeAzimuthSec',
    'settlingTimeElevationSec'
};

for i = 1:numel(requiredFields)
    verifyTrue(tc, isfield(analysis.trackerMetrics, requiredFields{i}), ['Missing field: ', requiredFields{i}]);
end
end

function testRelativeGainIsFiniteOrNaN(tc)
cfg = default_config();
analysis = run_tracking_analysis(cfg);

value = analysis.relativeGainPercent;
verifyTrue(tc, isnumeric(value) && isscalar(value));
verifyTrue(tc, isfinite(value) || isnan(value));
end
