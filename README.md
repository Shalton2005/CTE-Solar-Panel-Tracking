# Dual-Axis Solar Tracker with PID Control (MATLAB/Simulink)

This repository contains a simulation-first implementation of a dual-axis solar panel tracking concept using motor actuation and control-loop logic. It combines MATLAB scripts for solar-position and tracking visualization with a Simulink model for control-oriented analysis.

## Why This Project

Static solar panels lose potential energy capture as sun position changes across the day. A dual-axis tracker can improve incident angle alignment and increase total energy yield. This project demonstrates that concept through:

- solar position modeling (azimuth and elevation)
- panel angle actuation behavior
- control-loop tracking mindset aligned with PID controller design
- end-to-end simulation workflow for reproducible analysis

## Repository Structure

- `solar_tracking_with_PIDcontrol.slx`: Simulink model for solar tracking control study
- `SunPosition.m`: solar azimuth/elevation computation function
- `sun_pos.m`: backward-compatible launcher for simulation demo
- `src/default_config.m`: central configuration parameters
- `src/simulate_tracker.m`: numerical simulation engine
- `src/animate_tracker.m`: visualization and animation loop
- `scripts/run_simulation.m`: standard project entry point
- `docs/ARCHITECTURE.md`: system architecture and data flow
- `docs/WORKFLOW.md`: development and validation workflow
- `docs/VALIDATION.md`: practical checks and acceptance criteria

## Quick Start

### Prerequisites

- MATLAB R2021a or later (recommended)
- Simulink (for `.slx` model)

### Run Script-Based Simulation

From MATLAB, set the current folder to repository root and run:

```matlab
run('scripts/run_simulation.m')
```

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
- Proportional tracking gain: 0.2

## Engineering Notes

- The script-level simulation uses a bounded proportional response to emulate motor movement and to keep panel commands in valid angle ranges.
- The architecture is intentionally modular so PID replacement/tuning can be introduced without changing plotting and orchestration code.
- Sun-position equations use declination, equation of time, and local solar time conversion.

## CI and Quality

A CI workflow is included under `.github/workflows/matlab-ci.yml` for automated checks in GitHub Actions with MATLAB support.

## Contributing

Please read `CONTRIBUTING.md` before creating pull requests.

## License

This project is released under the MIT License. See `LICENSE`.
