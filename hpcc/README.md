# HPCG Benchmarking Guide

This repository provides the reference implementation and test environment for
running the [HPC Chalenge Benchmark](https://hpcchallenge.org/hpcc/index.html)
as part of the RCC Request for Proposals (RFP) process.

HPCC is a synthetic benchmark suite that measures a range memory access
patterns and consists of basically 7 tests: HPL, DGEMM, STREAM, PTRANS,
RandomAccess, FFT, communication bandwidth and latency.

## Directory Structure

```
.
├── build/  # Scripts and source for building HPCC
├── output/ # Sample output files (not for benchmarking reference)
└── tests/  # Input files and job submission templates
```

### `build/`

- [build.sh](build/build.sh): Builds the HPCC benchmark.  **Important**: Adapt
  this script to match your environment and dependencies before use.
- [clean.sh](build/clean.sh): Removes all generated artifacts and resets the
  build environment.
- [code/](build/code): Contains the HPCC 1.5.0 source code and associated SHA256
  checksums.
- [files/](build/files): RCC-provided Makefiles. Vendors may use or modify
  these for their own builds.

### `output/`

- Contains example output files for a single node run. The results therein are
  **not** reference results and are included for formatting guidance only.

### `tests/`

- [hpccinf.txt](tests/hpccinf.txt): Input file for benchmark runs. Vendors must
  tune `P`, `Q`, `N`, and `NB` according to the hardware and job configuration
  to achieve optimal performance.
- [job-template.sh](tests/job-template.sh): A Slurm job submission template
  based on RCC's environment. Vendors may adapt or replace it based on their
  own job scheduling systems.
- [run.sh](tests/run.sh): Script to generate and submit HPCC runs based on the
  job template.

## Building HPCC

To build HPCC:

1. Modify `build/build.sh` to load appropriate modules and dependencies for
   your environment.
2. Execute the script to build the benchmark with your desired compiler and MPI
   stack.

Multiple builds with different toolchains are allowed and encouraged if
relevant to system performance.

## Benchmarking Requirements

Please follow these standardized conditions:

- Single-node runs only.
- MPI must be used. Benchmarks should utilize **all physical cores**.
- Set `P`, `Q`, `N`, and `NB` to optimize performance for your hardware.
- Total memory usage must fall between **82% and 88%** of the node's available memory.
## What to Submit

Submit the following artifacts as part of your RFP response:

- HPCC output file: `hpccoutf.txt`
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
  - `HPL_Tflops`
  - `PTRANS_GBs`
  - `MPIRandomAccess_GUPs`
  - `StarRandomAccess_GUPs`
  - `SingleRandomAccess_GUPs`
  - `StarSTREAM_Triad`
  - `SingleSTREAM_Triad`
  - `MPIFFT_Gflops`
  - `StarDGEMM_Gflops`
  - `SingleDGEMM_Gflops`
  - `RandomlyOrderedRingLatency_usec`
  - `RandomlyOrderedRingBandwidth_GBytes`
  - `AvgPingPongBandwidth_GBytes`
  - `AvgPingPongLatency_usec`
  - Populate the provided Excel sheet (found at the root of this repo) using
    values obtained in the `Begin of Summary section` of the output file.

RCC staff must be able to reproduce the build and run using the provided information.
