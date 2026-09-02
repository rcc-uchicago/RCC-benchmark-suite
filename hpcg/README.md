# HPCG Benchmarking Guide

This repository provides the reference implementation and test environment for
running the [HPCG Benchmark](https://hpcg-benchmark.org/) as part of the RCC
Request for Proposals (RFP) process.

HPCG is a synthetic benchmark that stresses memory access patterns and
computational workloads that better represent a wider range of modern HPC
applications. Vendors are expected to submit results based on the guidelines in
this repository.

**Category**: HPC, Benchmark, Numerical Methods

**Version**: 3.1

**Source**: <https://github.com/hpcg-benchmark/hpcg>

## Directory Contents

- [build](build)
  - [build.sh](build/build.sh): Builds the HPCG benchmark.  **Important**: Adapt
    this script to match your environment and dependencies before use.
  - [clean.sh](build/clean.sh): Removes all generated artifacts and resets the
    build environment.
  - [code/](build/code): Contains the HPCG 3.1 source code and associated SHA256
    checksums.
  - [files/](build/files): RCC-provided Makefiles. Vendors may use or modify
    these for their own builds.

- [output](output)
  - Contains example output files for 1, 2, 4, 8, and 16 node runs.  These are
    **not** reference results and are included for formatting guidance only.

- [tests](tests)
  - [hpcg.dat](tests/hpcg.dat): Input file for benchmark runs. Vendors should
    retain the local problem dimensions of `104 104 104`. Recommended runtime is
    **at least 1800 seconds**, though longer runs may yield more reliable
    performance data.
  - [job-template.sh](tests/job-template.sh): A Slurm job submission template
    based on RCC's environment. Vendors may adapt or replace it based on their
    own job scheduling systems. This should not be submitted directly and is used
    by `run.sh` below.
  - [run.sh](tests/run.sh): Script to generate and submit HPCG runs based on the
    job template.
