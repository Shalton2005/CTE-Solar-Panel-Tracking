function sync_config_to_simulink(cfg, modelName)
%SYNC_CONFIG_TO_SIMULINK Pushes configuration values to Simulink workspace.

if nargin < 2 || isempty(modelName)
    modelName = 'solar_tracking_with_PIDcontrol';
end

if contains(modelName, '.slx')
    [~, modelName, ~] = fileparts(modelName);
end

assignin('base', 'trackerCfg', cfg);
assignin('base', 'simStepSec', cfg.simulation.stepSec);
assignin('base', 'simDurationSec', cfg.simulation.totalTimeSec);
assignin('base', 'latDeg', cfg.location.latitude);
assignin('base', 'lonDeg', cfg.location.longitude);
assignin('base', 'utcOffset', cfg.location.utcOffset);

assignin('base', 'pidAzKp', cfg.controller.kp.azimuth);
assignin('base', 'pidAzKi', cfg.controller.ki.azimuth);
assignin('base', 'pidAzKd', cfg.controller.kd.azimuth);
assignin('base', 'pidElKp', cfg.controller.kp.elevation);
assignin('base', 'pidElKi', cfg.controller.ki.elevation);
assignin('base', 'pidElKd', cfg.controller.kd.elevation);

if exist([modelName, '.slx'], 'file') ~= 2
    warning('Model file %s.slx not found in current MATLAB path.', modelName);
    return;
end

load_system(modelName);
set_param(modelName, 'StopTime', num2str(cfg.simulation.totalTimeSec));
set_param(modelName, 'FixedStep', num2str(cfg.simulation.stepSec));
end
