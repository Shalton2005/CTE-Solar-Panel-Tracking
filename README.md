# Dual-Axis Solar Tracker with PID Control (MATLAB/Simulink)

This project demonstrates a production-style solar panel tracking concept using dual-axis motor motion with PID control. It combines a Simulink model with MATLAB scripts to compute sun position, simulate panel motion, and visualize tracking behavior through the day.

## Core Idea

- Model sun azimuth and elevation for a selected location
- Drive panel azimuth and elevation toward the sun using PID loops
- Respect practical actuator constraints (angle bounds and rate limits)
- Visualize tracking response to support design understanding

## Project Structure

- `solar_tracking_with_PIDcontrol.slx`: Simulink model
- `SunPosition.m`: solar position function
- `sun_pos.m`: legacy-compatible simulation launcher
- `scripts/run_simulation.m`: main simulation entry point
- `src/default_config.m`: tunable simulation and PID configuration
- `src/simulate_tracker.m`: core PID tracking simulation
- `src/animate_tracker.m`: visualization
- `docs/WORKFLOW.md`: concise run and tuning workflow

## Quick Start

### Prerequisites

- MATLAB R2021a or newer
- Simulink

### Run Main Simulation

```matlab
run('scripts/run_simulation.m')
```

### Run Legacy Entry Script

```matlab
run('sun_pos.m')
```

### Open Simulink Model

```matlab
open_system('solar_tracking_with_PIDcontrol.slx')
```

## Configuration

Edit parameters in `src/default_config.m`:

- location (`latitude`, `longitude`, `utcOffset`)
- simulation timing (`totalTimeSec`, `stepSec`)
- PID gains for both axes (`kp`, `ki`, `kd`)
- panel limits (`angleMinDeg`, `angleMaxDeg`, `maxRateDegPerSec`)

## License

Released under the MIT License. See `LICENSE`.
