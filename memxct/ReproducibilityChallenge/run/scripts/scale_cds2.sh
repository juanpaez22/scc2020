#!/bin/bash

# Competition dataset 1. Do 4 node job first so we don't spend extra money
# while nodes spin up and configure
RUN1_OUT=$(sbatch -N 4 -n 176 cds2.cpu.slurm 4)
RUN1_NUM=${RUN1_OUT##* }

# 2 node
RUN2_OUT=$(sbatch -N 2 -n 88 --dependency=afterany:${RUN1_NUM} cds2.cpu.slurm 2)
RUN2_NUM=${RUN2_OUT##* }

# 1 node
RUN3_OUT=$(sbatch -N 1 -n 44 --dependency=afterany:${RUN2_NUM} cds2.cpu.slurm 1)
RUN3_NUM=${RUN3_OUT##* }

echo "CDS2 1 node: $RUN3_NUM"
echo "CDS2 2 node: $RUN2_NUM"
echo "CDS2 4 node: $RUN1_NUM"
