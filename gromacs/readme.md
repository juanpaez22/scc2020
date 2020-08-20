# GROMACS

## About
- Molecular dynamics simulation
- Performance measured in ns / day
- Input usually consists of protein topology in solvate
- Algorithm used requries all-to-all processor communication, hinders performance

## South African Team Notes
https://www.notion.so/GROMACS-2835ff1b331c4bf1b0585b2832ce9283

Conclusions:
- GPU >> CPU (only need 1-4)
- Best build using Intel 2019 compiler, thread mpi, 1 node, 1 GPU
- run line with best performance: gmx mdrun -ntmpi 12 -ntomp 1 -s $bench -noconfout -gpu_id 0123   -nb gpu -update gpu  -bonded gpu -pme gpu -npme 1 -nstlist 400 -nsteps 100000
- no need to edit code
- see notes for benchmark results and build scripts example


## Steps to run Gromacs
1. Build gromacs with desired options, compiler, etc. (or use prebuilt on TACC with module load)
2. Pre-process benchmark input using "grompp" command
3. Run the application simulation using the "mdrun" command. Performance results will be presented at the end in ns/day.

## Benchmarks
/work/06280/mcawood/benchmark_repo/1.5M_water.tar.gz

/work/06280/mcawood/benchmark_repo/adh_cubic.tar.gz

## Tuning Gromacs
Good video: https://www.youtube.com/watch?v=8d8xfw8BZUc
- Each system will have its own set of best parameters / architecture. Optimize each system independently.
- Rule of thumb for scaling: max 1 CPU per 100 atoms
- Improve performance with infiniband or omnipath
- Use hybrid approach: MPI and OMP. For small simulations, MPI latency will hurt more than help.
- GPU enabled, but GPU doesn't always speed up single simulations (helps throughput more than performance).
- GPU tied to MPI rank, i.e. there should be as many GPU's as MPI ranks
- Optimization in practice: start with 1 GPU and (#cores/#gpus in node) cores. Next, increase number of GPU's and cores together. Last, try multiple nodes.
