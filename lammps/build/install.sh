#!/bin/bash
#

# Set directory for binaries to be installed:
CURRENT_DIR=`pwd`

# Get the LAMMPS source code
git clone https://github.com/lammps/lammps.git

cd lammps

# Check out a tagged version into a new branch
git checkout tags/stable_29Aug2024 -b 29Aug2024
git checkout tags/patch_2Apr2025 -b 2Apr2025

mkdir -p build
cd build

# Set up compilers and MPI as needed for your system
# Examples below for GCC compilers and MPICH, modify as needed
#   GPU-aware MPI is recommended for Kokkos
module load mpich/4.1.2+gcc-12.2.0 cuda/12.2 mkl/2024.2 cmake/3.26

export CC=mpicc
export CXX=mpicxx

# A100: Kokkos_ARCH_AMPERE80=ON
# A40:  Kokkos_ARCH_AMPERE86=ON
# H100: Kokkos_ARCH_HOPPER90=ON

cmake -C ../cmake/presets/basic.cmake -D PKG_CLASS2=on -D PKG_ASPHERE=on -D PKG_GRANULAR=on -D PKG_DIPOLE=on -DPKG_OPENMP=on -D PKG_GPU=on -D GPU_API=cuda -D GPU_ARCH=sm_80 -D BUILD_MPI=yes -D BUILD_OMP=on -D PKG_KOKKOS=on -D Kokkos_ARCH_PASCAL60=off -D Kokkos_ARCH_NATIVE=yes -D Kokkos_ARCH_AMPERE80=ON -D Kokkos_ENABLE_CUDA=yes -D Kokkos_ENABLE_OPENMP=yes -D CMAKE_CXX_COMPILER=$CURRENT_DIR/lammps/lib/kokkos/bin/nvcc_wrapper -DFFT=MKL -DFFT_INCLUDE_DIR=$MKLROOT/include/fftw -DFFT_KOKKOS=CUFFT ../cmake

make -j4

# A binary named lmp is generated under build



