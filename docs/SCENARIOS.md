# Scenario Library

## Purpose

Scenario sweeps make controller behavior comparable across different operating assumptions without changing core logic.

## Included Scenarios

- `coastal_reference`: default location and sampling profile
- `inland_reference`: alternate location benchmark
- `fast_response`: smaller time step and higher max actuator rate
- `coarse_sampling`: larger time step and lower max actuator rate

## Run Batch Analysis

```matlab
run('scripts/run_scenarios.m')
```

## Outputs

When export is enabled, scenario artifacts are written into `outputs/latest/`:

- `scenario_summary.csv`
- `scenario_batch.mat`

## Adding a Scenario

Edit `src/build_scenario_configs.m` and append a new scenario with:

1. unique `name`
2. modified `cfg` fields
3. physically realistic controller and sampling values
