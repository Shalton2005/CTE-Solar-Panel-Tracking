function cfg = default_config()
%DEFAULT_CONFIG Returns default simulation and controller parameters.

cfg.location.name = 'Mangalore, India';
cfg.location.latitude = 12.91;
cfg.location.longitude = 74.85;
cfg.location.utcOffset = 5.5;

cfg.simulation.totalTimeSec = 24 * 3600;
cfg.simulation.stepSec = 600;

cfg.tracker.initialAzimuthDeg = 90;
cfg.tracker.initialElevationDeg = 45;
cfg.tracker.proportionalGain = 0.2;

cfg.visualization.pauseSec = 0.05;
cfg.visualization.figurePosition = [100 100 1000 650];
end
