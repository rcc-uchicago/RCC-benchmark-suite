# This script extracts the elapsed time at the last step when TimeLimitCPU is reached
# The line with the performance info in the log file reads
#   Step 160, Time: 0.129684, MPIs: 2 Threads: 16 Elapsed: 2301.97
#
# Example use:
#   ./get_perf.sh neutrinos/log.n-2.ppn-2.t-16

#!/bin/sh

file=$1

grep Step $1 | tail -n1 | sed 's/,//g' |  awk '{ printf("Last step = %s: Elapsed time = %s sec Perf = %f steps/s\n", $2, $10, $2/$10); }'
