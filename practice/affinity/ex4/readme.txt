
* First experiment: 4 MPI tasks, 17 threads per task
* Logout of idev session.  
* Start new idev session:  idev -n 4 -N 1 -m 15  #(4MPI tasks, single node, 15 min)
  ----------------
Make sure you have amask executables in your path:

module load amask

Set up environment:

export OMP_NUM_THREADS=17
export OMP_PLACES=cores
export OMP_PROC_BIND=spread

ibrun amask_hybrid

   1a.) Note that a PURE MPI mask is reported first,
        so that you can view the mask for each MPI rank.

        This is followed by a  list for the hybrid execution-- it
        shows the threads for each rank.

        At the OpenMP fork, the affinity of the threads can
        only be made from the set bits of the parent MPI process.

        How has each thread mask been modified from
        the parent MPI rank's mask?

        What happends when you use OMP_PLACES=threads?


* Second experiment: increase thread number to 34 threads
  -----------------
export OMP_NUM_THREADS=34

ibrun  amask_hybrid

    2a.)  How many threads are on a core?
    2b.)  How can you EASILY set one thread
          to have the first two SMTs of a core
          and another thread to have the 2nd
          SMTs on a core? (Hint: probably not.)
          Outline how you would do this with
          a place list. 
          Maybe something like: OMP_PLACES='{0,68}:17,{136,204}:17'
          (But you would have to use a script to set the base
           values (0,68,136,204) for each rank.)

* Third experiment: decrease the thread count to 8
  -----------------
export OMP_NUM_THREADS=8
ibrun  amask_hybrid

     3a.) What is the distribution of threads within the MPI mask 

export OMP_PROC_BIND=close
ibrun  amask_hybrid

     3b.) What is the distribution of threads within the MPI mask now?


-- Kent Milfeld 9/24/2016
