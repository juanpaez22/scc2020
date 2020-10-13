#!/bin/bash
#SBATCH -J run_basic          # job name
#SBATCH -e run_basic.%j.err   # error file name 
#SBATCH -o run_basic.%j.out   # output file name 
#SBATCH -N 1                  # request 1 node
#SBATCH -n 16                 # request all cores 
#SBATCH -p execute            # designate queue 
#SBATCH -t 24:00:00           # designate max run time 


gmx_mpi mdrun -s md_0_1.tpr -o traj.trr -c confout.gro -e ener.edr -g md.log

