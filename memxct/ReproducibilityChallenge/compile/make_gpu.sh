# source
source /data/compilers/intel20u2/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /data/compilers/intel20u2/impi/2019.8.254/intel64/bin/mpivars.sh
source /data/compilers/intel20u2/mkl/bin/mklvars.sh intel64
#export PATH=$PATH:/usr/local/cuda-10.2/bin
export PATH=$PATH:/usr/local/cuda-11.1/bin

make versions
make clean
rm ./gpu-vec/*
make gpu

# Move vectorizatoin reports to this subdir
mv ../src/gpu/*.optrpt ./gpu-vec/
