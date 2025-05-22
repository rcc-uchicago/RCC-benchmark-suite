#!/usr/bin/env bash

for compiler in intelmpi; do
    mkdir run-${compiler} && cd $_
    for nodes in 1
    do
        mkdir n${nodes} && cd $_
        jobfile="job-n${nodes}.sh"
        cp -v ../../../build/bin/hpcc-${compiler} .
        cp -v ../../hpccinf.txt .
        cp -v ../../job-template.sh ${jobfile}
        sed -i "s/XXX/${nodes}/g" ${jobfile}
        sed -i "s/YYY/${compiler}/g" ${jobfile}
        #sbatch ${jobfile}
        cd ..
        sleep 1
    done
    cd ..
done
