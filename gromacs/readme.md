# GROMACS

## About
- Molecular dynamics simulation
- Performance measured in ns / day
- Input usually consists of protein topology in solvate
- Algorithm used requries all-to-all processor communication, hinders performance

Conclusions from South African team notes:
- GPU >> CPU (only need 1-4)
- Best build using Intel 2019 compiler, thread mpi, 1 node, 1 GPU
- run line with best performance: gmx mdrun -ntmpi 12 -ntomp 1 -s $bench -noconfout -gpu_id 0123   -nb gpu -update gpu  -bonded gpu -pme gpu -npme 1 -nstlist 400 -nsteps 100000
- no need to edit code
- see notes for benchmark results and build scripts example

## Input files
1. Molecular structure (.gro, if given .pdb need to generate .gro using pdb2gmx command)
2. Force field (.top)
3. Parameters (.mdp)
4. Pre-processed file (.tpr, produced with grompp command)

## Steps to run Gromacs
1. Build gromacs with desired options, compiler, etc. (or use prebuilt on TACC with module load)
2. Pre-process benchmark input (.gro, .top, .mdp) using "grompp" command to produce .tpr file
3. Run simulation using "mdrun" command or "mpirun mdrun". Plenty of command line options for threads, GPU's, nodes, etc.
4. Analyze output-- many files: many outputs including stdout log, .ene energy file, etc. Performance measured in ns/day.

## Benchmarks
/work/06280/mcawood/benchmark_repo/1.5M_water.tar.gz

/work/06280/mcawood/benchmark_repo/adh_cubic.tar.gz

## Tuning Gromacs
Good video: https://www.youtube.com/watch?v=8d8xfw8BZUc
Another: https://www.youtube.com/watch?v=iaPZHzd1nzs&ab_channel=BioExcelCenterofExcellenceforComputationalBiomolecularResearch
- Each system will have its own set of best parameters / architecture. Optimize each system independently.
- Rule of thumb for scaling: max 1 CPU per 100 atoms
- Improve performance with infiniband or omnipath
- Use hybrid approach: MPI and OMP. For small simulations, MPI latency will hurt more than help.
- GPU enabled, but GPU doesn't always speed up single simulations (helps throughput more than performance).
- GPU tied to MPI rank, i.e. there should be as many GPU's as MPI ranks
- Optimization in practice: start with 1 GPU and (#cores/#gpus in node) cores. Next, increase number of GPU's and cores together. Last, try multiple nodes.
- ALWAYS use latest GCC/ICC version & MPI library. Can make up to 25% difference (mostly for CPU nodes).
- Biggest jump in performance/price comes from adding one consumer-class GPU (e.g. GeForce)
- More GPU's than CPU's sockets yield diminishing returns. Invest on another GPU node over more GPU's to existing nodes.

## Single node results:
- 1 CPU / 1 GPU, Gromacs automatic settings give close to optimal performance using thread-MPI (does not include multi-socket CPU nodes)
- threadMPI usually outperforms OpenMP threads (1-2 OMP threads / MPI thread/rank is best)
- GPU increases performance (with a little tuning of OMP/MPI, etc.)


## Multi node results:
- gmx tune_pme useful for determining optimal short range : long range process ratio
- tune OpenMP / MPI threads and ranks.
  - CPU nodes tend to do better with pure MPI (1-2 threads per rank max)
  - GPU nodes tend to do better with several OMP threads / rank (2-6 threads per rank, 4 is a good rule of thumb)
- Scaling limit between 100 and 400 atoms/core
- Infiniband switch improves long range processes (all-to-all communication required).

## mdrun options for perf tuning:
- From: http://manual.gromacs.org/documentation/current/user-guide/mdrun-performance.html
- -np (mpirun option for number of ranks)
- -npme (number of pme specific ranks)
- -ntomp (number of omp threads)
- -ntomp_pme (number of omp threads on pme specific ranks)


## TODO
- Look into improving performance with virtual sites (i.e. dummy atoms-- is that even allowed)
- Determine what options we can and can't configure-- nsteps? dt?
- Practice tuning benchmarks quickly (with fewer timesteps initially), as that may be necessary during the competition
