# Create and build new case using an example case

cd CESM_ROOT/cime/scripts/
./create_newcase --case B1850_2 --compset B1850 --res f09_g17

# Change various xml parameters about the case
# e.g. the time requested form slurm

./xmlchange JOB_WALLCLOCK_TIME=01:00:00

# Enable the rerun option by changing the resubmit command to the number of resubmits you want
# This is a very useuful way of breaking up a large job into a series of smaller jobs
./xmlchange RESUBMIT=10
./xmlchange 

# change number of tasks, global mpi rank, and threads for each component
# This run has 8 different components, but not all runs do

# atmosphere
./xmlchange NTASKS_ATM=480  
./xmlchange NTHRDS_ATM=1
./xmlchange ROOTPE_ATM=0

# Ocean
./xmlchange NTASKS_OCN=144  
./xmlchange NTHRDS_OCN=1
./xmlchange ROOTPE_OCN=480

# Land
./xmlchange NTASKS_LND=480  
./xmlchange NTHRDS_LND=1
./xmlchange ROOTPE_LND=0

# Wave
./xmlchange NTASKS_WAV=48  
./xmlchange NTHRDS_WAV=1
./xmlchange ROOTPE_WAV=0

# Glacier
./xmlchange NTASKS_GLC=48  
./xmlchange NTHRDS_GLC=1
./xmlchange ROOTPE_GLC=48

# ROF
./xmlchange NTASKS_ROF=48  
./xmlchange NTHRDS_ROF=1
./xmlchange ROOTPE_ROF=96

# Ice
./xmlchange NTASKS_ICE=96  
./xmlchange NTHRDS_ICE=1
./xmlchange ROOTPE_ICE=144

# Coupler
./xmlchange NTASKS_CPL=240  
./xmlchange NTHRDS_CPL=1
./xmlchange ROOTPE_CPL=240


# Change how the simulated time with two variables:
# stop_option specifies the time type e.g days, weeks, months, years

./xmlchange STOP_OPTION=years

# stop_n specifies the number of that time that this model will simulate
# the model starts in the eyar 1850. Change stop_option=years and 
# stop_n=100 to simulate the model until 1950. 

./xmlchange STOP_N=100


# Now you can setup and build the case

./case.setup

# Preview the case to see if the batch command is correct with:
./preview_run

# If good, build the case
./case.build

# Submit
./case.submit


