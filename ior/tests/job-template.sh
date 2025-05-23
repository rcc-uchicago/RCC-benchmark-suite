#!/bin/bash
#SBATCH --job-name=ior-nXXX
#SBATCH --output=job-nXXX.out
#SBATCH --error=job-nXXX.err
#SBATCH --partition=broadwl
#SBATCH --nodes=XXX
#SBATCH --ntasks-per-node=28
#SBATCH --cpus-per-task=1
#SBATCH --mem=0


date
pwd
df -hT $(pwd)
env | grep SLURM >slurm_env.txt

module load intelmpi/2018.2.199+intel-18.0 hdf5/1.10.7+intelmpi-2018.2.199+intel-18.0
module list >modules.txt

mpirun -np ${SLURM_NPROCS} -ppn ${SLURM_NTASKS_PER_NODE} ./ior -f script.ior >ior-nXXX.log 2>&1
