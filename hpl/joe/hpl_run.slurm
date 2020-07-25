#!/bin/bash
#SBATCH -J myjob           # Job name
#SBATCH -o myjob.o%j       # Name of stdout output file
#SBATCH -e myjob.e%j       # Name of stderr error file
#SBATCH -p test1      # Queue (partition) name
#SBATCH -N 2               # Total # of nodes 
#SBATCH -n 96              # Total # of mpi tasks
#SBATCH -t 01:30:00        # Run time (hh:mm:ss)
#SBATCH -A A-ccsc       # Allocation name (req'd if you have more than 1)

# Other commands must follow all #SBATCH directives...

module list
pwd
date

# Launch MPI code... 
#ensuring i'm in the correct directory
cd /scratch/03930/jag7548/workspace/scc2020/hpl/joe/intel_linpack 
#check whats inside this script
./runme_intel64_dynamic 
