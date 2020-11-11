input="7C22_amber03"

gmx_mpi editconf -f ${input}.gro -o ${input}_boxed.gro -c -d 1.3 -bt cubic
gmx_mpi solvate -cp ${input}_boxed.gro -cs spc216.gro -o ${input}_solv.gro -p ${input}.top


