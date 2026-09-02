# HPCC Benchmarking Guide

This directory provides the reference implementation and test environment for
running the [HPC Chalenge Benchmark](https://hpcchallenge.org/hpcc/index.html)
as part of the RCC Request for Proposals (RFP) process.

HPCC is a synthetic benchmark suite that measures a range memory access patterns
and consists of basically 7 tests: HPL, DGEMM, STREAM, PTRANS, RandomAccess,
FFT, communication bandwidth and latency.

**Category**: HPC, Benchmark, Numerical Methods

**Version**: 1.5.0

**Source**: <https://github.com/icl-utk-edu/hpcc>

## Directory Contents

- [build](build)
  - [build.sh](build/build.sh): Builds the HPCC benchmark.  **Important**: Adapt
    this script to match your environment and dependencies before use.
  - [clean.sh](build/clean.sh): Removes all generated artifacts and resets the
    build environment.
  - [code/](build/code): Contains the HPCC 1.5.0 source code and associated SHA256
    checksums.
  - [files/](build/files): RCC-provided Makefiles. Vendors may use or modify
    these for their own builds.

- [output](output)
  - Contains example output files for a single node run. The results therein are
  **not** reference results and are included for formatting guidance only.

- [tests](tests)
  - [hpccinf.txt](tests/hpccinf.txt): Input file for benchmark runs. Vendors
    must tune `P`, `Q`, `N`, and `NB` according to the hardware and job
    configuration to achieve optimal performance.
  - [job-template.sh](tests/job-template.sh): A Slurm job submission template
    based on RCC's environment. Vendors may adapt or replace it based on their
    own job scheduling systems. This should not be submitted directly and is used
    by `run.sh` below.
  - [run.sh](tests/run.sh): Script to generate and submit HPCC runs based on
    the job template. This is the sc
