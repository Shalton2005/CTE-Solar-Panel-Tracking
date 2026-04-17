# Validation

## Scope

This document defines minimum acceptance checks for simulation and control behavior.

## Functional Checks

1. Sun position continuity
- Azimuth progression should be smooth over daylight window.
- Elevation should rise after sunrise and fall after solar noon.

2. Panel command bounds
- Azimuth and elevation actuator commands must remain in [0, 180].

3. Tracking behavior
- Initial transient error is expected.
- Error should trend downward when sun movement is slow relative to control response.

4. Numerical stability
- No NaN or Inf values in stored arrays.

## Regression Signals

A change should be reviewed if:

- panel path visibly diverges from sun path
- actuator values saturate for prolonged periods unexpectedly
- simulation runtime increases significantly without explanation

## Suggested Metrics

- Mean absolute azimuth error (deg)
- Mean absolute elevation error (deg)
- Peak tracking error (deg)
- Settling time for initial transient
