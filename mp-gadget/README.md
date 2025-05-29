# MP-Gadget Benchmarking Guide

[MP-Gadget](https://github.com/MP-Gadget/MP-Gadget) is a Massively parallel
cosmological SPH simulation software.

This version of Gadget is derived from main P-Gadget / Gadget-2, with the
gravity solver algorithm from Gadget-4. It is the source code used to run the
BlueTides and ASTRID simulations (http://bluetides-project.org). MP-Gadget
requires GSL and a C compiler with OpenMP 4.5 support.

MP-Gadget is a hybrid MPI/OpenMP C code.

**Category**: Cosmology, Physics

**Version**: master branch

**Source**: https://github.com/MP-Gadget/MP-Gadget

## Directory Contents

- [build](build)
  - [install.sh](build/build.sh): Builds the MP-GADGET benchmark.
    **Important**: Adapt this script to match your environment and dependencies
    before use.

- [output](output)
  - Contains example output files for the benchmark runs.  These are **not**
    reference results and are included for formatting guidance only.

- [tests](tests)
  - Contains the input scripts and data files for the benchmark runs. Check out
    the [README.md](tests/README.md) for more details.

### What to Submit

- The log files from the runs from which the performance data points for the
  plots are obtained.
- Walltime in seconds for each run obtained by measuring the time it takes the
  application to start and finish
- Strong scaling plots
  - Performance (timesteps/s) as a function of number of MPI tasks for a fixed
    number of particles
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
