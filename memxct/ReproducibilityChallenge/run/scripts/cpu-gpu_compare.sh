# Launch GPU job
sbatch -N 1 ads1.gpu.slurm

# Launch CPU job
sbatch -N 1 -n 44 ads1.cpu.slurm 44

