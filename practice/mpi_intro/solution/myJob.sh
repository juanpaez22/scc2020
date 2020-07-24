#!/bin/bash
#SBATCH -J myjob           # Job name
#SBATCH -o myjob.o%j       # Name of stdout output file
#SBATCH -e myjob.e%j       # Name of stdout output file
#SBATCH -p test1          # Queue (partition) name
#SBATCH -N 2               # Total # of nodes 
#SBATCH -n 16              # Total # of mpi tasks
#SBATCH -t 00:10:00        # Run time (hh:mm:ss)
#SBATCH -A A-ccsc          # Allocation name (req'd if you have more than 1)

set -x                     # Echo commands, use "set echo" with csh
#ibrun ./mpiExample1  # Run the MPI executable named <executable name>
./pi2G
./pi2M
ibrun ./ppi2G
ibrun ./ppi2M
ibrun ./ppi2T
#ibrun ./test
