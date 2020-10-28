The scripts here serve to compile and run gromacs on CycleCloud with Slurm (WIP).
Notes
- Compile with AVX_512 architecture
- htop useful to analyze: sudo yum install -y epel-release, sudo yum install -y htop
- best result on single node with no GPU (used wrong arch): 7.6 ns/day (was 61 on Frontera-- improve!)
- to try: multiple nodes, AVX_512 arch, GPU install
- line with best performance on 2 nodes with 44 cores: mpirun gmx_mpi mdrun -s md_0_1.tpr -o traj.trr -c confout.gro -e ener.edr -g md.log -v -npme 40 -dlb yes -tunepme no
