#!/usr/bin/env bash
#
# Different variants are built in each block below. Each has its
# own DEPENDENCIES block which should be adapted as needed
#
# Notice that different variants are built into different subshells,
# so it's not necessary to "unload" modules or reset the environment
# in between variants.

set -e

version=1.5.0
name=hpcc-${version}

# binaries will be installed here
mkdir -p bin

# untar
rm -rf ${name}
tar xvzf code/${name}.tar.gz

######################################################################
# Intel MPI                                                          #
######################################################################
(
    pushd ${name}

    variant="intelmpi"
    makefile="Linux_IntelMPI_OMP"

    cp -v ../files/Make.${makefile} hpl

    ### DEPENDENCIES
    #  Make sure to change or remove 'module load' below as needed
    # For Midway3
    module load intelmpi/2021.5+intel-2022.0
    module load mkl/2023.1
    # For Midway2
    #module load intelmpi/2019.up7+intel-19.1.1 mkl/2019.up4
    ### END OF DEPENDENCIES

    make arch=${makefile}
    cp -v hpcc ../bin/hpcc-${variant}

    popd
)
