#!/bin/bash
#SBATCH --job-name=job-nXXX-gYYY
#SBATCH --output=job-nXXX-gYYY.out
#SBATCH --error=job-nXXX-gYYY.err
#SBATCH --partition=gpu
#SBATCH --nodes=XXX
#SBATCH --ntasks-per-node=ZZZ
#SBATCH --cpus-per-task=4
#SBATCH --mem=0
#SBATCH --nodelist=NNN
#SBATCH --gres=gpu:VVV

#######################################################################
# !!! CHANGE THIS TO MATCH YOUR ENVIRONMENT !!!
. /project/rcc/grondina/spack/760387/spack/share/spack/setup-env.sh
spack env activate hpcg-nvidia
export CUDA_PATH=$(spack location -i cuda)
export MPI_PATH=$(spack location -i openmpi)
export NCCL_PATH=$(spack location -i nccl)
export PATH=${CUDA_PATH}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_PATH}/lib64:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${MPI_PATH}/lib:${LD_LIBRARY_PATH}
export LD_LIBRARY_PATH=${NCCL_PATH}/lib:${LD_LIBRARY_PATH}
#######################################################################

date
env | grep SLURM >slurm_env.txt
module list >modules.txt

for node in $(scontrol show hostname ${SLURM_JOB_NODELIST}); do
    specfile="specs-${node}.txt"
    >${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 nvidia-smi >>${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 lscpu      >>${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 free -mh   >>${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 lspci      >>${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 ip -4 -o a >>${specfile}
    srun --nodes=1 --nodelist=${node} --ntasks=1 --cpus-per-task=1 ibstatus   >>${specfile}
done

HPCG_SCRIPT=hpcg.sh
XHPCG=xhpcg
test -x ${HPCG_SCRIPT} || exit 1
test -x ${XHPCG} || exit 1

/usr/bin/time -f "Walltime: %e" mpirun -np ${SLURM_NPROCS} ./${HPCG_SCRIPT} --of 1 --dat ./hpcg.dat --p2p 0
