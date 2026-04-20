# Simulink Integration

## Goal

Keep script-based and Simulink-based studies aligned through one configuration source.

## Parameter Sync

Use:

```matlab
run('scripts/sync_simulink_params.m')
```

This synchronizes key variables into MATLAB base workspace:

- location and timezone
- simulation duration and fixed step
- PID gains for azimuth/elevation loops

## Model Notes

- Default model name: `solar_tracking_with_PIDcontrol.slx`
- Model stop time and fixed-step are updated from config values.
- If model file is not found in path, script still pushes base-workspace values and returns a warning.

## Suggested Block Wiring

Map base variables in block parameters so updates flow automatically:

- PID blocks: `pidAzKp`, `pidAzKi`, `pidAzKd`, `pidElKp`, `pidElKi`, `pidElKd`
- Environment blocks: `latDeg`, `lonDeg`, `utcOffset`
- Solver timing: `simStepSec`, `simDurationSec`
