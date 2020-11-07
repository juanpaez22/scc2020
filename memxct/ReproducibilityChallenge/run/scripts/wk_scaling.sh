#sbatch -N 4 -n `expr 4 \* 44` ads1.slurm 44
RUN1=$(sbatch -N 4 -n `expr 4 \* 44` ads1.slurm 44)
#sbatch -N 1 -n 44 ads1.slurm 44

