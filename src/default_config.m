function cfg = default_config()
%DEFAULT_CONFIG Returns default simulation and controller parameters.

cfg.location.name = 'Mangalore, India';
cfg.location.latitude = 12.91;
cfg.location.longitude = 74.85;
cfg.location.utcOffset = 5.5;

cfg.simulation.totalTimeSec = 24 * 3600;
cfg.simulation.stepSec = 600;

cfg.controller.type = 'pid';
cfg.controller.initialAzimuthDeg = 90;
cfg.controller.initialElevationDeg = 45;
cfg.controller.angleMinDeg = 0;
cfg.controller.angleMaxDeg = 180;
cfg.controller.maxRateDegPerSec = 0.35;

cfg.controller.kp.azimuth = 0.22;
cfg.controller.ki.azimuth = 0.00035;
cfg.controller.kd.azimuth = 0.08;

cfg.controller.kp.elevation = 0.24;
cfg.controller.ki.elevation = 0.00040;
cfg.controller.kd.elevation = 0.08;

cfg.controller.antiWindupEnabled = true;

cfg.visualization.pauseSec = 0.05;
cfg.visualization.figurePosition = [100 100 1000 650];
end
