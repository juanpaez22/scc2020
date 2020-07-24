* First experiment: Proc_Bind = close
  ----------------

export OMP_NUM_THREADS=4
export OMP_PLACES='{0},{4},{8},{12},{16},{20},{24},{28}'
export OMP_PROC_BIND=close

amask_omp -vk | cut -c 1-61

    a.) What proc-ids do the 4 thread land on?
    b.) What are the core-ids? 
    c.) Which SMT threads of a core do they occupy?


* Second experiment: Proc_Bind = spread
  -----------------
export OMP_PROC_BIND=spread

amask_omp -vk | cut -c 1-61

    a.) What proc-ids do the 4 thread land on?
    b.) What are the core-ids? 
    c.) Which SMT threads of a core do they occupy?

* Third experiment:  top | htop view
  -----------------

   a.) Open a second window from laptop to stampede2
   b.) from second window ssh to idev's comput node
   
     $  ssh cxxx-xxx 
        ...
     $ top             # hit the 1 key, then hit the t key

     # IN IDEV WINDOW execute amask with a 15 second load on threads
     # Observe locations in top
     $ amask_omp -kv -w 15 | cut -c 1-61
      
     #instead of top, use htop
 
     $ ~train00/bin/htop  (htop labels proc-id 0-271 as 1-272)

-- Kent Milfeld 9/24/2016
