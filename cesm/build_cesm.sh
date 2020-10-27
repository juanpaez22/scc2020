#!/bin/bash

sudo yum install -y cmake
module load mpi/impi
sudo yum install -y netcdf
sudo sh build_pnetcdf.sh
