#!/bin/bash
#SBATCH -J run_more_steps          # job name
#SBATCH -e run_more_steps.%j.err   # error file name 
#SBATCH -o run_more_steps.%j.out   # output file name 
#SBATCH -N 1                  # request 1 node
#SBATCH -n 1                  # request 1 task 
#SBATCH -p normal             # designate queue 
#SBATCH -t 24:00:00           # designate max run time 
#SBATCH --mail-type=all
#SBATCH --mail-user=juanpaez@utexas.edu

module load cuda
module load gromacs/2020.1

gmx mdrun -s md_0_1.tpr -o traj.trr -c confout.gro -e ener.edr -g md.log -nsteps 200000

