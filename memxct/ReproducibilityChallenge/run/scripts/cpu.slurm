#!/bin/bash

#SBATCH -J memxct-cpu
#SBATCH -o ../output/memxct-cpu.o%j
#SBATCH -e ../output/memxct-cpu.e%j
#SBATCH -p hpc
#SBATCH -t 01:00:00
#SBATCH -N 1
#SBATCH -n 44

export OMP_NUM_THREADS=22

# Source libraries
source /data/compilers/intel20u2/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /data/compilers/intel20u2/impi/2019.8.254/intel64/bin/mpivars.sh
source /data/compilers/intel20u2/mkl/bin/mklvars.sh intel64

# For each dataset, source its files and do mpiruns

MAX_PROCS=1

# CDS1
#source vars/cds1.sh cpu
#for (( n=1; n<=$MAX_PROCS; n*=2 ))
#do
#	echo ""
#	echo "--- CDS1: $n procs ---"
#	mpirun -print-rank-map -ppn 2 -np $n ../../bin/memxct-cpu
#done


# CDS2
source vars/cds2.sh cpu
for (( n=1; n<=$MAX_PROCS; n*=2 ))
do
	echo ""
	echo "--- CDS2: $n procs ---"
	mpirun -print-rank-map -ppn 2 -np $n ../../bin/memxct-cpu
done


# CDS3
#source vars/cds3.sh cpu
#for (( n=1; n<=$MAX_PROCS; n*=2 ))
#do
#	echo ""
#	echo "--- CDS3: $n procs ---"
#	mpirun -print-rank-map -ppn 2 -np $n ../../bin/memxct-cpu
#
#done

