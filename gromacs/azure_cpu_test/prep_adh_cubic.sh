module load gromacs/2020.1
module load cuda
gmx grompp -f pme_verlet.mdp -c conf.gro -p topol.top -o md_0_1.tpr
