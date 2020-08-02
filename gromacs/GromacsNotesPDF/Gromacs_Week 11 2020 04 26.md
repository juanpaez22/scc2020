# Week 11 - 2020 04 26

# What I did

This week I compiled gromacs for the k40 GPUs, fiddled around with some flags and got some results.

Most of this is in the getting started report.

Sometimes gromacs has weird errors, mostly doing with an incompatible number of MPI ranks. It  talks about changing the decomposition and grid size, but I'm not sure what that means.

# What I will do

- More compiles
- Better benchmarks
- Get a better understanding of what gromacs does, and how the flags work.
- Learn about domain decomposition and grid size.

# Problems

- I couldn't run some of the benchmarks, possibly because of version issues. Will ask David for gromacs code that we had to compile last year at the tut.