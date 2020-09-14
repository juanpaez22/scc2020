#!/bin/bash
#SBATCH -J run_gpu            # job name
#SBATCH -e run_gpu.%j.err     # error file name 
#SBATCH -o run_gpu.%j.out     # output file name 
#SBATCH -N 1                  # request 1 node
#SBATCH -n 12                 # request all tasks 
#SBATCH -p rtx-dev            # designate queue 
#SBATCH -t 02:00:00           # designate max run time 
#SBATCH --mail-type=all
#SBATCH --mail-user=juanpaez@utexas.edu

module load cuda
module load gromacs/2020.1

export OMP_NUM_THREADS=12
export CUDA_VISIBLE_DEVICES=0
ibrun -np 1 mdrun_mpi_gpu -s md_0_1.tpr -o traj.trr -c confout.gro -e ener.edr -g md.log


