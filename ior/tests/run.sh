#!/bin/sh

export ncores=40
mpirun -np 1 -ppn $ncores ./ior -f script > bm-ior-n1.log
mpirun -np 2 -ppn $ncores ./ior -f script > bm-ior-n2.log
mpirun -np 4 -ppn $ncores ./ior -f script > bm-ior-n4.log
mpirun -np 8 -ppn $ncores ./ior -f script > bm-ior-n8.log

