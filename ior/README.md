# IOR Benchmarking Guide

This repository provides the reference implementation and test environment for
running the [IOR](https://github.com/hpc/ior) storage benchmark
as part of the RCC Request for Proposals (RFP) process.

IOR is a parallel IO benchmark that can be used to test the performance of
parallel storage systems using various interfaces and access patterns.

**Category**: HPC, Benchmark, Parallel I/O

**Version**: 4.0.0

**Source**: <https://github.com/hpc/ior>

## Directory Contents

- [build](build)
  - [build.sh](build/build.sh): Builds IOR benchmark with HDF5 and MPIIO support.
    **Important**: Adapt this script to match your environment and dependencies
    before use.
  - [clean.sh](build/clean.sh): Removes all generated artifacts and resets the
    build environment.
  - [code/](build/code): Contains the IOR 4.0.0 source code and associated
    SHA256 checksums.

- [output](output)
  - Contains example output files for all IOR runs in 1, 2, 4, 8, and 16 nodes.
    The results therein are **not** reference results and are included for
    formatting guidance only.

- [tests](tests)
  - [script.ior](tests/script.ior): Input file for benchmark runs for various
    storage access patterns. Vendors should adjust parameter `memoryPerNode` such that
    at least 75% of the node memory is allocated by IOR to restrict page cache size.
  - [job-template.sh](tests/job-template.sh): A Slurm job submission template
    based on RCC's environment. Vendors may adapt or replace it based on their
    own job scheduling systems. This should not be submitted directly and is
    used by `run.sh` below.
  - [run.sh](tests/run.sh): Script to generate and submit IOR runs based on the
    job template.
