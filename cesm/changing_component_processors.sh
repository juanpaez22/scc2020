# This script explains how to adjust the number of processors attributed to each component
# First, this is how you get there:

cd my_cesm_sandbox/cime/scripts/B1850_2    # Check if this is right
# Check for the tasks of each component

./xmlquery NTASKS_LND  # Number of tasks for land
./xmlquery NTHREADS_LND # Number of threads
./xmlquery ROOTPE_LND   # Check which global MPI task land starts on

# Next, check how a past run faired on a given number of tasks by looking at the timing script

cd timing
cat timing.cesm.1850_2....

