#!/bin/bash

#SBATCH -J memxct-cpu-cds2
#SBATCH -o ../output/memxct-cpu-cds2.o%j
#SBATCH -e ../output/memxct-cpu-cds2.e%j
#SBATCH -p hpc
#SBATCH -t 00:30:00

# -N and -n set by bash script

#DOMAIN INFORMATION
export NUMTHE=375
export NUMRHO=1024
export PIXSIZE=1

#SOLVER DATA
export NUMITER=24

#TILE SIZE (MUST BE POWER OF TWO)
export SPATSIZE=64
export SPECSIZE=64

#BLOCK SIZE
export PROJBLOCK=128
export BACKBLOCK=128

#BUFFER SIZE
export PROJBUFF=64
export BACKBUFF=64

#I/O FILES
export THEFILE=../../data/CDS2_theta.bin
export SINFILE=../../data/CDS2_sinogram.bin
export OUTFILE=../output/recon_CDS2.bin

#SET OpenMP threads to number of cores
export OMP_NUM_THREADS=44

# Source libraries
source /data/compilers/intel20u2/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /data/compilers/intel20u2/impi/2019.8.254/intel64/bin/mpivars.sh
source /data/compilers/intel20u2/mkl/bin/mklvars.sh intel64

mpirun -print-rank-map -ppn 1 -np $1 ../../bin/memxct-cpu

