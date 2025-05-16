#!/bin/sh

wget http://www.hpcg-benchmark.org/downloads/hpcg-3.1.tar.gz
tar xzvf hpcg-3.1.tar.gz
mv hpcg-3.1 hpcg
cd hpcg

cp ../Make.MPIICPC_OMP setup/

mkdir build
cd build

../configure MPIICPC_OMP
make
