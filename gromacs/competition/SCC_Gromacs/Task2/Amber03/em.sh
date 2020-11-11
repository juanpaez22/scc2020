# Energy Minimization

input="7C22_amber03"

gmx_mpi grompp -f em.mdp -c ${input}_solv.gro -r ${input}_solv.gro -p ${input}.top -o em.tpr -maxwarn 2
gmx_mpi mdrun -v -deffnm em

