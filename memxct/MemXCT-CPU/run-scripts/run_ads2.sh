#!/bin/bash

mkdir -p o-files

CORES=68
BASE_THETA=750
BASE_RHO=512

if [[ $# == 2 ]]; then

	NODES=$1

	# Export processes to run script
	PROCS=`expr $NODES \* $CORES`

	FACTOR=$2

	NTHETA=`expr $BASE_THETA \* $FACTOR`
	NRHO=`expr $BASE_RHO \* $FACTOR`

	# export env and batch
	echo "NUMTHE=$NTHETA"
	export NUMTHE=$NTHETA

	echo "NUMRHO=$NRHO"
	export NUMRHO=$NRHO

	echo "sbatch -N $NODES -n $PROCS ads2.slurm"
	sbatch -N $NODES -n $PROCS ads2.slurm
else
	echo "Please put 2 arguments"
	echo "./run_ads.sh <n_CPUS> <SCALE_FACTOR>"
fi
