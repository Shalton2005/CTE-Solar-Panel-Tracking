# Workflow

## Development Workflow

1. Create a feature branch.
2. Keep control, simulation, and visualization changes in separate commits.
3. Run MATLAB simulation locally.
4. Verify plots and tracking error trends.
5. Open pull request with summary, assumptions, and screenshots.

## Recommended Branch Naming

- `feature/<short-topic>`
- `fix/<short-topic>`
- `docs/<short-topic>`

## Local Validation Checklist

- `scripts/run_simulation.m` runs without runtime errors.
- Sun path and panel path are physically sensible.
- Panel angles remain within limits.
- Tracking error decreases after initial transient.
- Simulink model opens and compiles.

## Pull Request Checklist

- Small, focused change set
- Updated docs for behavior changes
- Validation evidence included
- No unrelated file formatting changes
