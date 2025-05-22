#!/bin/bash
#SBATCH --job-name=hpcg-YYY-nXXX
#SBATCH --output=job-nXXX.out
#SBATCH --error=job-nXXX.err
#SBATCH --partition=broadwl
#SBATCH --nodes=XXX
#SBATCH --ntasks-per-node=28
#SBATCH --cpus-per-task=1
#SBATCH --mem=0


XHPCG=xhpcg-YYY
if [ "YYY" == "intelmpi" ]; then
    module load intelmpi/2019.up7+intel-19.1.1 mkl/2019.up4
    MPI_OPT="-np ${SLURM_NPROCS} -ppn ${SLURM_NTASKS_PER_NODE}"
else
    module load openmpi/3.0.0+gcc-6.2 gcc/6.2
    MPI_OPT="-np ${SLURM_NPROCS} -N ${SLURM_NTASKS_PER_NODE}"
fi

date
env | grep SLURM >slurm_env.txt
module list >modules.txt

for node in $(scontrol show hostname ${SLURM_JOB_NODELIST}); do
    specfile="specs-${node}.txt"
    >${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 lscpu      >>${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 free -mh   >>${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 lspci      >>${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 ip -4 -o a >>${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 ibstatus   >>${specfile}
done

/usr/bin/time -f "Walltime: %e" mpirun ${MPI_OPT} ./${XHPCG}
