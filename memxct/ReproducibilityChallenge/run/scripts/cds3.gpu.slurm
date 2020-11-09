#!/bin/bash

#SBATCH -J memxct-gpu
#SBATCH -o ../output/memxct-gpu.o%j
#SBATCH -e ../output/memxct-gpu.e%j
#SBATCH -p gpu
#SBATCH -t 00:30:00

# -N and -n set by bash script

#DOMAIN INFORMATION
export NUMTHE=360
export NUMRHO=256
export PIXSIZE=1

#SOLVER DATA
export NUMITER=24

#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE=32
export SPECSIZE=32

#BLOCK SIZE
export PROJBLOCK=128
export BACKBLOCK=128

#BUFFER SIZE
export PROJBUFF=8
export BACKBUFF=8

#I/O FILES
export THEFILE=../../data/ADS1_theta.bin
export SINFILE=../../data/ADS1_sinogram.bin
export OUTFILE=../output/recon_ADS1.bin

#SET OMP THREADS
#export OMP_NUM_THREADS=$1

# Source libraries
source /data/compilers/intel20u2/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /data/compilers/intel20u2/impi/2019.8.254/intel64/bin/mpivars.sh
source /data/compilers/intel20u2/mkl/bin/mklvars.sh intel64

# htop
sudo yum -y install epel-release
sudo yum -y install htop

# CUDA and drivers
sudo rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

sudo yum -y install dkms

CUDA_REPO_PKG=cuda-repo-rhel7-10.0.130-1.x86_64.rpm

wget http://developer.download.nvidia.com/compute/cuda/repos/rhel7/x86_64/${CUDA_REPO_PKG} -O /tmp/${CUDA_REPO_PKG}

sudo rpm -ivh /tmp/${CUDA_REPO_PKG}

rm -f /tmp/${CUDA_REPO_PKG}

sudo yum -y install cuda-drivers
sudo yum -y install cuda

# Run code
mpirun -n 1 ../../bin/memxct-gpu

