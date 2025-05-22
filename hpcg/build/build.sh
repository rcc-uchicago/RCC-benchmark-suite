#!/usr/bin/env bash
#
# Different variants are built in each block below. Each has its
# own DEPENDENCIES block which should be adapted as needed
#
# Notice that different variants are built into different subshells,
# so it's not necessary to "unload" modules or reset the environment
# in between variants.

set -e

version=3.1
name=hpcg-${version}

# binaries will be installed here
mkdir -p bin

# untar
rm -rf ${name}
tar xzf code/${name}.tar.gz

######################################################################
# GCC and OpenMPI                                                    #
######################################################################
(
    variant="openmpi"
    makefile="MPI_GCC_OMP"

    pushd ${name}
    cp -v ../files/Make.${makefile} setup
    rm -rf build-${variant}
    mkdir -p build-${variant} && pushd $_

    ### DEPENDENCIES
    #  Make sure to change or remove 'module load' below as needed
    # For Midway3
    module load openmpi/4.1.0
    # For Midway2
    #module load openmpi/3.0.0+gcc-6.2 gcc/6.2
    ### END OF DEPENDENCIES

    ../configure ${makefile}
    make
    cp bin/xhpcg ../../bin/xhpcg-${variant}
    popd
)

######################################################################
# Intel MPI                                                          #
######################################################################
(
    variant="intelmpi"
    makefile="MPIICPC_OMP"

    pushd ${name}
    cp -v ../files/Make.${makefile} setup
    rm -rf build-${variant}
    mkdir -p build-${variant} && pushd $_

    ### DEPENDENCIES
    #  Make sure to change or remove 'module load' below as needed
    # For Midway3
    module load intelmpi/2021.5+intel-2022.0
    module load mkl/2023.1
    # For Midway2
    #module load intelmpi/2019.up7+intel-19.1.1 mkl/2019.up4
    ### END OF DEPENDENCIES

    ../configure ${makefile}
    make
    cp bin/xhpcg ../../bin/xhpcg-${variant}
    popd
)
