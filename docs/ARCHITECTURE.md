# Architecture

## System Overview

The repository follows a simulation-first architecture with clean separation between configuration, computation, analysis, and visualization.

1. Configuration Layer
- `src/default_config.m` contains all runtime parameters.

2. Computation Layer
- `SunPosition.m` computes sun azimuth and elevation at each simulation step.
- `src/simulate_tracker.m` updates panel state using a PID controller with anti-windup and rate limiting.
- `src/simulate_fixed_panel.m` provides a non-tracking baseline for comparison.

3. Analysis Layer
- `src/compute_tracking_metrics.m` computes MAE, RMSE, peak error, and settling time.
- `src/estimate_relative_gain.m` estimates relative alignment gain versus fixed baseline.
- `src/run_tracking_analysis.m` executes tracker and baseline simulations and builds a single report struct.
- `src/export_simulation_artifacts.m` exports MAT and CSV artifacts.

4. Visualization Layer
- `src/animate_tracker.m` renders sky path and panel angle evolution.

5. Orchestration Layer
- `scripts/run_analysis.m` runs non-visual analysis and exports artifacts.
- `scripts/run_simulation.m` runs analysis and then animation.
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
6. Optionally export MAT and CSV artifacts.
7. Render animation from tracking arrays.

## Extension Points

- Add motor dynamics constraints (rate, inertia, deadband).
- Integrate weather/irradiance models and energy conversion estimates.
- Add location/season batch scenarios and result aggregation.
