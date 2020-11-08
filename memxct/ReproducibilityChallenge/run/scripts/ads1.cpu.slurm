#!/bin/bash

#SBATCH -J memxct-cpu
#SBATCH -o ../output/memxct-cpu.o%j
#SBATCH -e ../output/memxct-cpu.e%j
#SBATCH -p hpc
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

mpirun -np $1 ../../bin/memxct-cpu

