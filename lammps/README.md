[LAMMPS](https://github.com/lammps/lammps) is a classical molecular dynamics code with a focus on materials modeling. It's an acronym for Large-scale Atomic/Molecular Massively Parallel Simulator.

LAMMPS has potentials for solid-state materials (metals, semiconductors) and soft matter (biomolecules, polymers) and coarse-grained or mesoscopic systems. It can be used to model atoms or, more generically, as a parallel particle simulator at the atomic, meso, or continuum scale.

LAMMPS runs on single processors or in parallel using message-passing techniques and a spatial-decomposition of the simulation domain. Many of its models have versions that provide accelerated performance on CPUs, GPUs, and Intel Xeon Phis. The code is designed to be easy to modify or extend with new functionality. 

LAMMPS is a hybrid MPI/OpenMP C/C++ code with GPU support with the Kokkos package (CUDA, HIP, SYCL) and GPU package (CUDA, OpenCL, HIP).

**Category**: Materials, Chemistry, Molecular Dynamics Simulation 
**Version**: stable_29Aug2024 or later
**Source**: https://github.com/lammps/lammps

## Directory Structure

```
.
├── build/  # Scripts for downloading and building LAMMPS
├── output/ # Sample output files (not for benchmarking reference)
└── tests/  # Input files and job submission templates
```

### `build/`

- [install.sh](build/install.sh): Builds the LAMMPS benchmark.  **Important**: Adapt
  this script to match your environment and dependencies before use.

### `output/`

- Contains example output files for the benchmark runs.  These are
  **not** reference results and are included for formatting guidance only.

### `tests/`

- Contains the input scripts and data files for the benchmark runs. Check out
the [README.md](tests/README.md) for more details.

### What to Submit

- The log files from the runs from which the performance data points for the plots are obtained.
- Strong scaling plots
  - Performance (timesteps/s) as a function of number of MPI tasks for a fixed number of atoms for 1) CPU-only runs, 2) GPU runs with KOKKOS and 3) GPU runs with GPU packages
- Weak scaling plots
  - Performance (timesteps/s) as a function of number of MPI tasks for a fixed number of atoms per node for CPU-only runs

RCC staff should be able to reproduce the builds and runs from the details
provided by the vendor.