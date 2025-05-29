# LAMMPS Benchmarking Guide

[LAMMPS](https://github.com/lammps/lammps) is a classical molecular dynamics
code with a focus on materials modeling. It's an acronym for Large-scale
Atomic/Molecular Massively Parallel Simulator.

LAMMPS has potentials for solid-state materials (metals, semiconductors) and
soft matter (biomolecules, polymers) and coarse-grained or mesoscopic systems.
It can be used to model atoms or, more generically, as a parallel particle
simulator at the atomic, meso, or continuum scale.

LAMMPS runs on single processors or in parallel using message-passing techniques
and a spatial-decomposition of the simulation domain. Many of its models have
versions that provide accelerated performance on CPUs, GPUs, and Intel Xeon
Phis. The code is designed to be easy to modify or extend with new
functionality.

LAMMPS is a hybrid MPI/OpenMP C/C++ code with GPU support with the Kokkos
package (CUDA, HIP, SYCL) and GPU package (CUDA, OpenCL, HIP).

**Category**: Materials, Chemistry, Molecular Dynamics Simulation

**Version**: stable_29Aug2024 or later

**Source**: <https://github.com/lammps/lammps>

## Directory Contents

- [build](build)
  - [build.sh](build/build.sh): Downloads and builds the LAMMPS benchmark.
    **Important**: Adapt this script to match your environment and dependencies
    before use.

- [output](output)
  - Contains example output files for the benchmark runs.  These are **not**
    reference results and are included for formatting guidance only.

- [tests](tests)
  - Contains the input scripts and data files for the benchmark runs. Check out
  the [README.md](tests/README.md) for more details.

### What to Submit

In addition to populating the provided Excel sheet with the relevant performance
metrics, please submit the following as part of your RFP response:

- The log files from the runs from which the performance data points for the
  plots are obtained.
- Strong scaling plots
  - Performance (timesteps/s) as a function of number of MPI tasks for a fixed
    number of atoms for
    - CPU-only runs,
    - GPU runs with the KOKKOS package, and
    - GPU runs with GPU package in mixed precision.
- Weak scaling plots
  - Performance (timesteps/s) as a function of number of MPI tasks for a fixed
    number of atoms per node for CPU-only runs
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
