# RCC-benchmark-suite

This repo keeps track of the benchmark suite for the vendors to provide.

The list of applications (version 2025) is given as below.

* [HPCC](https://github.com/icl-utk-edu/hpcc)
  - The ​HPC Challenge ​benchmark suite is a public collection of parallel benchmarks intended to stress various aspects of a high performance computing system. These benchmarks include HPL, DGEMM, STREAM, PTRANS, RandomAccess, FFT, and Communication bandwidth and latency.
  - The focus of this package is on fundamental components such as memory bandwidth and memory access patterns within a single node and innterconnects between nodes by performing and measuring the performance of isolated operations.
* [HPCG](https://github.com/hpcg-benchmark/hpcg)
  - High-Performance Conjugate Gradients (HPCG) solves a sparse linear system using the conjugate gradient method used in CFD and FEM applications
  - MPI parallelization: computation and communication performances
  - The focus is on the performance of the bottleneck of the applications, that is, strong scaling performance of the matrix operations (GFLOP/s) vs. # of nodes.
* [IOR](https://github.com/hpc/ior)
  - IOR measures parallel file system I/O performance at both the POSIX and MPI-IO level; performs writes and reads to/from files under several sets of conditions and reports the resulting throughput rates.
  - MPI parallelization
  - The focus is on the data transfer bandwidth (MiB/s) as a function of number of MPI tasks and the number of nodes.
* [LAMMPS](https://github.com/lammps/lammps)
  - LAMMPS performs classical Molecular Dynamics simulations with short-ranged interactions and long-range electrostatics
  - MPI parallelization, also supporting both multithreading and GPU acceleration: computation and communication performances
  - The focus is on the strong and weak scaling performances of the application (timesteps/s vs. # of nodes or # of MPI tasks)
* [MP-GADGET](https://github.com/MP-Gadget/MP-Gadget)
  - MP-GADGET performs N-body simulations with smooth particle hydrodynamics and long-range gravitational interactions
  - MPI parallelization, also supporting mulithreading
  - The focus is on the strong scaling performance of the whole application (steps/s vs. # of nodes or # of MPI tasks)
