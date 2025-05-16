[LAMMPS](https://github.com/lammps/lammps) is a classical molecular dynamics code with a focus on materials modeling. It's an acronym for Large-scale Atomic/Molecular Massively Parallel Simulator.

LAMMPS has potentials for solid-state materials (metals, semiconductors) and soft matter (biomolecules, polymers) and coarse-grained or mesoscopic systems. It can be used to model atoms or, more generically, as a parallel particle simulator at the atomic, meso, or continuum scale.

LAMMPS runs on single processors or in parallel using message-passing techniques and a spatial-decomposition of the simulation domain. Many of its models have versions that provide accelerated performance on CPUs, GPUs, and Intel Xeon Phis. The code is designed to be easy to modify or extend with new functionality. 

LAMMPS is a hybrid MPI/OpenMP C/C++ code with GPU support with the Kokkos package (CUDA, HIP, SYCL) and GPU package (CUDA, OpenCL, HIP).

Category: Materials, Chemistry, Molecular Dynamics Simulation 
Version: stable_29Aug2024 or later
Source: https://github.com/lammps/lammps


The structure of this folder is as follows:

- `build`
  + `install.sh`: script that shows the steps to download the source code and build the software to get the binary
- `tests`
  + input scripts and data files used for the test
  + README that shows the specific tests to run and the expected output files
- `output`
  + examples of the performance data collected from the runs

### What to submit

- The log files from the runs
- Strong scaling plots
  - Performance (timesteps/s) as a function of number of MPI tasks for a fixed number of atoms
- Weak scaling plots
  - Performance (timesteps/s) as a function of number of MPI tasks for a fixed number of atoms per node
