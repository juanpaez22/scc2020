#2020-07-24

A place to add notes, compilations, builds, results.

## Nicholas' run-through so far
1. I have been following this link: https://escomp.github.io/CESM/release-cesm2/introduction.html
2. Following this guide, I downloaded CESM2 from the public CESM Github Repo. 
3. To run CESM, the local machine must first either be a machine that is already recognized by CESM (I will explain what this means next), or the local machine
must be ported for CESM
4. There is a maching configuration file in the /cime folder. This file lists all the machines for which CESM is already set up. Stampede2 is one of these machines,
both for its knights landing processors and its cascade lake processores. 
5. I did have to change the output and input folders to my personal scratch directory.
6. If the machine to be used were not in the machine configuration file, then the local machine would have to be "ported."
7. Next, I loaded the relevant packages, including NETCDF, pnetcdf, Trilinos, LAPACK and BLAS, and Cmake. 
8. Enter /scripts and run ./create_newcase where the three parameters are <casename> <compset> and <grid resolution>. The component set is the specific physical components of CESM which will be actively run and will have real data.
9. cd into the case directory and run ./case.setup
10. Run ./case.build
11. Using the xmlchange tool, change the $STOP_OPTION parameter to 'years'. This would look like: ./xmlchange STOP_OPTION=years
12. Then, change $STOP_N to the number of model years you would like to run
13. run ./case.submit
