# Dual-Axis Solar Tracker with PID Control (MATLAB/Simulink)

This repository contains a simulation-first implementation of a dual-axis solar panel tracking concept using motor actuation and control-loop logic. It combines MATLAB scripts for solar-position and tracking visualization with a Simulink model for control-oriented analysis.

## Why This Project

Static solar panels lose potential energy capture as sun position changes across the day. A dual-axis tracker can improve incident angle alignment and increase total energy yield. This project demonstrates that concept through:

- solar position modeling (azimuth and elevation)
- dual-axis PID panel control with anti-windup and actuator rate limiting
- fixed-panel baseline comparison for measurable tracking value
- end-to-end simulation workflow for reproducible analysis and exportable artifacts

## Repository Structure

- `solar_tracking_with_PIDcontrol.slx`: Simulink model for solar tracking control study
- `SunPosition.m`: solar azimuth/elevation computation function
- `sun_pos.m`: backward-compatible launcher for simulation demo
- `src/default_config.m`: central configuration parameters
- `src/simulate_tracker.m`: PID-based tracking simulation engine
- `src/simulate_fixed_panel.m`: fixed-panel baseline simulation
- `src/compute_tracking_metrics.m`: MAE, RMSE, peak error, and settling metrics
- `src/run_tracking_analysis.m`: tracker and baseline orchestration
- `src/export_simulation_artifacts.m`: MAT/CSV export for results
- `src/animate_tracker.m`: visualization and animation loop
- `scripts/run_simulation.m`: standard project entry point (analysis + animation)
- `scripts/run_analysis.m`: non-visual analysis and export entry point
- `tests/`: MATLAB test suite for regression checks
- `docs/ARCHITECTURE.md`: system architecture and data flow
- `docs/WORKFLOW.md`: development and validation workflow
- `docs/VALIDATION.md`: practical checks and acceptance criteria

## Quick Start

### Prerequisites

- MATLAB R2021a or later (recommended)
- Simulink (for `.slx` model)

### Run Simulation with Visualization

From MATLAB, set the current folder to repository root and run:

```matlab
run('scripts/run_simulation.m')
```

### Run Analysis and Export Pipeline

```matlab
run('scripts/run_analysis.m')
```

Generated artifacts are written to `outputs/latest/`.

### Run Legacy Entry Point

```matlab
run('sun_pos.m')
```

### Open Simulink Model

```matlab
open_system('solar_tracking_with_PIDcontrol.slx')
```

## Default Configuration

Defaults are defined in `src/default_config.m`.

- Location: Mangalore, India
- Time step: 600 seconds
- Duration: 24 hours
- Initial panel angles: 90 deg azimuth, 45 deg elevation
- PID gain sets for azimuth and elevation axes
- Actuator angle and rate limits
- Fixed-panel baseline settings

## Engineering Notes

- The script-level simulation uses a bounded PID response with optional anti-windup and actuator rate limiting.
- The analysis pipeline compares tracker results against a fixed-panel baseline and estimates a relative alignment gain percentage.
- Sun-position equations use declination, equation of time, and local solar time conversion.

## Testing

Run MATLAB tests:

```matlab
run('tests/run_tests.m')
```

## CI and Quality

A CI workflow is included under `.github/workflows/matlab-ci.yml` for automated analysis and test checks in GitHub Actions with MATLAB support.

## Contributing

Please read `CONTRIBUTING.md` before creating pull requests.

## License

This project is released under the MIT License. See `LICENSE`.
