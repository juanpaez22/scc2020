for d in */
do
cd $d
gmx_mpi grompp -f remd.mdp -c relax.gro -r relax.gro -p topology_NSP3-Xdomain.top -o remd_replex_10.tpr -maxwarn 2 -n index.ndx 
cd ..
done
