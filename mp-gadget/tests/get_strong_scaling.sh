#!/bin/bash

# the maximum number of cpus per node requested in the job script
total_cpus_per_node=48

echo " nprocs  ppn   nthreads  Perf (steps/s)"
for n in 2 4 8 16 24 32 48
do
  ppn=$n
  nt=$(( total_cpus_per_node / ppn ))

  file=log.n-$n.ppn-$ppn.t-$nt
  if [ -e $file ]
  then
    grep Step $file | tail -n1 | sed 's/,//g' |  awk -v n="$n"  -v ppn="$ppn" -v nt="$nt" '{ printf("%4d %6d %6d       %0.1f\n", n, ppn, nt, $2/$10); }'
  fi
done
