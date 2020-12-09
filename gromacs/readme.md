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

## Repository contents
- General intro notes from South African ISC team: GromacsNotesPdf directory
- 2 benchmarks to play with can be found in the benchmarks directory
- single node (with and without GPU) test on TACC systems can be found in the single_node directory
- Compilation, prep, and run scripts for Azure CycleCloud can be found in azure_cpu_test directory
- Actual competition scripts and results can be found in the competition directory
  - SCC_Gromacs directory contains actual competition materials and results, except the inputs/outputs themselves (they were too big)
  - cheatsheet.txt: cheat sheet with generic run lines for tasks 1 and 2
  - .out and .err: output files from task 2 molecules (bad performance, but completion was more important for Task 2).
  - tutorial directory: notes from tutorials suggested for competition (see Helpful tutorials section below)
  - reserv_gpu.sh and reserv_cpu.sh: slurm reservation scripts. All tasks were run manually on reserved nodes due to the frequency of errors and length of runs (the scripts simply reserve nodes, produce hostfile.txt for mpirun to use, install htop, and install CUDA if GPU).

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

Note that many cycles of steps 2-3 may be necessary if doing relaxation, energy minimization, and production simulations. Outputs from one will be inputs to another. See helpful tutorials below.

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
- GPU increases performance (with a little tuning of OMP/MPI, etc.). Using -nb gpu and -bonded gpu usually yields close to optimal performance.

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
- -nb/-bonded (use GPU or CPU for bonded/non-bonded tasks)

## Helpful tutorials
1. http://www.mdtutorials.com/gmx/: tutorials 1 and 3 help understand parameters, analysis, etc. Single most helpful resource for the competition.
2. http://www.gromacs.org/@api/deki/files/209/=tutorial.pdf: temperature replica exhange tutorial, helpful for Task 3

## Notes & Conclusions from Competition
- Gromacs was the “impossible task” for this competition; however, most points were based on completion, not performance. We took advantage of this due to our faulty networking on GPU queues.
- My approach was to accumulate as many points in as little time with as few nodes as possible (received ~4.3/17.5, which was top 3). The full instructions are included in the instructions.pdf file.
  - Task 1 asked for scaling comparisons of different molecules based on CPU and GPU. It was not worth many points, but it required literally hundreds of simulations. Therefore, I completely skipped Task 1.
  - Task 2 involved fewer, but longer simulations. Points were awarded for completion and performance, as well as analysis of gyration radius, hbonds, etc. (see competition/cheatsheet.txt). I ran one long simulation for each molecule and performed analysis on the results.
  - Task 3 involved temperature replica exchange simulations. Many points were awarded for the preparation and the -replex 100 simulations, so I only did those.
- Tips for future competitions
  - Always use GPU's if you can. Limit to 1 GPU per 1-2 ranks (add more ranks before adding more GPUs).
  - Test your networking ahead of time! Bad networking WILL be a bottleneck in your simulations (our GPU queues had terrible bandwidth, so we had to use CPU queues instead)
  - Compile both GPU and CPU versions of Gromacs just in case
  - If using a single node, use only one rank and many OMP/threadMPI threads to avoid the network altogether.
  - Familiarize yourself with the parameters in .mdp files, as well as the purpose of all kinds of inputs/outputs (.itp, .top, .tpr, .edr, .gro, etc...). Getting these wrong, or not specifying the right flags, can and will cause errors (note Gromacs 2020 uses -r in grompp to specify restraints-- this is not mentioned in the tutorials)
  - Maximize points/(time and cost). Know when to stop and dedicate resources to other applications.
  - nvidia-smi and htop are extremely useful tools for knowing whether your run line was efficient or not (all resources should be used almost all the time)
