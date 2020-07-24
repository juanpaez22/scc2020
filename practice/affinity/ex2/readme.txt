* First experiment: 8 threads with 8 places; each place is 2 HW threads
  ----------------

export OMP_NUM_THREADS=8
export OMP_PLACES='{0,68},{1,69},{2,70},{3,71},{4,72},{5,73},{6,74},{7,75}'
export OMP_PROC_BIND=spread

amask_omp -vk | cut -c 1-120

   1a.) What is the difference between the views? (Hint: kernel and core)
   1a.) How could you change these to allow a 
        process to execute on SMT-0 and SMT-2?
   1b.) What would you use for SMT-0, SMT-1, SMT-2, and SMT-3?



* Second experiment: increase to 16 threads
  -----------------
export OMP_NUM_THREADS=16

amask_omp -vk | cut -c 1-120


   2a.) What has happen in the distribution?
   2b.) Is it round-robin?


* Third experiment: use 12 threads
  -----------------
export OMP_NUM_THREADS=12
amask_omp -vk | cut -c 1-120

   3a.) Would you expect this, knowning the results of 2a?


* Fourth experiment:  explore OMP_DISPLAY_ENV
  -----------------
export OMP_NUM_THREADS=8
export OMP_DISPLAY_ENV=1
amask_omp 

   4a.) What does DISPLAY_ENV do?
   4b.) Set places to something incorrect, e.g.

      export OMP_PLACES='{0,68}{1,69}{2,70}{3,71}{4,72}{5,73}{6,74}{7,75}'

-- Kent Milfeld 9/24/2016
