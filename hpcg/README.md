# HPCG

HPCG is one of the synthetic benchmarks that RCC expects vendors to perform.
The [HPCG](https://hpcg-benchmark.org/) project is an effort to create a new
metric for ranking HPC systems. HPCG is designed to exercise computational and
data access patterns that more closely match a different and broad set of
important applications, and to give incentive to computer system designers to
invest in capabilities that will have impact on the collective performance of
these applications.

## Directory Structure

This directory is structured as follows:

- [build](build):
  + [build.sh](/build/build.sh): script to build different variants of HPCG.
    **Important**: please remember to adjust dependencies in this script
    according to your environment before running it. 
  + [clean.sh](/build/clean.sh): removes **everything** built by the script
    above and leaves the directory in a clean slate.
  + [code](/build/code): source code and respective SHA256 checksum for HPCG 3.1.
  + [files](/build/files): custom HPCG Makefiles used by RCC for tests. Vendors
    may use these as base to build their own.
- [output](/output)
  + This directory contains sample output files for runs on 1, 2, 4, 8, and 16
    nodes. Performance results from these files should **not** be used for
    reference. These files are provided as examples of the output format.
- [tests](/tests)
  + [hpcg.dat](/tests/hpcg.dat): input file used for benchmarking. Runtime
    should be at least 3600 seconds, but vendors are encouraged to run each
    benchmark for longer for more accurate results.
  + [job-template.sh](/tests/job-template.sh): Template file for a Slurm job.
    This file is based on RCC's environment and provided as a guide. Vendors
    may launch benchmarks runs using their own methods if preferred.
  + [run.sh](/tests/run.sh): This script generates the actual jobs based on the
    job template above. Provided as an example.

## Building HPCG

The script [build.sh](/build/build.sh) may be adjusted to the vendor's
environment and used to build HPCG. Vendors are free to choose one or more
build stacks (compiler, libraries) based on the performance for their proposed
hardware.

## Important to Notice

- Vendors are encouraged to run each HPCG benchmark for longer periods than
  3600 seconds.
- Local dimensions of the problem should be `104 104 104` as in file
  [hpcg.dat](/tests/hpcg.dat).
- Benchmarks should use MPI and be run for at least these cases: 1, 2, 4, 8,
  and 16 nodes, using all cores in each nodes.
- At lest 5 independent runs should be performed for each case above.
- Hyperthreading should be disabled on the nodes, i.e., only physical cores
  used.

## What to submit

- Output files `HPCG-Benchmark_3.1_*.txt` for **all** runs.
- Processors/cores geometry of each run: number of cores per processor, number
  of processors per node and number of nodes.
- Names and versions of compilers and supporting libraries used to build the
  binaries, as well as optimization flags used.
- Runtime configuration and commands used for the runs.
- GFLOP/s obtained from averaging at least 5 runs for each case, to be entered
  in the provided Excel sheet found at the root of this repository. The GFLOP/s
  should be obtained from the `Final Summary` section of the output files.
