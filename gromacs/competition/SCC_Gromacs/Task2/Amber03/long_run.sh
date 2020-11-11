gmx_mpi grompp -f md.mdp -c pr.gro -p 7C22_amber03.top -o md_replica_1 -maxwarn 2
gmx_mpi mdrun -deffnm md_replica_1 -nsteps 2000000 -ntomp 12 -nb gpu -bonded gpu -v

