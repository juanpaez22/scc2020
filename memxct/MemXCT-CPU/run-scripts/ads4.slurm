#!/bin/bash

#SBATCH -J memxct-ads1
#SBATCH -o ./o-files/memxct-ads4.o%j
#SBATCH -e ./o-files/memxct-ads4.e%j
#SBATCH -p normal
#SBATCH -t 00:30:00

# -N and -n will be set by bash script

#DOMAIN INFORMATION
export NUMTHE=2400
export NUMRHO=2048
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
export THEFILE=../datasets/ADS4_theta.bin
export SINFILE=../datasets/ADS4_sinogram.bin
export OUTFILE=./o-files/recon_ADS4.bin

export OMP_NUM_THREADS=16

ibrun ../memxct
