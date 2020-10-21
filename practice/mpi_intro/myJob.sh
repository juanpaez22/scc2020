#!/bin/bash
#SBATCH -J myjob           # Job name
#SBATCH -o myjob.o%j       # Name of output file
#SBATCH -o myjob.e%j       # Name of output file
#SBATCH -p execute           # Queue (partition) name
#SBATCH -N 3               # Total # of nodes 
#SBATCH -n 6              # Total # of mpi tasks
#SBATCH -t 00:30:00        # Run time (hh:mm:ss)

date
module load gcc-9.2.0
#module load mpi/impi_2018.4.274
module load mpi/impi_2019.8.254
#module load mpi/mvapich2
#export I_MPI_FABRICS=ofa
export I_MPI_FABRICS=ofi

sleep 5
#set -x                     # Echo commands, use "set echo" with csh
#mpirun -np 6 ./impi_2018_hello
mpirun -np 32 ./impi_2019_hello
#mpirun -np 32 ./mvapich2_hello 
