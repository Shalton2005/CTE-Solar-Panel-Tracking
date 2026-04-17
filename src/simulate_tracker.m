function results = simulate_tracker(cfg)
%SIMULATE_TRACKER Simulates dual-axis panel tracking against sun position.

validateattributes(cfg.simulation.stepSec, {'numeric'}, {'scalar', 'positive'});
validateattributes(cfg.simulation.totalTimeSec, {'numeric'}, {'scalar', 'positive'});

if cfg.simulation.stepSec > cfg.simulation.totalTimeSec
    error('simulation.stepSec cannot be greater than simulation.totalTimeSec.');
end

timeVec = 0:cfg.simulation.stepSec:cfg.simulation.totalTimeSec;
nSteps = numel(timeVec);

azimuthArr = zeros(1, nSteps);
elevationArr = zeros(1, nSteps);
servoAzArr = zeros(1, nSteps);
servoElArr = zeros(1, nSteps);

servoAz = cfg.tracker.initialAzimuthDeg;
servoEl = cfg.tracker.initialElevationDeg;

for k = 1:nSteps
    t = timeVec(k);

    [azimuth, elevation] = SunPosition(
        t,
        cfg.location.latitude,
        cfg.location.longitude,
        cfg.location.utcOffset
    );

    servoAz = clamp_angle(servoAz + cfg.tracker.proportionalGain * (azimuth - servoAz));
    servoEl = clamp_angle(servoEl + cfg.tracker.proportionalGain * (elevation - servoEl));

    azimuthArr(k) = azimuth;
    elevationArr(k) = elevation;
    servoAzArr(k) = servoAz;
    servoElArr(k) = servoEl;
end

results.timeSec = timeVec;
results.sunAzimuthDeg = azimuthArr;
results.sunElevationDeg = elevationArr;
results.panelAzimuthDeg = servoAzArr;
results.panelElevationDeg = servoElArr;
results.trackingErrorAzimuthDeg = azimuthArr - servoAzArr;
results.trackingErrorElevationDeg = elevationArr - servoElArr;
end

function out = clamp_angle(value)
out = min(max(value, 0), 180);
end
