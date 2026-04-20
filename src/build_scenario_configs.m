function scenarios = build_scenario_configs(baseCfg)
%BUILD_SCENARIO_CONFIGS Creates a set of benchmark-ready simulation scenarios.

if nargin < 1
    baseCfg = default_config();
end

scenarios = repmat(struct('name', '', 'cfg', baseCfg), 1, 4);

scenarios(1).name = 'coastal_reference';
scenarios(1).cfg = baseCfg;

cfg = baseCfg;
cfg.location.name = 'Bengaluru, India';
cfg.location.latitude = 12.97;
cfg.location.longitude = 77.59;
scenarios(2).name = 'inland_reference';
scenarios(2).cfg = cfg;

cfg = baseCfg;
cfg.simulation.stepSec = 300;
cfg.controller.maxRateDegPerSec = 0.5;
scenarios(3).name = 'fast_response';
scenarios(3).cfg = cfg;

cfg = baseCfg;
cfg.simulation.stepSec = 900;
cfg.controller.maxRateDegPerSec = 0.25;
scenarios(4).name = 'coarse_sampling';
scenarios(4).cfg = cfg;
end
