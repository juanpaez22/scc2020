# Launch GPU job
sbatch -N 1 ads1.gpu.slurm

# Launch CPU job
# One node, 1 mpi rank, 44 procs
sbatch -N 1 -n 44 ads1.cpu.slurm 1 44

