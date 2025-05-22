# HPCG Benchmarking Guide

This repository provides the reference implementation and test environment for
running the [HPCG Benchmark](https://hpcg-benchmark.org/) as part of the RCC
Request for Proposals (RFP) process.

HPCG is a synthetic benchmark that stresses memory access patterns and
computational workloads that better represent a wider range of modern HPC
applications. Vendors are expected to submit results based on the guidelines in
this repository.

## Directory Structure

```
.
├── build/  # Scripts and source for building HPCG
├── output/ # Sample output files (not for benchmarking reference)
└── tests/  # Input files and job submission templates
```

### `build/`

- [build.sh](build/build.sh): Builds the HPCG benchmark.  **Important**: Adapt
  this script to match your environment and dependencies before use.
- [clean.sh](build/clean.sh): Removes all generated artifacts and resets the
  build environment.
- [code/](build/code): Contains the HPCG 3.1 source code and associated SHA256
  checksums.
- [files/](build/files): RCC-provided Makefiles. Vendors may use or modify
  these for their own builds.

### `output/`

- Contains example output files for 1, 2, 4, 8, and 16 node runs.  These are
  **not** reference results and are included for formatting guidance only.

### `tests/`

- [hpcg.dat](tests/hpcg.dat): Input file for benchmark runs. Vendors should
  retain the local problem dimensions of `104 104 104`. Recommended runtime is
  **at least 3600 seconds**, though longer runs may yield more reliable
  performance data.
- [job-template.sh](tests/job-template.sh): A Slurm job submission template
  based on RCC’s environment. Vendors may adapt or replace it based on their
  own job scheduling systems.
- [run.sh](tests/run.sh): Script to generate and submit HPCG runs based on the
  job template.

## Building HPCG

To build HPCG:

1. Modify `build/build.sh` to load appropriate modules and dependencies for
   your environment.
2. Execute the script to build the benchmark with your desired compiler and MPI
   stack.

Multiple builds with different toolchains are allowed and encouraged if relevant to system performance.

## Benchmarking Requirements

Please follow these standardized conditions:

- Local problem dimensions: `104 104 104` (as per `hpcg.dat`)
- Minimum runtime per benchmark: **3600 seconds**
- MPI must be used. Benchmarks should be performed for:
  - 1, 2, 4, 8, and 16 nodes
  - All physical cores must be used (hyperthreading must be disabled)
- Each case must be run **at least 5 times** independently

## What to Submit

Submit the following artifacts as part of your RFP response:

- HPCG output files: `HPCG-Benchmark_3.1_*.txt` for **all** runs
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
- Performance summary:
  - GFLOP/s values averaged from **at least 5 runs per configuration**
  - Populate the provided Excel sheet (found at the root of this repo) using
    values from the `Final Summary` section

RCC staff should be able to reproduce the builds and runs from the details
provided by the vendor.
