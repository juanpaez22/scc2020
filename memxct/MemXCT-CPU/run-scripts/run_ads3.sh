#!/bin/bash

mkdir -p o-files

for CPUS in $@
do
	PROCS=`expr $CPUS \* 16`
	echo "sbatch -N $CPUS -n $PROCS ads3.slurm"
	sbatch -N $CPUS -n $PROCS ads3.slurm
done
