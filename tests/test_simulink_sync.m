function tests = test_simulink_sync
%TEST_SIMULINK_SYNC Verifies base-workspace synchronization for Simulink.

tests = functiontests(localfunctions);
end

function testBaseWorkspaceVariablesAssigned(tc)
cfg = default_config();
sync_config_to_simulink(cfg, 'non_existing_model_name');

latDeg = evalin('base', 'latDeg');
lonDeg = evalin('base', 'lonDeg');
pidAzKp = evalin('base', 'pidAzKp');

verifyEqual(tc, latDeg, cfg.location.latitude);
verifyEqual(tc, lonDeg, cfg.location.longitude);
verifyEqual(tc, pidAzKp, cfg.controller.kp.azimuth);
end
