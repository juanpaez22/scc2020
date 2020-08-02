# Benchmark lignocellulose

# Builds

On the website([https://hpcadvisorycouncil.atlassian.net/wiki/spaces/HPCWORKS/pages/1453719580/Gromacs+Challenge](https://hpcadvisorycouncil.atlassian.net/wiki/spaces/HPCWORKS/pages/1453719580/Gromacs+Challenge)), the suggest the following build:

```bash
wget http://ftp.gromacs.org/pub/gromacs/gromacs-2020.2.tar.gz
tar xfz gromacs-2020.2.tar.gz
cd gromacs-2020.2
# <load compilers and MPI>
mkdir build
cd build
cmake .. -DGMX_FFT_LIBRARY=mkl -DMKL_LIBRARIES=-mkl -DMKL_INCLUDE_DIR=$MKLROOT/include \
        -DGMX_SIMD=AVX2_256 \
        -DGMX_MPI=ON \
        -DGMX_BUILD_MDRUN_ONLY=on \
        -DBUILD_SHARED_LIBS=on \
        -DCMAKE_INSTALL_PREFIX=<install path> \
        -DCMAKE_C_COMPILER=mpicc -DCMAKE_CXX_COMPILER=mpicxx
make -j 16 install
```

# Results

### V1

- **Build** script, referred to as V1

    ```bash
    wget http://ftp.gromacs.org/pub/gromacs/gromacs-2020.1.tar.gz
    tar -xzf gromacs-2020.1.tar.gz

    cd gromacs-2020.1

    # need intel 18, because gromacs doesn't support 19
    module load cmake/3.14.3
    module load gcc/5.5.0
    source /home/mbeukman/intel/2018/parallel_studio_xe_2018.4.057/psxevars.sh
    module load cuda/10.0

    mkdir build
    cd build

    cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON \
    -DCMAKE_INSTALL_PREFIX=/home/mbeukman/otherBenches/gromacs/v1GPU/install \
    -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DGMX_MPI=on -DGMX_GPU=on -DGMX_FFT_LIBRARY=mkl 2>&1 | tee cmake.log
    make -j28 2>&1 | tee make.log
    make check 2>&1 | tee makecheck.log
    make install 2>&1 | tee makeinstall.log
    ```

- makeEnv script

    ```bash
    module load cmake/3.14.3
    module load gcc/5.5.0
    export GMX_MAXBACKUP=1000
    source /home/mbeukman/intel/2018/parallel_studio_xe_2018.4.057/psxevars.sh
    module load cuda/10.0
    export PATH=$PATH:/home/mbeukman/otherBenches/gromacs/v1GPU/install/bin
    ```

- I'm using the following **run** script

    ```bash
    source ../gromacs-2020.1/makeEnv.sh

    procs=${1:-4}
    args=${2:""}
    filename=run-$procs-${args/ /-}".log"

    mpirun -np $procs gmx_mpi mdrun -s lignocellulose-rf.tpr  -gpu_id 01  -nsteps 400 $args  2>&1 | tee logs/$filename
    ```

### V2 →

- Build script

    ```bash
    wget http://ftp.gromacs.org/pub/gromacs/gromacs-2020.1.tar.gz
    tar -xzf gromacs-2020.1.tar.gz

    cd gromacs-2020.1

    # need intel 18, because gromacs doesn't support 19
    module load cmake/3.14.3
    module load gcc/5.5.0
    source /home/mbeukman/intel/2018/parallel_studio_xe_2018.4.057/psxevars.sh
    module load cuda/10.0

    mkdir build
    cd build

    cmake .. -DGMX_BUILD_OWN_FFTW=ON -DREGRESSIONTEST_DOWNLOAD=ON \
    -DCMAKE_INSTALL_PREFIX=/home/mbeukman/otherBenches/gromacs/v2GPU/install \
    -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc -DGMX_THREAD_MPI=on -DGMX_GPU=on -DGMX_FFT_LIBRARY=mkl 2>&1 | tee cmake.log
    make -j28 2>&1 | tee make.log
    make check 2>&1 | tee makecheck.log
    make install 2>&1 | tee makeinstall.log
    ```

- makeEnv script

    ```bash
    module load cmake/3.14.3
    module load gcc/5.5.0
    source /home/mbeukman/intel/2018/parallel_studio_xe_2018.4.057/psxevars.sh
    module load cuda/10.0
    export PATH=$PATH:/home/mbeukman/otherBenches/gromacs/v2GPU/install/bin
    ```

- Run script

    ```bash
    source ../makeEnv.sh

    procs=${1:-4}
    args=${2:-""}
    filename=run-$procs-${args// /-/g}".log"

    gmx mdrun -ntmpi $procs -s lignocellulose-rf.tpr  -gpu_id 01  -nsteps 400 $args  2>&1 | tee logs/$filename
    ```

### V3 → On the V100

- Build script

    ```bash
    module load cmake/3.14.3
    module load gcc/5.5.0
    source /home/mbeukman/intel/2018/parallel_studio_xe_2018.4.057/psxevars.sh
    module load cuda/10.0

    mkdir build
    cd build

    cmake ..  -DREGRESSIONTEST_DOWNLOAD=ON \
     -DGMX_SIMD=AVX_256 \
     -DCMAKE_INSTALL_PREFIX=`pwd`/../install \
     -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc \
     -DGMX_MPI=on -DGMX_GPU=on -DGMX_FFT_LIBRARY=mkl 2>&1 | tee cmake.log
    make -j28 2>&1 | tee make.log
    make check 2>&1 | tee makecheck.log
    make install 2>&1 | tee makeinstall.log
    ```

- Run script

    ```bash
    module load cmake/3.14.3
    module load gcc/5.5.0
    source /home/mbeukman/intel/2018/parallel_studio_xe_2018.4.057/psxevars.sh
    module load cuda/10.0
    source ../install/bin/GMXRC
    which gmx_mpi

    procs=${1:-4}
    args=${2:-""}
    filename=run-$procs-${args// /-/g}".log"

    mpirun -np $procs gmx_mpi mdrun -s lignocellulose-rf.tpr  -gpu_id 0 -nsteps 400 $args  2>&1 | tee logs/$filename
    ```

### V8 - K40 optim

- Build

    ```bash
    cd gromacs-2020.2
    module load cmake/3.14.3
    module load gcc/5.5.0
    source /home/mbeukman/intel/2018/parallel_studio_xe_2018.4.057/psxevars.sh
    module load cuda/10.0

    mkdir build
    cd build
    export CC=icc
    export CXX=icpc
    cmake ..  -DREGRESSIONTEST_DOWNLOAD=ON \
     -DGMX_SIMD=AVX2_256  -DGMX_BUILD_OWN_FFTW=ON \
     -DCMAKE_INSTALL_PREFIX=`pwd`/../install \
     -DCMAKE_C_COMPILER=icc -DCMAKE_CXX_COMPILER=icpc \
     -DGMX_MPI=on -DGMX_GPU=on -DGMX_FFT_LIBRARY=fftw3 2>&1 | tee cmake.log
    make -j28 2>&1 | tee make.log
    make check 2>&1 | tee makecheck.log
    make install 2>&1 | tee makeinstall.log
    ```

- Run

    ```bash
    module load cmake/3.14.3
    module load gcc/5.5.0
    source /home/mbeukman/intel/2018/parallel_studio_xe_2018.4.057/psxevars.sh
    module load cuda/10.0
    source ../install/bin/GMXRC
    which gmx_mpi

    procs=${1:-4}
    args=${2:-""}
    filename=run-$procs-${args// /-/g}".log"

    mpirun -np $procs gmx_mpi mdrun -s lignocellulose-rf.tpr  -gpu_id 01 -nsteps 400 $args  2>&1 | tee logs/$filename
    ```

If not specified, I used nsteps=400

[Results](https://www.notion.so/95fe73fde5324f60bb409b8d1daac4ce)

[Results](https://www.notion.so/ff4b96e6aa38469989b3843862afdf6a)

Most options for -rdd, -dd, and -dds don't change anything noticably

## TODO

Stuff still to do

Read:

- [x]  [http://manual.gromacs.org/current/user-guide/environment-variables.html#performance-and-run-control](http://manual.gromacs.org/current/user-guide/environment-variables.html#performance-and-run-control) → not much useful
- [x]  [http://manual.gromacs.org/current/user-guide/system-preparation.html#tips-and-tricks](http://manual.gromacs.org/current/user-guide/system-preparation.html#tips-and-tricks)
- [x]  [http://manual.gromacs.org/current/user-guide/cmdline.html#commands-by-name](http://manual.gromacs.org/current/user-guide/cmdline.html#commands-by-name)
- [x]  [http://manual.gromacs.org/current/user-guide/mdrun-performance.html](http://manual.gromacs.org/current/user-guide/mdrun-performance.html)
    - [x]  Use -DGMX_SIMD

    ```bash
    The SIMD intrinsic code is compiled by the compiler. Technically, it is possible to compile different levels of acceleration into one binary, but this is difficult to manage with acceleration in many parts of the code. Thus, you need to configure and compile GROMACS for the SIMD capabilities of the target CPU. By default, the build system will detect the highest supported acceleration of the host where the compilation is carried out. For cross-compiling for a machine with a different highest SIMD instructions set, in order to set the target acceleration, the -DGMX_SIMD CMake option can be used. To use a single installation on multiple different machines, it is convenient to compile the analysis tools with the lowest common SIMD instruction set (as these rely little on SIMD acceleration), but for best performance mdrun should be compiled be compiled separately with the highest (latest) native SIMD instruction set of the target architecture (supported by GROMACS).

    ```

    - [x]  Consider building mdrun configured with GMX_SIMD=AVX2_256 instead of GMX_SIMD=AVX512 for better performance in GPU accelerated or highly parallel MPI runs. → NA I don't think the dgxs have the correct instruction set.
    - [x]  Compile with GMX_SIMD=AVX2_256
    - [ ]  **GMX_THREAD_MPI is good for single nodes → i.e. DGX**
    - [ ]  T**he number GPUs used has to match the number of of MPI processes (or thread-MPI threads) the simulation is started with.**
    - [ ]  While the automated CPU-GPU load balancing always attempts to find the optimal cut-off setting, it might not always be possible to balance CPU and GPU workload. This happens when the CPU threads finish calculating the bonded forces and PME faster than the GPU the non-bonded force calculation, even with the shortest possible cut-off. In such cases the CPU will wait for the GPU and this time will show up as Wait GPU local in the cycle and timing summary table at the end of the log file. → we're getting some of this
- [x]  [http://manual.gromacs.org/current/install-guide/index.html#gmx-gpu-support](http://manual.gromacs.org/current/install-guide/index.html#gmx-gpu-support) →
    - [x]  different GPU kernels
- [x]  [http://manual.gromacs.org/documentation/5.1/user-guide/index.html](http://manual.gromacs.org/documentation/5.1/user-guide/index.html)
- [x]  [http://manual.gromacs.org/documentation/5.1/onlinehelp/gmx-mdrun.html](http://manual.gromacs.org/documentation/5.1/onlinehelp/gmx-mdrun.html)
- [ ]  `Generally, there is no advantage in using MKL with GROMACS, and FFTW is often faster.` BUT,
    - [ ]  With PME GPU offload support using CUDA, a GPU-based FFT library is required → Seems like fftw3 doesn't help when running on GPUs?
- [x]  Compile FFTW yourself