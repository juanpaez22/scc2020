ml cmake
ml intel/19.0.5
ml cuda/10.1
wget http://ftp.gromacs.org/pub/gromacs/gromacs-2020.3.tar.gz
cd gromacs-2020.3 && mkdir build && cd build
cmake .. -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx -DGMX_GPU=on -DGMX_MPI=on -DGMX_SIMD=AVX2_256 -DGMX_BUILD_UNITTESTS=ON -DGMX_BUILD_OWN_FFTW=ON
make -j10
export PATH=/path/to/bin:$PATH
