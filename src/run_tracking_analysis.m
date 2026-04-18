function analysis = run_tracking_analysis(cfg)
%RUN_TRACKING_ANALYSIS Runs tracker and baseline simulations with metrics.

trackerResults = simulate_tracker(cfg);
fixedResults = simulate_fixed_panel(cfg);

trackerMetrics = compute_tracking_metrics(trackerResults);
fixedMetrics = compute_tracking_metrics(fixedResults);
relativeGainPercent = estimate_relative_gain(trackerResults, fixedResults);

analysis.trackerResults = trackerResults;
analysis.fixedResults = fixedResults;
analysis.trackerMetrics = trackerMetrics;
analysis.fixedMetrics = fixedMetrics;
analysis.relativeGainPercent = relativeGainPercent;
analysis.generatedAt = datetime('now');
end
