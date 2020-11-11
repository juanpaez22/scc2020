# Equilibration

input="7C22_Amber99SB-ILDN"

# Relaxation
gmx_mpi grompp -f pr.mdp -c em.gro -r em.gro -p ${input}.top -o pr.tpr -maxwarn 2
gmx_mpi mdrun -v -deffnm pr

