#!/bin/bash

# Competition dataset 1

# Prepare gpu nodes with prepare.gpu.slurm
PREP_OUT=$(sbatch -N 4 -n 48 prepare.gpu.slurm)
PREP_NUM=${PREP_OUT##* }

# 4 node
RUN1_OUT=$(sbatch -N 4 -n 48 --dependency=afternay:${PREP_NUM} cds1.gpu.slurm 4)
RUN1_NUM=${RUN1_OUT##* }

# 2 node
RUN2_OUT=$(sbatch -N 2 -n 24 --dependency=afterany:${RUN1_NUM} cds1.gpu.slurm 2)
RUN2_NUM=${RUN2_OUT##* }

# 1 node
RUN3_OUT=$(sbatch -N 1 -n 12 --dependency=afterany:${RUN2_NUM} cds1.gpu.slurm 1)
RUN3_NUM=${RUN3_OUT##* }

echo "CDS1 1 node: $RUN3_NUM"
echo "CDS1 2 node: $RUN2_NUM"
echo "CDS1 4 node: $RUN1_NUM"
