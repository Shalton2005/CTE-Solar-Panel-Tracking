function results = simulate_fixed_panel(cfg)
%SIMULATE_FIXED_PANEL Simulates a non-tracking panel as baseline.

timeVec = 0:cfg.simulation.stepSec:cfg.simulation.totalTimeSec;
nSteps = numel(timeVec);

sunAzimuth = zeros(1, nSteps);
sunElevation = zeros(1, nSteps);

panelAzimuth = ones(1, nSteps) * cfg.baseline.fixedPanelAzimuthDeg;
panelElevation = ones(1, nSteps) * cfg.baseline.fixedPanelElevationDeg;

for k = 1:nSteps
    [sunAzimuth(k), sunElevation(k)] = SunPosition(
        timeVec(k),
        cfg.location.latitude,
        cfg.location.longitude,
        cfg.location.utcOffset
    );
end

results.timeSec = timeVec;
results.sunAzimuthDeg = sunAzimuth;
results.sunElevationDeg = sunElevation;
results.panelAzimuthDeg = panelAzimuth;
results.panelElevationDeg = panelElevation;
results.trackingErrorAzimuthDeg = sunAzimuth - panelAzimuth;
results.trackingErrorElevationDeg = sunElevation - panelElevation;
results.controllerType = 'fixed';
end
