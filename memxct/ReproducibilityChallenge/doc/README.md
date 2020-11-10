This file should include:
  Description of contents of artifact
  Instructions on how to run/view/use each part of artifact
  How to compare the artifact's output w/ wotput presented in MemXCT paper
  Final reproducibility report in .pdf
# Artifcat Documentation

## `bin` directory
This directory holds both `memxct-cpu` and `memxct-gpu`, which are executables
for their respective architecture. Nothing else goes in this directory.

## `compile` directory
The `compile` directory holds scripts for compiling the code in to the
the exectuables for CPU and GPU code. It also contains information on the
vectorization of the compilation in the `cpu-vec` and `gpu-vec` directories.
Finally, the `env` directory has information about each of the nodes used to
run the executables. To compile the code, use the `make_cpu.sh` and
`make_gpu.sh` scripts. Be mindful that you will need to source your own
compilers since the paths to the sourced ones will be broken.

## `data` directory
This directory conatins the competition datasets. Run scripts go here to find
the datasets when executing the code.

## `doc` directory
This directory which contains this file, describing other parts of the artifact
and how to use them.

## `figures` directory
The `figures` directory contains two subdirectories. The `scripts` subdirectory
takes the output from run scripts and generates images for recreating the
figures from the original paper. The `output` subdirectory contains figures
that result from running scripts from the aforementioned directory.

## `run` directory
This directory contains both run scripts and their raw output and log files.
The `scripts` subdirectory contains everything needed to run the executable,
provided `bin/` and `data/` contain the appropriate files. These are run by
calling `sbatch cpu.slurm` or `sbatch gpu.slurm` which in turn call or source
other scripts in the directory. Then, the output is put by slurm into the
`output` subdirectory, which includes output logs, error logs, and
`recon\_CDSX.bin` files.

## `src` directory
This directory is the collection of source files from the original repository.
The `cpu` and `gpu` subdirectories contain the CPU and GPU source code,
respectively. These are used in the `compile` directory.

