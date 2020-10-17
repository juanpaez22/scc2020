The scripts here serve to compile and run gromacs on CycleCloud with Slurm (WIP).
Notes
- For some reason, it is RIDICULOUSLY slow. adh_cubic won't finish, and when I kill it, it clocks 0.041 ns/day (61 on Frontera).
- Compiled with AVX_512 architecture. Is this correct?
