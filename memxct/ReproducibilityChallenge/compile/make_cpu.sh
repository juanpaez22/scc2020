source /data/compilers/intel20u2/compilers_and_libraries/linux/bin/compilervars.sh intel64
source /data/compilers/intel20u2/impi/2019.8.254/intel64/bin/mpivars.sh
source /data/compilers/intel20u2/mkl/bin/mklvars.sh intel64

# Make commands
make versions
make clean
rm ./cpu-vec/*
make cpu

# Move vectorization reports to subdir 
mv ../src/cpu/*.optrpt ./cpu-vec/

