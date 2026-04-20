# Architecture

## System Overview

The repository follows a simulation-first architecture with clean separation between configuration, computation, analysis, integration, and release validation.

1. Configuration Layer
- `src/default_config.m` contains all runtime parameters.
- `src/build_scenario_configs.m` builds standardized benchmark scenarios.

2. Computation Layer
- `SunPosition.m` computes sun azimuth and elevation at each simulation step.
- `src/simulate_tracker.m` updates panel state using a PID controller with anti-windup and rate limiting.
- `src/simulate_fixed_panel.m` provides a non-tracking baseline for comparison.

3. Analysis Layer
- `src/compute_tracking_metrics.m` computes MAE, RMSE, peak error, and settling time.
- `src/estimate_relative_gain.m` estimates relative alignment gain versus fixed baseline.
- `src/run_tracking_analysis.m` executes tracker and baseline simulations and builds a single report struct.
- `src/run_scenario_batch.m` executes analysis across scenario catalogs.
- `src/export_simulation_artifacts.m` and `src/export_scenario_summary.m` export MAT/CSV artifacts.

4. Integration Layer
- `src/sync_config_to_simulink.m` synchronizes config values into Simulink-facing workspace variables.

5. Visualization Layer
- `src/animate_tracker.m` renders sky path and panel angle evolution.

6. Orchestration Layer
- `scripts/run_analysis.m` runs non-visual analysis and exports artifacts.
- `scripts/run_scenarios.m` runs scenario sweeps and exports scenario summary.
- `scripts/run_simulation.m` runs analysis and then animation.
- `scripts/sync_simulink_params.m` prepares Simulink with config values.
- `scripts/qa_preflight.m` executes lightweight release-oriented checks.
- `sun_pos.m` remains as a compatibility launcher.

## Data Flow

1. Load config struct from `default_config`.
2. Generate simulation timeline.
3. For each step:
- compute sun state from `SunPosition`
- update panel states using PID controller response
- record states, tracking error, and controller outputs
4. Run fixed-panel baseline simulation.
5. Compute metrics and relative alignment gain.
6. Optionally run scenario sweeps for location/sampling comparisons.
7. Optionally export MAT and CSV artifacts.
8. Optionally synchronize parameters for Simulink execution.
9. Render animation from tracking arrays.

## Extension Points

- Add motor dynamics constraints (inertia, backlash, deadband).
- Integrate weather/irradiance models and energy conversion estimates.
- Add location/season batch scenarios and aggregate ranking dashboards.
- Add hardware-in-the-loop interfaces for actuator and sensor profiles.
