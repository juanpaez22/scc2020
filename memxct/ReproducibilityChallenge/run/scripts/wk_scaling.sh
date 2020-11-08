RUN1=$(sbatch -N 4 -n `expr 4 \* 44` ads1.cpu.slurm 44)
sleep 1
RUN2=$(sbatch --dependency=after:$RUN1 -N 2 -n `expr 2 \* 44` ads1.cpu.slurm 44)
sleep 1
sbatch --dependency=after:$RUN2 -N 1 -n 44 ads1.cpu.slurm 44

