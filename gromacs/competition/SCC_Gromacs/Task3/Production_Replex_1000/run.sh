mpirun -np 22 -ppn 22 -host /data/ccuser/scc2020/gromacs/competition/hostfile.txt gmx_mpi mdrun -v -ntomp 2 -multidir replica_1 replica_11 replica_13 replica_15 replica_17 replica_19 replica_20 replica_22 replica_4 replica_6 replica_8 replica_10 replica_12 replica_14 replica_16 replica_18 replica_2 replica_21 replica_3 replica_5 replica_7 replica_9 -deffnm remd_replex_1000 -replex 1000

