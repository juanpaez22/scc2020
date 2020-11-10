# `compile` Directory

## Instructions
To compile, use either the `make_cpu.sh` or `make_gpu.sh` scripts that source
relevant compilers and call the make targets.

## Changes from given makefile
We also added `-axCORE-AVX512,AVX2` to our `CXXFLAGS` to handle the two
vectorizations of our cluster in the CPU and GPU nodes we are using.
The GPU flags largely remain unchanged.

## Compilers used
* `CXX`: Intel `mpiicpc`
  * icpc (ICC) 19.1.2.254 20200623
* `NVCC`: NVIDIA Cuda compiler driver
  * Built on Mon\_Oct\_12\_20
  * release 11.1, V11.1.105

## Software dependencies
sourcing the Intel compilers on our cluster and using the cuda compiler gives us
all the dependencies we need

## Vectorization report
When using either one of the make scripts, the makefile will automatically
generate a vectorization report, which will then be moved into either `vec-cpu`
or `vec-gpu` subdirectories.

## System information
In the `env` subdirectory, there is a script that gathers system information.
This script is run on the master node, the cpu nodes, and the gpu nodes
utilized.

