#!/bin/bash

sudo yum install -y cmake
module load mpi/impi
sudo yum install -y netcdf
sudo yum install -y lapack
sudo sh build_pnetcdf.sh
