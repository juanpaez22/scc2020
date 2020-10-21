#!/bin/bash
#SBATCH -J myjob           # Job name
#SBATCH -o myjob.o%j       # Name of output file
#SBATCH -e myjob.e%j       # Name of output file
#SBATCH -p execute           # Queue (partition) name
#SBATCH -N 3               # Total # of nodes 
#SBATCH -n 24              # Total # of mpi tasks
#SBATCH -t 00:30:00        # Run time (hh:mm:ss)

date
module load gcc-9.2.0
#module load mpi/impi_2018.4.274
#module load mpi/impi_2019.8.254
module load mpi/mvapich2
#export I_MPI_FABRICS=ofa
#export I_MPI_FABRICS=ofi
#export I_MPI_FALLBACK=1

sleep 5
#set -x                     # Echo commands, use "set echo" with csh

#ldd impi_2018_hello
#ldd impi_2019_hello
ldd mvapich2_hello
#mpirun -np 16 ./impi_2018_hello
#mpirun -np 16 ./impi_2019_hello
mpirun -np 24 ./mvapich2_hello 
