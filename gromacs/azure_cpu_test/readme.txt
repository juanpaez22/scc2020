The scripts here serve to compile and run gromacs on CycleCloud with Slurm (WIP).
Notes
- Compile with AVX_512 architecture
- htop useful to analyze: sudo yum install -y epel-release, sudo yum install -y htop
- best result on single node with no GPU (used wrong arch): 7.6 ns/day (was 61 on Frontera-- improve!)
- to try: multiple nodes, AVX_512 arch, GPU install
