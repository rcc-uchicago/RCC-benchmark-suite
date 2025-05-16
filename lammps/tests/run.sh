#!/bin/bash
#SBATCH --job-name=gadget-bench
#SBATCH --account=rcc-staff
#SBATCH --time=12:00:00
#SBATCH --partition=gpu
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=16
#SBATCH --mem=128GB
#SBATCH --gres=gpu:4
#SBATCH --constraint=a100
#SBATCH --output=output-%J.txt
#SBATCH --error=error-%J.txt

# CPU-only runs

export LMP_BINARY=../build/lammps/build/lmp

# r controls the number of atoms (or particles) in the simulation (i.e. the problem size)
# r = 4 gives 2M particles

r=4
for input in lj chain.scaled rhodo.scaled
do
  for nodes in 1 2 4 8
  do
    for ppn in 32 16 8 4 2 1
    do
      n=$(( nodes * ppn ))
      mpirun -np $n -ppn $ppn $LMP_BINARY -in in.$input -v x $r -v y $r -v z $r \
        -log log.$input.n-$n.ppn-$ppn
    done
  done
done

# GPU runs

for input in lj chain.scaled rhodo.scaled
do
  for nodes in 1 2 4 8
  do
    for ppn in 32 16 8 4 2 1
    do
      n=$(( nodes * ppn ))
      for g in 1 2 4
      do
        mpirun -np $n -ppn $ppn $LMP_BINARY -in in.$input -v x $r -v y $r -v z $r -v t 200 \
          -sf gpu -pk gpu $g -log log.gpu.$input.n-$n.ppn-$ppn.g-$g

        if [ $ppn -eq $g ];
        then
          mpirun -np $n -ppn $ppn $LMP_BINARY -in in.$input -v x $r -v y $r -v z $r -v t 200 \
            -k on g $g -sf kk -pk kokkos neigh half newton on \
            -log log.kokkos.$input.n-$n.ppn-$ppn.g-$g
        fi
      done
    done
  done
done

# Weak scaling performance of CPU-only runs to test the communication overhead across nodes

for nodes in 1 2 3 4 5 6 8
do
  input="lj"
  # scaling up the problem size with the number of nodes
  r=$nodes
  do
    for ppn in 32
    do
      n=$(( nodes * ppn ))
      mpirun -np $n -ppn $ppn $LMP_BINARY -in in.$input -v x $r -v y 1 -v z 1 -v t 200 \
        -log log.$input.n-$n.ppn-$ppn.r-$r
    done
  done
done


