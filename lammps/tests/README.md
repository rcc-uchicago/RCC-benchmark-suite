This folder contains 3 input scripts and 2 data files:
- [in.lj](in.lj)                    : simple Lennard-Jones liquid
- [in.chain.scaled](in.chain.scaled): bead-spring polymers, loading in the file [data.chain](data.chain) for the initial configuration
- [in.rhodo.scaled](in.rhodo.scaled): a solvated membrane protein, loading in the file  [data.rhodo](data.rhodo) for the initial configuration

These files are taken from the  folder [bench](https://github.com/lammps/lammps/tree/develop/bench) under the LAMMPS source tree.

For each input script, the metrics of interest is the performance in terms of timesteps/s (TPS) as a function of the number of MPI tasks, or the number of compute nodes.
For the strong scaling performance, we fix the number of atoms (or particles)
and vary the number of MPI tasks, with and without using the GPUs on the compute nodes.
For the weak scaling performance, we fix the number of atoms (or particles)
per compute node, and vary the number of compute nodes, without using the GPUs.

The script [job-template.sh](job-template.sh) illustrates how the runs for strong and weak scaling performances are conducted.

* For simulations of 2 million atoms in total (as given by the parameter `r=4` in the script [job-template.sh](job-template.sh)), LAMMPS strong scaling performance is expected to be close to linear up to 8 nodes (or equivalently 256 MPI tasks) with and without GPU acceleration for `in.lj` and `in.chain.scaled`. The weak scaling efficiency is expected to be greater than 80% up to 8 nodes. See [Thompson et al, Comput. Phys. Commun. 2022, 271, 108171](https://www.sciencedirect.com/science/article/pii/S0010465521002836)
for LAMMPS benchmark.

The script [get_perf.sh](get_perf.sh) shows how to get the performance of a run from the log file.

