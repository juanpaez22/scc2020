#!/bin/bash

#SBATCH -J memxct-gpu
#SBATCH -o ../output/memxct-gpu.o%j
#SBATCH -e ../output/memxct-gpu.e%j
#SBATCH -p gpu
#SBATCH -t 01:00:00
#SBATCH -N 1
#SBATCH -n 12

#export OMP_NUM_THREADS=12

source /data/compilers/intel20u2/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /data/compilers/intel20u2/impi/2019.8.254/intel64/bin/mpivars.sh
source /data/compilers/intel20u2/mkl/bin/mklvars.sh intel64

./get_node_ips.py

# Prepare nodes w/ CUDA
sudo yum -y install pdsh
pdsh -w ^hostfile.txt /data/ccuser/scc2020/memxct/ReproducibilityChallenge/run/scripts/prep-gpu.sh

# For each dataset, source its files and do mpiruns

# CDS1
source vars/cds1.sh
echo "--- CDS1: 4 nodes ---"
#mpirun -print-rank-map -ppn 2 -np 8 ../../bin/memxct-gpu

echo ""
echo "--- CDS1: 2 nodes ---"
#mpirun -print-rank-map -ppn 2 -np 4 ../../bin/memxct-gpu

echo ""
echo "--- CDS1: 1 node ---"
#mpirun -print-rank-map -ppn 2 -np 2 ../../bin/memxct-gpu

echo ""
echo "--- CDS1: 1 GPU ---"
mpirun -print-rank-map -ppn 1 -np 1 ../../bin/memxct-gpu

# CDS2
source vars/cds2.sh
echo ""
echo "--- CDS2: 4 nodes ---"
#mpirun -print-rank-map -ppn 2 -np 8 ../../bin/memxct-gpu

echo ""
echo "--- CDS2: 2 nodes ---"
#mpirun -print-rank-map -ppn 2 -np 4 ../../bin/memxct-gpu

echo ""
echo "--- CDS2: 1 node ---"
#mpirun -print-rank-map -ppn 2 -np 2 ../../bin/memxct-gpu

echo ""
echo "--- CDS2: 1 GPU ---"
mpirun -print-rank-map -ppn 1 -np 1 ../../bin/memxct-gpu

# CDS3
source vars/cds3.sh
echo ""
echo "--- CDS3: 4 nodes ---"
#mpirun -print-rank-map -ppn 2 -np 8 ../../bin/memxct-gpu

echo ""
echo "--- CDS3: 2 nodes ---"
#mpirun -print-rank-map -ppn 2 -np 4 ../../bin/memxct-gpu

echo ""
echo "--- CDS3: 1 node ---"
#mpirun -print-rank-map -ppn 2 -np 2 ../../bin/memxct-gpu

echo ""
echo "--- CDS3: 1 GPU ---"
mpirun -print-rank-map -ppn 1 -np 1 ../../bin/memxct-gpu



