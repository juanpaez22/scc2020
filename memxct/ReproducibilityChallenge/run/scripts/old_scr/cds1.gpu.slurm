#!/bin/bash

#SBATCH -J memxct-gpu-cds1
#SBATCH -o ../output/memxct-gpu-cds1.o%j
#SBATCH -e ../output/memxct-gpu-cds1.e%j
#SBATCH -p gpu
#SBATCH -t 00:30:00

# -N and -n set by bash script

#DOMAIN INFORMATION
export NUMTHE=750
export NUMRHO=512
export PIXSIZE=1

#SOLVER DATA
export NUMITER=24

#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE=32
export SPECSIZE=32

#BLOCK SIZE
export PROJBLOCK=64
export BACKBLOCK=64

#BUFFER SIZE
export PROJBUFF=96
export BACKBUFF=96

#I/O FILES
export THEFILE=../../data/CDS1_theta.bin
export SINFILE=../../data/CDS1_sinogram.bin
export OUTFILE=../output/recon_CDS1.bin

#SET OMP THREADS
export OMP_NUM_THREADS=12

# prepare.gpu.slurm should have already ran to install cuda

# should still source intel libraries
source /data/compilers/intel20u2/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /data/compilers/intel20u2/impi/2019.8.254/intel64/bin/mpivars.sh
source /data/compilers/intel20u2/mkl/bin/mklvars.sh intel64

# Run code
mpirun -print-rank-map -ppn 1 -np $1 ../../bin/memxct-gpu

