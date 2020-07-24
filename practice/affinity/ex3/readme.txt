* First experiment: 68 threads, 68 places, each place a core
*                   Use "core" view (default) to observe the mask
*                   (that is, use amask_omp without -vk)
  ----------------
export OMP_NUM_THREADS=68
export OMP_PROC_BIND=spread

export OMP_PLACES=cores

amask_omp

    1a.)  How many SMTs are set for each core for a prarticular thread-id



* Second experiment: change the abstract name to threads
  -----------------
export OMP_PLACES=threads

amask_omp

    a.)  What is the difference between using
         threads and cores as the abstract name?

    b.) What would the results look like in kernel view mode?
        If you don't know, extend your terminal to a width
        of 286, and execute amask_omp -vk


* Third  experiment: experiment with options
  ----------------
Execute amask_omp 
Execute with -pf  (print fast)

amask_omp   
amask_omp  -pf


-- Kent Milfeld 9/24/2016
