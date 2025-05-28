# NVIDIA-HPCG Benchmarking Guide

This repository provides the reference implementation and test environment for
running the [NVIDIA-HPCG Benchmark](https://github.com/NVIDIA/nvidia-hpcg) as
part of the RCC Request for Proposals (RFP) process.

NVIDIA HPCG is based on the HPCG benchmark and optimized for performance on
NVIDIA accelerated HPC systems. NVIDIA's HPCG benchmark accelerates the High
Performance Conjugate Gradients (HPCG) Benchmark. 

**Category**: HPC, Benchmark, Numerical Methods

**Version**: 3.1 git [7d5c0b8](https://github.com/NVIDIA/nvidia-hpcg/tree/7d5c0b85057ea38fe291793db163f55e3a5cda13)

**Source**: https://github.com/NVIDIA/nvidia-hpcg

## Directory Contents

- [build](build)
  - [build.sh](build/build.sh): Downloads and builds the NVIDIA-HPCG benchmark.
    **Important**: Please notice that this benchmark has several requirements
    such as CUDA, OpenMPI and NICL. Do not forget to adapt this script to match
    your environment and dependencies before use.
  - [clean.sh](build/clean.sh): Removes all generated artifacts and resets the
    build environment.

- [output](output)
  - Contains example output files for the following cases:
    - 1 node, 1 GPUs
    - 1 node, 2 GPUs
    - 1 node, 4 GPUs
    - 2 nodes, 8 GPUs
    These **not** reference results and are included for formatting guidance
    only.

- [tests](tests)
  - [hpcg.dat](tests/hpcg.dat): Input file for benchmark runs. Vendors should
    retain the local problem dimensions of `256 256 256`. Recommended runtime
    is **at least 1800 seconds**, though longer runs may yield more reliable
    performance data.
  - [job-template.sh](tests/job-template.sh): A Slurm job submission template
    based on RCC's environment. Vendors may adapt or replace it based on their
    own job scheduling systems. This should not be submitted directly and is used
    by `run.sh` below.
  - [job-info.txt](tests/job-info.txt): Auxiliary file with specs for each run
    type, used by `run.sh`.
  - [run.sh](tests/run.sh): Script to generate and submit NVIDIA-HPCG runs based on
    `job-template.sh` and using `job-info.txt`.

- [spack](spack): files necessary to reproduce RCC test environment using
  [Spack](https://spack.io/).

## Benchmarking Requirements

Please follow these standardized conditions:

- Local problem dimensions: `256 256 256` (as per `hpcg.dat`)
- Minimum runtime per benchmark: **1800 seconds**
- MPI must be used. Benchmarks should be performed for these cases:
    - 1 node, 1 GPUs
    - 1 node, 2 GPUs
    - 1 node, 4 GPUs
    - 2 nodes, 8 GPUs
  - Typically best performance is achieved with one MPI task per GPU and four
    threads per MPI task. Vendors may change these parameters to achieve better
    performance on the same hardware as specified for the cases above.

## What to Submit

In addition to populating the provided Excel sheet with the relevant performance
metrics, please submit the following as part of your RFP response:

- HPCG output files: `HPCG-Benchmark_3.1_*.txt` for **all** runs
- Job topology: number of MPI tasks and threads per task.
- Hardware topology:
  - Number of physical cores per processor
  - Number of processors per node
  - Number of nodes per run
  - Number of GPUs per node and per run
- Build details:
  - Compiler(s) and library versions
  - Compilation and optimization flags used
- Runtime environment:
  - Commands used for launching jobs
  - Any system tuning or configuration details
