#!/usr/bin/env bash

set -e

version=4.0.0
name=ior-${version}

# binaries will be installed here
mkdir -p bin

# untar
rm -rf ${name}
tar xzf code/${name}.tar.gz

pushd ${name}

# Change dependencies here
#module load intelmpi/2021.5+intel-2022.0 mkl/2023.1
#module load intelmpi/2019.up7+intel-19.1.1 intel/19.1.1 mkl/2019.up4
module load intelmpi/2018.2.199+intel-18.0
module load hdf5/1.10.7+intelmpi-2018.2.199+intel-18.0

./configure --with-mpiio --with-hdf5
if make ; then
    cp -v src/ior ../bin
else
    echo "Build failed"
fi
popd

