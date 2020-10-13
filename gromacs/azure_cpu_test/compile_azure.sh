# Install CMake
wget https://cmake.org/files/v3.12/cmake-3.12.3.tar.gz
tar -zxvf cmake-3.12.3.tar.gz
cd cmake-3.12.3
sudo ./bootstrap --prefix=/usr/local
sudo make
sudo make install
export PATH=/usr/local/bin:$PATH:$HOME/bin
cmake --version
cd ..

wget http://ftp.gromacs.org/pub/gromacs/gromacs-2020.3.tar.gz
tar -xf gromacs-2020.3.tar.gz
cd gromacs-2020.3 && mkdir build && cd build
cmake .. -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DGMX_GPU=off -DGMX_MPI=on -DGMX_SIMD=AVX2_256 -DGMX_BUILD_UNITTESTS=ON -DGMX_BUILD_OWN_FFTW=ON
make -j10
export PATH=/path/to/bin:$PATH
