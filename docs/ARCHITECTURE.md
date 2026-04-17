# Architecture

## System Overview

The repository follows a simulation-first architecture with clean separation between configuration, computation, and visualization.

1. Configuration Layer
- `src/default_config.m` contains all runtime parameters.

2. Computation Layer
- `SunPosition.m` computes sun azimuth and elevation at each simulation step.
- `src/simulate_tracker.m` updates panel state using control response and captures trace data.

3. Visualization Layer
- `src/animate_tracker.m` renders sky path and panel angle evolution.

4. Orchestration Layer
- `scripts/run_simulation.m` acts as the production entry point.
- `sun_pos.m` remains as a compatibility launcher.

## Data Flow

1. Load config struct from `default_config`.
2. Generate simulation timeline.
3. For each step:
- compute sun state from `SunPosition`
- update panel states using controller response
- record states and tracking error
4. Render animation from recorded arrays.

## Extension Points

- Replace proportional response in `simulate_tracker` with full PID logic.
- Add motor dynamics constraints (rate, inertia, deadband).
- Integrate weather/irradiance models and energy conversion estimates.
- Export data to CSV for post-processing and benchmark comparison.
