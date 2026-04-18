function results = simulate_tracker(cfg)
%SIMULATE_TRACKER Simulates dual-axis panel tracking against sun position.

validateattributes(cfg.simulation.stepSec, {'numeric'}, {'scalar', 'positive'});
validateattributes(cfg.simulation.totalTimeSec, {'numeric'}, {'scalar', 'positive'});

if cfg.simulation.stepSec > cfg.simulation.totalTimeSec
    error('simulation.stepSec cannot be greater than simulation.totalTimeSec.');
end

timeVec = 0:cfg.simulation.stepSec:cfg.simulation.totalTimeSec;
nSteps = numel(timeVec);
dt = cfg.simulation.stepSec;

azimuthArr = zeros(1, nSteps);
elevationArr = zeros(1, nSteps);
servoAzArr = zeros(1, nSteps);
servoElArr = zeros(1, nSteps);
ctrlAzArr = zeros(1, nSteps);
ctrlElArr = zeros(1, nSteps);

servoAz = cfg.controller.initialAzimuthDeg;
servoEl = cfg.controller.initialElevationDeg;

pidAz.integral = 0;
pidAz.prevError = 0;
pidEl.integral = 0;
pidEl.prevError = 0;

for k = 1:nSteps
    t = timeVec(k);

    [azimuth, elevation] = SunPosition(
        t,
        cfg.location.latitude,
        cfg.location.longitude,
        cfg.location.utcOffset
    );

    [servoAz, pidAz, ctrlAz] = pid_axis_step(
        servoAz,
        azimuth,
        pidAz,
        cfg.controller.kp.azimuth,
        cfg.controller.ki.azimuth,
        cfg.controller.kd.azimuth,
        dt,
        cfg
    );

    [servoEl, pidEl, ctrlEl] = pid_axis_step(
        servoEl,
        elevation,
        pidEl,
        cfg.controller.kp.elevation,
        cfg.controller.ki.elevation,
        cfg.controller.kd.elevation,
        dt,
        cfg
    );

    azimuthArr(k) = azimuth;
    elevationArr(k) = elevation;
    servoAzArr(k) = servoAz;
    servoElArr(k) = servoEl;
    ctrlAzArr(k) = ctrlAz;
    ctrlElArr(k) = ctrlEl;
end

results.timeSec = timeVec;
results.sunAzimuthDeg = azimuthArr;
results.sunElevationDeg = elevationArr;
results.panelAzimuthDeg = servoAzArr;
results.panelElevationDeg = servoElArr;
results.trackingErrorAzimuthDeg = azimuthArr - servoAzArr;
results.trackingErrorElevationDeg = elevationArr - servoElArr;
results.controllerOutputAzimuthDeg = ctrlAzArr;
results.controllerOutputElevationDeg = ctrlElArr;
results.controllerType = cfg.controller.type;
end

function [nextAngle, state, controllerOutput] = pid_axis_step(currentAngle, targetAngle, state, kp, ki, kd, dt, cfg)
errorValue = targetAngle - currentAngle;
proposedIntegral = state.integral + errorValue * dt;
derivativeValue = (errorValue - state.prevError) / dt;

controllerOutput = kp * errorValue + ki * proposedIntegral + kd * derivativeValue;
requestedAngle = currentAngle + controllerOutput;

boundedRequested = clamp_angle(
    requestedAngle,
    cfg.controller.angleMinDeg,
    cfg.controller.angleMaxDeg
);

maxStep = cfg.controller.maxRateDegPerSec * dt;
rateLimitedAngle = currentAngle + max(min(boundedRequested - currentAngle, maxStep), -maxStep);
nextAngle = clamp_angle(rateLimitedAngle, cfg.controller.angleMinDeg, cfg.controller.angleMaxDeg);

isSaturated = abs(nextAngle - requestedAngle) > 1e-9;
if cfg.controller.antiWindupEnabled && isSaturated
    state.integral = state.integral;
else
    state.integral = proposedIntegral;
end

state.prevError = errorValue;
end

function out = clamp_angle(value, minAngle, maxAngle)
out = min(max(value, minAngle), maxAngle);
end
