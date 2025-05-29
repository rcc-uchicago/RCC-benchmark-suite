# RCC Benchmark Suite

This repository collects and maintains the benchmark suite that RCC makes
available to vendors. It includes specific versions of each benchmark software
and input files to be used by vendors, as well as details on what information
RCC expects for each benchmark.

If you are a vendor, please read this README in its entirety as it contains
important information.

## Benchmark Applications

The benchmark applications included in this suite are all open-source software,
covering three benchmark categories:

- **Standard Compute**
  - [HPCG](hpcg): High Performance Conjugate Gradients (CPU)
  - [HPCG-GPU](hpcg-gpu): GPU version of High Performance Conjugate Gradients
  - [HPCC](hpcc): HPC Challenge

- **Scientific Applications**
  - [LAMMPS](lammps): Molecular Dynamics Simulator
  - [MP-GADGET](mp-gadget): Massively Parallel Cosmological SPH Simulation
    Software

- **Machine Learning**
  - [MLPerf](mlperf): MLPerf Training and Inference Benchmark

- **Storage**
  - [IOR](ior): Parallel IO Benchmark Software

These applications evaluate different aspects of HPC systems, such as compute
capabilities, interconnect communication, memory bandwidth, and I/O
performance.  A brief description of each application follows.

- [HPCG](https://github.com/hpcg-benchmark/hpcg)
  - Solves a sparse linear system using the conjugate gradient method, common to
    domains such as CFD and FEM.  
  - Focus: Strong scaling performance of matrix operations (GFLOP/s vs. number
    of nodes).
  - Parallelization: MPI  

- [HPCC](https://github.com/icl-utk-edu/hpcc)
  - The HPC Challenge is a collection of parallel benchmarks, including HPL,
    DGEMM, STREAM, PTRANS, RandomAccess, FFT, and communication tests.  
  - Focus: Memory bandwidth and access patterns within a node and inter-node
    communication.
  - Parallelization: MPI

- [MLPerf](https://github.com/mlcommons)
  - The [MLPerf Training: HPC](https://mlcommons.org/benchmarks/training-hpc/)
    benchmark suite measures how fast systems can train models to a target
    quality metric.
  - The [MLPerf Inference:
    Datacenter](https://mlcommons.org/benchmarks/inference-datacenter/)
    benchmark suite measures how fast systems can process inputs and produce
    results using a trained model.

- [LAMMPS](https://github.com/lammps/lammps)
  - LAMMPS performs classical Molecular Dynamics simulations with short-ranged
    interactions and long-range electrostatics
  - The focus is on the strong and weak scaling performances of the application
    (timesteps/s vs. # of nodes or # of MPI tasks)
  - Parallelization: MPI, also supporting both multithreading and GPU
    acceleration

- [MP-GADGET](https://github.com/MP-Gadget/MP-Gadget)
  - MP-GADGET performs N-body simulations with smooth particle hydrodynamics
    and long-range gravitational interactions
  - The focus is on the strong scaling performance of the whole application
    (steps/s vs. # of nodes or # of MPI tasks)
  - Parallelization: MPI, also supporting mulithreading

- [IOR](https://github.com/hpc/ior)
  - Measures parallel file system I/O performance using various interfaces
    (POSIX, MPIIO, HDF5). Supports sequential and random access patterns.  
  - Focus: Data transfer bandwidth (MiB/s) as a function of the number of MPI
    tasks and nodes for each I/O scenario.
  - Parallelization: MPI

## Application Directory Organization

**Specific files and instructions for each benchmark** are located in the
respective application directory at the root of this repository. Each
application directory is organized as follows:

```text
application/
├── README.md  # Application specific instructions, PLEASE DO NOT SKIP
├── build/     # Scripts and source (or link to source) for building the application
├── output/    # Sample output files, not for benchmarking reference
└── tests/     # Input files, scripts and data required for the benchmark runs
```

Each `build/` directory includes a script called `build.sh` that can be used to
assist with building the application and which needs to be adapted by the
vendors so that the correct environment dependent libraries needed to build the
application are loaded.

## What to Submit

Each benchmark requires the submission of specific files and metrics. The
[provided Excel sheet](RCC-Benchmark-Report.xlsx) must be populated using the
required values for metrics obtained in each benchmark.

**RCC staff must be able to reproduce the builds and runs using the provided
information.**

## License

All third-party code, application software, and benchmark software included,
linked or mentioned in this repository are owned by their respective authors
and governed by their respective licenses.

The specific benchmark details, scripts, and input files provided in this
repository are governed by the [LICENSE](LICENSE) file of this repository.
Please refer to this file for terms of usage and distribution.
