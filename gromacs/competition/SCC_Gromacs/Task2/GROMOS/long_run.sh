gmx_mpi grompp -f md.mdp -c pr.gro -p 7C22_GROMOS.top -o md_replica_1 -maxwarn 2
#mpirun -np 1 -ppn 1 -hostfile /data/ccuser/scc2020/gromacs/competition/SCC_Gromacs/Task2/GROMOS/hostfile.txt gmx_mpi mdrun -deffnm md_replica_1 -nsteps 2000000 -ntomp 12 -nb gpu -bonded gpu -v
gmx_mpi mdrun -deffnm md_replica_1 -nsteps 2000000 -ntomp 12 -nb gpu -bonded gpu -v
