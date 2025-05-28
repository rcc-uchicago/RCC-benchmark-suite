#!/usr/bin/env bash

set -e

mkdir runs

while read line; do
    if echo $line | grep -qE '^#'; then
        continue
    fi

    cd runs

    nodes=$(echo $line | awk -F',' '{print $1}')
    ntasks_per_node=$(echo $line | awk -F',' '{print $2}')
    gpus_per_node=$(echo $line | awk -F',' '{print $3}')
    gpus_total=$(echo $line | awk -F',' '{print $4}')
    nodelist=$(echo $line | awk -F',' '{print $5}')

    rundir="n${nodes}-g${gpus_total}"
    mkdir ${rundir} && cd $_
    cp -v ../../hpcg.dat .
    cp -v ../../../build/bin/xhpcg .
    cp -v ../../../build/bin/hpcg.sh .
    cp -v ../../job-template.sh ./job.sh
    sed -i "s/XXX/${nodes}/g" ./job.sh
    sed -i "s/VVV/${gpus_per_node}/g" ./job.sh
    sed -i "s/YYY/${gpus_total}/g" ./job.sh
    sed -i "s/ZZZ/${ntasks_per_node}/g" ./job.sh
    sed -i "s/NNN/${nodelist}/g" ./job.sh
    sbatch job.sh
    cd ../..
    sleep 1

done <job-info.txt
