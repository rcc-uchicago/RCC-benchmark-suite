#!/bin/sh

wget http://portal.nersc.gov/project/mpccc/cfs/ior-3.2.0.tar.gz
tar xzvf ior-3.2.0.tar.gz
mv ior-3.2.0 ior
cd ior

./configure
make
