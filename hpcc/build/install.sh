#!/bin/sh

wget http://icl.cs.utk.edu/projectsfiles/hpcc/download/hpcc-1.5.0.tar.gz
tar xzvf hpcc-1.5.0.tar.gz
mv hpcc-1.5.0 hpcc
cd hpcc
cp ../Make.rcc hpl/
make arch=rcc
