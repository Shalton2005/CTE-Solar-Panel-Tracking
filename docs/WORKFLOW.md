# Workflow

## Run Sequence

1. Open the project root folder in MATLAB.
2. Run:

```matlab
run('scripts/run_simulation.m')
```

3. Observe sky-path and panel tracking response in the animation.

## PID Tuning Sequence

1. Edit gains in `src/default_config.m`.
2. Re-run `scripts/run_simulation.m`.
3. Compare overshoot, settling behavior, and tracking smoothness.

## Simulink Sequence

1. Open model:

```matlab
open_system('solar_tracking_with_PIDcontrol.slx')
```

2. Keep solver and controller settings aligned with `src/default_config.m` for consistent behavior.

## Basic Validation Checklist

- simulation starts without runtime errors
- panel motion remains within configured angle limits
- panel tracks sun movement directionally across the day
- no unstable oscillation with default gains
