# GROMACS


## South African Team Notes
https://www.notion.so/GROMACS-2835ff1b331c4bf1b0585b2832ce9283

Conclusions:
- GPU >> CPU (only need 1-4)
- Best build using Intel 2019 compiler, thread mpi, 1 node, 1 GPU
- run line with best performance: gmx mdrun -ntmpi 12 -ntomp 1 -s $bench -noconfout -gpu_id 0123   -nb gpu -update gpu  -bonded gpu -pme gpu -npme 1 -nstlist 400 -nsteps 100000


## Steps to run Gromacs
1. Build gromacs with desired options, compiler, etc. (or use prebuilt on TACC with module load)
2. Pre-process benchmark input using "grompp" command
3. Run the application simulation using the "mdrun" command. Performance results will be presented at the end in ns/day.
