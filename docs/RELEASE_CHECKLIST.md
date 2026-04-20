# Release Checklist

## Quality Gates

- [ ] `run('scripts/run_analysis.m')` executes without errors
- [ ] `run('scripts/run_scenarios.m')` executes without errors
- [ ] `run('tests/run_tests.m')` passes fully
- [ ] CI pipeline green on latest commit

## Technical Validation

- [ ] panel commands remain within actuator bounds
- [ ] tracker metrics are not regressed against baseline
- [ ] relative gain metric remains valid for default scenario
- [ ] scenario summary artifact generated successfully

## Documentation Validation

- [ ] README reflects current scripts and outputs
- [ ] architecture/workflow/validation docs updated
- [ ] Simulink integration notes are current
- [ ] change summary prepared for release notes

## Repository Hygiene

- [ ] no secrets or machine-local paths committed
- [ ] no large generated artifacts added unintentionally
- [ ] branch history and commit messages are clean
