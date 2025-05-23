#!/usr/bin/env bash

mkdir runs && cd $_
for nodes in 1 2 4 8 16;
do
    mkdir n${nodes} && cd $_
    jobfile="job-n${nodes}.sh"
    cp -v ../../../build/bin/ior .
    cp -v ../../script.ior .
    cp -v ../../job-template.sh ${jobfile}
    sed -i "s/XXX/${nodes}/g" ${jobfile}
    sbatch ${jobfile}
    cd ..
    sleep 1
done
cd ..
