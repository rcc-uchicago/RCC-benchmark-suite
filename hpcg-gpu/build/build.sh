#! /usr/bin/env bash

set -e

version=7d5c0b8
name=nvidia-hpcg

# binaries will be installed here
mkdir -p bin
rm -rf ${name}

# get source
git clone ssh://github.com/NVIDIA/nvidia-hpcg
cd nvidia-hpcg
git checkout ${version}

# set environment
# !!! CHANGE THIS TO MATCH YOUR ENVIRONMENT !!!
export CXX_PATH=/usr
export CUDA_PATH=$(spack location -i cuda)
export MPI_PATH=$(spack location -i openmpi)
export NCCL_PATH=$(spack location -i nccl)
export PATH=${CXX_PATH}/bin:${PATH}
export PATH=${CUDA_PATH}/bin:${PATH}
export LD_LIBRARY_PATH=${CUDA_PATH}/lib64:${LD_LIBRARY_PATH}

# xhpcg binary will be located in build/bin
mkdir -p build
cd build

# for GPU-only builds no need to change this
export USE_CUDA=1
export USE_GRACE=0
export USE_NCCL=1
export build_B100=0
../configure CUDA_X86

# build it
make -j 16 \
    USE_CUDA=${USE_CUDA} \
    USE_GRACE=${USE_GRACE} \
    USE_NCCL=${USE_NCCL} \
    MPdir=${MPI_PATH} \
    MPlib=${MPI_PATH}/lib \
    Mathdir=${MATHLIBS_PATH} \
    NCCLdir=${NCCL_PATH} \
    CUDA_HOME=${CUDA_PATH} \
    NVPL_PATH=${NVPL_SPARSE_PATH} \
    HPCG_ENG_VERSION=${is_ENG_VERSION} \
    HPCG_COMMIT_HASH=$2 \
    HPCG_VER_MAJOR=$3 \
    HPCG_VER_MINOR=$4 \
    BUILD_B100=${build_B100}

# move build/bin/xhpcg to bin/xhpcg
make install

cp -v ../bin/xhpcg ../../bin
cp -v ../bin/hpcg.sh ../../bin
