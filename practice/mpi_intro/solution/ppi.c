#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>
#define f(x)   ( 4.0e0 / (1.0e0 + (x)*(x)) )

#define MASTER 0

#include "mpi.h"

double mysecond();

int main(int argc, char *argv[])
{

  double PI25DT = 3.141592653589793238462643e0;

  double  tim_min[3], tim_max[3];
  double  pi, h, sum, x, t0,t1,t2,tim[3],tim_tot[3];
  double     n, i, ierr;

  int     irank, nrank;
  double  part_pi;
 
  char line[12];

  ierr = MPI_Init(&argc, &argv);
  ierr = MPI_Comm_rank(MPI_COMM_WORLD, &irank);
  ierr = MPI_Comm_size(MPI_COMM_WORLD, &nrank);


  if(irank == MASTER)
    n = 2000000000000;
  
  ierr = MPI_Bcast(&n, 1, MPI_INT, MASTER, MPI_COMM_WORLD);
  
  h    = 1.0e0/n;           /* Calculate the interval size */
  sum  = 0.0e0;

  t0 = mysecond();
  for(i = irank+1; i <= n; i = i + nrank) {
    x = h * ( (double)(i) - 0.5e0 );
    sum = sum + f(x);
  }

  part_pi = h * sum;

  t1 = mysecond();

  ierr = MPI_Reduce(&part_pi, &pi, 1, MPI_DOUBLE, MPI_SUM, 
                      MASTER, MPI_COMM_WORLD);
  
  t2 = mysecond();

  tim[0] = t1-t0;
  tim[1] = t2-t1;
  tim[2] = t2-t0;

  ierr = MPI_Reduce(&tim, &tim_tot, 3, MPI_DOUBLE, MPI_SUM, 
                       MASTER, MPI_COMM_WORLD);
  if(irank==MASTER){
     printf(" calc. pi:%20.16f  Error:%20.16f \n", pi, pi - PI25DT );
     printf(" int(avg): %13.9f \n red(avg): %13.9f \n Total:    %13.9f\n",
              tim_tot[0]/nrank, tim_tot[1]/nrank, tim_tot[2]/nrank); 
  }

  MPI_Finalize();
  return(0);
}

double mysecond() {
  struct timeval tp;
  struct timezone tzp;
  int i;
  i = gettimeofday(&tp,&tzp);
  return ( (double) tp.tv_sec + (double) tp.tv_usec * 1.e-6 );
}


/* http://www-unix.mcs.anl.gov/mpi/www/ */
