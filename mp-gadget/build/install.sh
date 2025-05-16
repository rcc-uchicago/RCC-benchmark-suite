#!/bin/bash
#

# Get the MP-Gadget source code
git clone https://github.com/MP-Gadget/MP-Gadget.git

cd MP-Gadget

# Set up compilers and MPI as needed for your system
# Examples below for GCC compilers, modify as needed
module load mpich/4.1.2+gcc-12.2.0 gsl/2.7 cmake/3.26

export CC=mpicc
export CXX=mpicxx

# copy the example Options.mk to Options.mk needed by Makefile
cp Options.mk.example Options.mk

# modify the variables in Options.mk if needed

MPICC=mpicc make -j8

# 2 binaries will be generated:
#  genic/MP-GenIC   : used to first generate the initial condition from paramfile.genic
#  gadget/MP-Gadget : used to run the simulation from the initial condition



