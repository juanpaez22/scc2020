#Install Gromacs without gpu
#Prerequisites: loaded gcc-9.2.0, impi, cmake
wget http://ftp.gromacs.org/pub/gromacs/gromacs-2020.4.tar.gz
tar -xf gromacs-2020.4.tar.gz
cd gromacs-2020.4 && mkdir build && cd build
cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DGMX_GPU=off -DGMX_MPI=on -DGMX_SIMD=AVX_512 -DGMX_BUILD_UNITTESTS=ON -DGMX_BUILD_OWN_FFTW=ON
make -j10
# REMEMBER TO EXPORT TO PATH
