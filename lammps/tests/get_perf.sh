# This script extracts the performance as timesteps/s of a run from the log file.
# The line with the performance info in the log file reads, for instance
#   Performance: 392696.595 tau/day, 909.020 timesteps/s, 29.089 Matom-step/s
#
# Example use:
#   ./get_perf.sh log.lj.n-16.ppn-16

#!/bin/sh

file=$1
grep timesteps/s $1 | sed 's/,//g' | awk '{printf("Performance: %s timesteps/s\n", $4);}'
