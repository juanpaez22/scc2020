#!/bin/bash

#SBATCH -J memxct-cpu
#SBATCH -o ../output/memxct-cpu.o%j
#SBATCH -e ../output/memxct-cpu.e%j
#SBATCH -p hpc
#SBATCH -t 01:00:00
#SBATCH -N 4
#SBATCH -n 176

export OMP_NUM_THREADS=44

# Source libraries
source /data/compilers/intel20u2/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /data/compilers/intel20u2/impi/2019.8.254/intel64/bin/mpivars.sh
source /data/compilers/intel20u2/mkl/bin/mklvars.sh intel64

# For each dataset, source its files and do mpiruns

# CDS1
source vars/cds1.sh
echo "--- CDS1: 4 nodes ---"
mpirun -print-rank-map -ppn 1 -np 4 ../../bin/memxct-cpu

echo ""
echo "--- CDS1: 2 nodes ---"
mpirun -print-rank-map -ppn 1 -np 2 ../../bin/memxct-cpu

echo ""
echo "--- CDS1: 1 node ---"
mpirun -print-rank-map -ppn 1 -np 1 ../../bin/memxct-cpu

# CDS2
source vars/cds2.sh
echo ""
echo "--- CDS2: 4 nodes ---"
mpirun -print-rank-map -ppn 1 -np 4 ../../bin/memxct-cpu

echo ""
echo "--- CDS2: 2 nodes ---"
mpirun -print-rank-map -ppn 1 -np 2 ../../bin/memxct-cpu

echo ""
echo "--- CDS2: 1 node ---"
mpirun -print-rank-map -ppn 1 -np 1 ../../bin/memxct-cpu

# CDS3
source vars/cds3.sh
echo ""
echo "--- CDS3: 4 nodes ---"
mpirun -print-rank-map -ppn 1 -np 4 ../../bin/memxct-cpu

echo ""
echo "--- CDS3: 2 nodes ---"
mpirun -print-rank-map -ppn 1 -np 2 ../../bin/memxct-cpu

echo ""
echo "--- CDS3: 1 node ---"
mpirun -print-rank-map -ppn 1 -np 1 ../../bin/memxct-cpu

