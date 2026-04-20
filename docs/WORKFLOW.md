# Workflow

## Development Workflow

1. Create a feature branch.
2. Keep control, simulation, metrics, and docs changes in separate commits when possible.
3. Run non-visual analysis locally.
4. Run MATLAB tests.
5. Run scenario sweep for comparative behavior.
6. Verify exported metrics and artifacts.
7. If visualization changed, run full simulation animation.
8. Run preflight QA script before release-oriented tags.
9. Open pull request with summary, assumptions, and screenshots.

## Recommended Branch Naming

- `feature/<short-topic>`
- `fix/<short-topic>`
- `docs/<short-topic>`

## Local Validation Checklist

- `scripts/run_analysis.m` runs without runtime errors.
- `scripts/run_scenarios.m` runs without runtime errors.
- `scripts/qa_preflight.m` passes.
- `tests/run_tests.m` passes.
- Sun path and panel path are physically sensible.
- Panel angles remain within limits.
- Tracker error metrics are better than fixed-panel baseline for normal daylight profile.
- Artifact files are generated in `outputs/latest` when export is enabled.
- Simulink model opens and compiles.
- Simulink sync script updates expected base workspace variables.

## Pull Request Checklist

- Small, focused change set
- Updated docs for behavior changes
- Validation evidence included
- No unrelated file formatting changes

## Release Workflow

1. Run local checks in the validation checklist.
2. Push changes and ensure `MATLAB CI` workflow passes.
3. Trigger `Release Gate` workflow or push a `v*` tag.
4. Confirm release checklist completion in `docs/RELEASE_CHECKLIST.md`.
5. Publish release notes from `docs/CHANGELOG.md` summary.
