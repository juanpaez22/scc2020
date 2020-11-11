for d in */
do
cd $d
#echo $d
gmx_mpi grompp -f relax.mdp -c em.gro -r em.gro -p topology_NSP3-Xdomain.top -o relax.tpr -maxwarn 2 -n index.ndx 
cd ..
done
