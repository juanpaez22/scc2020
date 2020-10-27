#!/bin/bash

. /data/compilers/intel20u2/compilers_and_libraries_2020/linux/bin/compilervars.sh -arch intel64 -platform linux

export MPICC=mpiicc
export MPICXX=mpiicpc
export MPIF90=mpiifort
export CFLAGS='-g -O2 -fPIC'
export CXXFLAGS='-g -O2 -fPIC'
export FFLAGS='-g -fPIC'
export FCFLAGS='-g -fPIC'
export FLDFLAGS='-fPIC'
export F90LDFLAGS='-fPIC'
export LDFLAGS='-fPIC'

tar -xf pnetcdf-1.12.1.tar.gz && cd pnetcdf-1.12.1
./configure --prefix=/data/pnetcdf/pnetcdf-1.12.1 --enable-fortran --enable-large-file-test
make -j8 install

PATH=/data/pnetcdf/pnetcdf-1.12.1/bin:$PATH ; export PATH                                                  
