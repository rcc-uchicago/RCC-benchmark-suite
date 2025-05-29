#!/bin/bash
#

# Store the current directory for the absolute path to the nvcc_wrapper below
CURRENT_DIR=`pwd`

# Get the LAMMPS source code
git clone https://github.com/lammps/lammps.git

cd lammps

# Check out a tagged version into a new branch
git checkout tags/stable_29Aug2024 -b 29Aug2024
# or
# git checkout tags/patch_2Apr2025 -b 2Apr2025

mkdir -p build
cd build

# Set up compilers and MPI as needed for your system
# Examples below for GCC compilers and MPICH, modify as needed
#   GPU-aware MPI is recommended for Kokkos for multiple MPI processes per node.
module load mpich/4.1.2+gcc-12.2.0 cuda/12.2 mkl/2024.2 cmake/3.26

export CC=mpicc
export CXX=mpicxx

# For KOKKOS package: at the time of writing, only double precision is supported for GPU builds.
# A100: Kokkos_ARCH_AMPERE80=ON
# A40:  Kokkos_ARCH_AMPERE86=ON
# H100: Kokkos_ARCH_HOPPER90=ON

# For GPU package: set GPU_API to cuda, hip or opencl depending on your GPUs.

cmake -C ../cmake/presets/basic.cmake -D BUILD_MPI=yes -D BUILD_OMP=on \
      -D PKG_CLASS2=on -D PKG_ASPHERE=on -D PKG_GRANULAR=on -D PKG_DIPOLE=on -D PKG_OPENMP=on \
      -D PKG_GPU=on -D GPU_API=cuda -D GPU_PREC=mixed -D GPU_ARCH=sm_80 
      -D PKG_KOKKOS=on -D Kokkos_ARCH_PASCAL60=off \
      -D Kokkos_ARCH_NATIVE=yes -D Kokkos_ARCH_AMPERE80=ON -D Kokkos_ENABLE_CUDA=yes \
      -D Kokkos_ENABLE_OPENMP=yes -D CMAKE_CXX_COMPILER=$CURRENT_DIR/lammps/lib/kokkos/bin/nvcc_wrapper \
      -DFFT=MKL -DFFT_INCLUDE_DIR=$MKLROOT/include/fftw -DFFT_KOKKOS=CUFFT ../cmake

make -j8

# A binary named lmp is generated under build



