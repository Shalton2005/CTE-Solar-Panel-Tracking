# Workflow

## Development Workflow

1. Create a feature branch.
2. Keep control, simulation, metrics, and docs changes in separate commits when possible.
3. Run non-visual analysis locally.
4. Run MATLAB tests.
5. Verify exported metrics and artifacts.
6. If visualization changed, run full simulation animation.
7. Open pull request with summary, assumptions, and screenshots.

## Recommended Branch Naming

- `feature/<short-topic>`
- `fix/<short-topic>`
- `docs/<short-topic>`

## Local Validation Checklist

- `scripts/run_analysis.m` runs without runtime errors.
- `tests/run_tests.m` passes.
- Sun path and panel path are physically sensible.
- Panel angles remain within limits.
- Tracker error metrics are better than fixed-panel baseline for normal daylight profile.
- Artifact files are generated in `outputs/latest` when export is enabled.
- Simulink model opens and compiles.

## Pull Request Checklist

- Small, focused change set
- Updated docs for behavior changes
- Validation evidence included
- No unrelated file formatting changes
