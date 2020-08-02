# Week 12 - 2020 05 03

# What I did

This week I did some more runs on the ethanol benchmark (in the getting started doc), tried to do some optimisations (optimization doc) and started working on the competition benchmark (Benchmark lignocellulose doc).

On the more runs front, I found that using a thread MPI build, and running only on one node is better than using an MPI build and running on one node. But two nodes MPI > one node threadMPI This seems to be corroborated by the gromacs docs. This won't normally be too useful, but **If we're running on a single DGX, then it will be very nice to use the thread mpi version instead.**

I also tried to do some research about how gromacs works, and how the command line arguments change that. I Haven't been too successful, but I think I understand a bit more about how gromacs works.

The new benchmark is pretty cool, but it seems to go quite a bit slower than the ethanol one.

A few things I found:

- Running with more steps gives a better ns/day (Maybe because the first few steps are tuning steps)
- nstlist might be something to fiddle with.
- The thread mpi build has slightly better scores.
- Running with 8 or 6 MPI procs seems to be pretty good.

# What I will do

- Research More
- In the build, use -DGMX_SIMD
- There is quite a lot of stuff to research in the benchmark lignocellulose doc.
- Try different parameters.

# Problems

- Changes don't seem too massive.
- Not really sure which parameters to fiddle about with.