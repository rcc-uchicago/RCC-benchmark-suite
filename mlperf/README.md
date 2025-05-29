# MLPerf Benchmarking Guide

This directory provides a reference for using the [MLPerf Training
HPC](https://mlcommons.org/benchmarks/training-hpc/) benchmark as part of the
RCC Request for Proposals (RFP) process.

MLPerf is a widely recognized benchmark suite for evaluating the performance of
machine learning systems. In this benchmark we are specifically focusing on the **DeepCAM** model of the [MLPerf Training HPC](https://mlcommons.org/benchmarks/training-hpc/) benchmark suite.

**Category**: HPC, Benchmark, Machine Learning

**Version**: 3.0

**Source**: <https://github.com/mlcommons/hpc/>

## Repositories

The official repository for the MLPerf Training HPC benchmark is
<https://github.com/mlcommons/hpc/>. This repository contains the reference
implementation that vendors can use to build their own implementations

We encourage vendors to explore configuration and results of existing
submissions to the latest MLPerf Training HPC edition in
<https://github.com/mlcommons/hpc_results_v3.0/> to see concrete examples of how
to run the DeepCAM benchmark.

## Target and Parameters

The **quality target** for the training should be the default value used by the
MLPerf benchmark: `IOU 0.82`

In order to define a baseline for comparison, RCC asks vendors to utilize a
fixed set of parameters for the benchmarks. The hyperparameters to train the
DeepCAM model for this benchmark should be the following.

| Paremter Name                       | Variable `config.sh`    | Value       |
| ----------------------------------- | ----------------------- |-------------|
| `--optimizer`                       | `OPTIMIZER`             | `LAMB`      |
| `--start_lr`                        | `START_LR`              | `0.0025`    |
| `--weight_decay`                    | `WEIGHT_DECAY`          | `0.01`      |
| `--lr_warmup_steps`                 | `LR_WARMUP_STEPS`       | `100`       |
| `--lr_warmup_factor`                | `LR_WARMUP_FACTOR`      | `1.`        |
| `--lr_schedule` type                | `LR_SCHEDULE_TYPE`      | `multistep` |
| `--lr_schedule` milestones          | `LR_MILESTONES`         | `4096 8192` |
| `--lr_schedule` decay_rate          | `LR_DECAY_RATE`         | `0.2`       |
| `--batchnorm_group_size`            | `BATCHNORM_GROUP_SIZE`  | `1`         |
| `--gradient_accumulation_frequency` | `-`                     | `1`         |
| `--seed`                            | `-`                     | Time/Random |

The values for data parameters and other options should be as described below.

| Variable                      | Value |
| ----------------------------- | ----------|
| `SHUFFLE_MODE`                | `global` |
| `DATA_FORMAT`                 | `dali-numpy` |
| `PRECISION_MODE`              | `amp` |
| `LOCAL_VALIDATION_BATCH_SIZE` | `8`  |
| `LOGGING_FREQUENCY`           | `0` |
| `ADDITIONAL_ARGS`             | `--enable_jit --disable_comm_overlap --enable_graph` |
| `DATA_OVERSAMPLING_FACTOR`   | `1` |
| `MAX_EPOCHS`                  | `50` |

Additional system-dependent parameters should be configured by the vendor
according to the number of nodes and GPUs used for the tests.

## Benchmarking Requirements

- Quality Target of `IOU 0.82`
- Paramters as described in the tables above
- Systems and cases to run the benchmarks
  - 2 nodes with 4 double-precision GPUs each (8 GPUs total)
  - 4 nodes with 4 double-precision GPUs each (16 GPUs total)
  - 8 nodes with 4 double-precision GPUs each (32 GPUs total)
  - 2 nodes with 8 single-precision GPUs each (16 GPUs total)
  - 4 nodes with 8 single-precision GPUs each (32 GPUs total)
- At least two runs for each system is expected
- For all runs training should be done using **single precision**

## What to Submit

In addition to populating the provided Excel sheet with the relevant performance
metrics, please submit the following as part of your RFP response:

- DeepCAM training output files, see [example](results.txt)
- Hardware topology:
  - Number of physical cores per processor
  - Number of processors per node
  - Number of nodes per run
  - Number and model of GPUs used
- Build details:
  - Compiler(s) and library versions
  - Compilation and optimization flags used
- Runtime environment:
  - Commands used for launching jobs
  - Any system tuning or configuration details
