#!/bin/bash
#SBATCH -J run_omp            # job name
#SBATCH -e run_omp.%j.err     # error file name 
#SBATCH -o run_omp.%j.out     # output file name 
#SBATCH -N 1                  # request 1 node
#SBATCH -n 1                  # request 1 task 
#SBATCH -p normal             # designate queue 
#SBATCH -t 24:00:00           # designate max run time 
#SBATCH --mail-type=all
#SBATCH --mail-user=juanpaez@utexas.edu


module load gromacs/2020.1
export OMP_NUM_THREADS=2

ibrun -np 28 mdrun_mpi -s md_0_1.tpr -o traj.trr -c confout.gro -e ener.edr -g md.log

