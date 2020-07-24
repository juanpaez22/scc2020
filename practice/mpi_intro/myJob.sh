#!/bin/bash
#SBATCH -J myjob           # Job name
#SBATCH -o myjob.o%j       # Name of output file
#SBATCH -p test1          # Queue (partition) name
#SBATCH -N 2               # Total # of nodes 
#SBATCH -n 16              # Total # of mpi tasks
#SBATCH -t 00:30:00        # Run time (hh:mm:ss)
#SBATCH -A A-ccsc          # Allocation name (req'd if you have more than 1)

ml

#set -x                     # Echo commands, use "set echo" with csh
ibrun ./mpiex1big  # Run the MPI executable named <executable name>
