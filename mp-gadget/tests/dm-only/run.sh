#!/bin/bash
#SBATCH --job-name=gadget-bench
#SBATCH --account=rcc-staff
#SBATCH --time=12:00:00
#SBATCH --partition=caslake
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=48
#SBATCH --mem=128GB
#SBATCH --output=output-%J.txt
#SBATCH --error=error-%J.txt

module load mpich/4.1.2+gcc-12.2.0 gsl/2.7

ulimit -l unlimited

cd $SLURM_SUBMIT_DIR

total_cpus_per_node=$SLURM_NTASKS_PER_NODE

export GENIC_BINARY=../../build/MP-Gadget/genic/MP-GenIC
export GADGET_BINARY=../../build/MP-Gadget/gadget/MP-Gadget

total_cpus_per_node=48

for nodes in 1 #8 4 2 1
do
  for ppn in 24 16 8 4
  do
    n=$(( nodes * ppn ))

    # num threads to occupy all the cores allocated
    nt=$(( total_cpus_per_node / ppn ))

    export OMP_NUM_THREADS=$nt

    # generate the initial conditions
    mpirun -np $n -ppn $ppn --bind-to core --map-by numa $GENIC_BINARY paramfile.genic > initial_bc.n-$n.ppn-$ppn.t-$nt

    # run the simulation
    mpirun -np $n -ppn $ppn --bind-to core --map-by numa $GADGET_BINARY paramfile.gadget > out.n-$n.ppn-$ppn.t-$nt
    cp output/cpu.txt log.n-$n.ppn-$ppn.t-$nt
  done
done


