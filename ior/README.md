# IOR Benchmarking Guide

This repository provides the reference implementation and test environment for
running the [IOR](https://github.com/hpc/ior) storage benchmark
as part of the RCC Request for Proposals (RFP) process.


IOR is a parallel IO benchmark that can be used to test the performance of
parallel storage systems using various interfaces and access patterns. 

## Directory Structure

```
.
├── build/  # Scripts and source for building IOR
├── output/ # Sample output files (not for benchmarking reference)
└── tests/  # Input files and job submission templates
```

### `build/`

- [build.sh](build/build.sh): Builds IOR benchmark with HDF5 and MPIIO support.
  **Important**: Adapt this script to match your environment and dependencies
  before use.
- [clean.sh](build/clean.sh): Removes all generated artifacts and resets the
  build environment.
- [code/](build/code): Contains the IOR 4.0.0 source code and associated
  SHA256 checksums.

### `output/`

- Contains example output files for all IOR runs in 1, 2, 4, 8, and 16 nodes.
  The results therein are **not** reference results and are included for
  formatting guidance only.

### `tests/`

- [script.ior](tests/script.ior): Input file for benchmark runs for various
  storage access patterns. Vendors should adjust parameter `memoryPerNode` such that
  at least 75% of the node memory is allocated by IOR to restrict page cache size.
- [job-template.sh](tests/job-template.sh): A Slurm job submission template
  based on RCC's environment. Vendors may adapt or replace it based on their
  own job scheduling systems.
- [run.sh](tests/run.sh): Script to generate and submit IOR runs based on the
  job template.

## Building IOR

To build IOR

1. Modify `build/build.sh` to load appropriate modules and dependencies for
   your environment.
2. Execute the script to build the benchmark with your desired compiler and MPI
   stack.
3. The build script will copy the final executables to the newly created
   directory `build/bin`.

## Benchmarking Requirements

Please follow these standardized conditions:

- Run all scenarios from [script.ior](tests/script.ior), i.e. the whole script.
- Vendors must adjust the parameter `memoryPerNode` in the script such that at
  least 75% of the node's memory is allocated by IOR to restrict page cache
  effects.
- Save the output of each IOR run in a file named `ior-nX.log` where `X` is the
  number of nodes used for the run. See
  [job-template.sh](/tests/job-template.sh).
- MPI must be used. Benchmarks should be performed for:
  - 1, 2, 4, 8, and 16 nodes
  - All physical cores must be used (hyperthreading must be disabled)
- This benchmark should be run preferrably in a parallel file system such as
  Storage Scale (GPFS).

Vendors are encouraged to run additional scenarios to further showcase
performance of their proposed solutions.

## What to Submit

Submit the following artifacts as part of your RFP response:

- IOR output files `ior-nX.log` for all runs.
- Hardware topology:
  - Number of physical cores per processor
  - Number of processors per node
  - Number of nodes per run
- Build details:
  - Compiler(s) and library versions
  - Compilation and optimization flags used
- Runtime environment:
  - Commands used for launching jobs
  - Any system tuning or configuration details
  - Details about the storage file system used
- Performance summary:
  - For each scenario:
    - Read and write bandwidth (MiB/s)
    - Read and write IOPS
    - Read and write Latency (s)
  - Populate the provided Excel sheet (found at the root of this repo) using
    values from IOR output.

RCC staff must be able to reproduce the build and run using the provided
information.
