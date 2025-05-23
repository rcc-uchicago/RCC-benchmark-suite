There are 3 input scripts and 2 data files:
- [in.lj](in.lj)          : simple Lennard-Jones liquid
- [in.chain.scaled](in.chain.scaled): bead-spring polymers, using [data.chain](data.chain)
- [in.rhodo.scaled](in.rhodo.scaled): a solvated membrane protein, using [data.rhodo](data.rhodo)

For each input script, the metrics of interest is the performance in terms of timesteps/s (TPS)
as a function of the number of MPI tasks, or the number of compute nodes.
For the strong scaling performance, we fix the number of atoms (or particles)
and vary the number of MPI tasks, with and without using the GPUs on the compute nodes.
For the weak scaling performance, we fix the number of atoms (or particles)
per compute node, and vary the number of compute nodes, without using the GPUs.

The script [run.sh](run.sh) illustrates how the runs for strong and weak scaling performances are conducted.

For simulations of 2 million atoms in total as in the script run.sh
LAMMPS is expected to give close to linear strong scaling up to 8 nodes (256 MPI tasks)
with and without GPU acceleration for in.lj and in.chain.scaled, and weak scaling efficiency
more than 80% up to 8 nodes.

The script [get_perf.sh](get_perf.sh) shows how to get the performance of a run from the log file.

Reference: Thompson et al, Comput. Phys. Commun. 2022, 271, 108171.

