#!/bin/bash

#SBATCH -J memxct-ads2
#SBATCH -o ./o-files/memxct-ads2.o%j
#SBATCH -e ./o-files/memxct-ads2.e%j
#SBATCH -p normal
#SBATCH -t 00:15:00

# -N and -n will be set by bash script

#DOMAIN INFORMATION
#NUMTHE and NUMRHO will be set by run script
export PIXSIZE=1

#SOLVER STAT
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
export THEFILE=../datasets/ADS2_theta.bin
export SINFILE=../datasets/ADS2_sinogram.bin
export OUTFILE=./o-files/recon_ADS2.bin

ibrun ../memxct

