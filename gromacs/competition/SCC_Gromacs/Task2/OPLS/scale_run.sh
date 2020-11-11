input="7C22_OPLS"

#for np in {20..50..10}
#do
np=50
for i in {1..3}
do
echo "************************************************** STARTING RUN $i WITH $np RANKS **************************************************"
gmx_mpi grompp -f md.mdp -c pr.gro -p ${input}.top -o md_scale_${np}_${i} -maxwarn 2
mpirun -np $np -ppn 11 -hostfile /data/ccuser/scc2020/gromacs/competition/hostfile.txt gmx_mpi mdrun -deffnm md_scale_${np}_${i} -nsteps 10000 -ntomp 4 -dlb yes -tunepme yes -v
done
#done
