#include <stdio.h>
#include "mpi.h"

int main(int argc,char *argv[]) {
  int i, sum, sumTotal, upToVal;
  int start, end, size, rank;

  upToVal = 100000;

  MPI_Init(&argc,&argv);
  MPI_Comm_size(MPI_COMM_WORLD, &size);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);

  start = rank*(upToVal/size) + 1;
  if(rank == (size - 1)) {
    end = upToVal;
  } else {
    end = start + (upToVal / size) - 1;
  }
  sum = 0;
  sumTotal = 0;
  for(i = start; i <= end; i++){
    sum = sum +i;
  }
	
  //Replace the MPI_Reduce routine with MPI_Allreduce. See the lecture slides for details on the routine
  //if you wanna try the above you can referene the all reduce call here: https://www.mpich.org/static/docs/v3.2.x/www3/MPI_Allreduce.html
  //it's very similar to this call. try this one first so you know what the right answer looks like
  MPI_Reduce (&sum, &sumTotal, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD );

  printf("\nRank: %d, sum: %d, sumTotal: %d, start: %d, end: %d\n", rank, sum, sumTotal, start, end);
	
  MPI_Finalize();
	
  return 0;
}

//this program has each rank that is spawned create a sum given a start and end value. all sums from each rank are added together with the MPI_Reduce 
