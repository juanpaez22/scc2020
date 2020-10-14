module load gromacs/2020.1

gmx grompp -f pme_verlet.mdp -c out.gro -p topol.top -o md_0_1.tpr
