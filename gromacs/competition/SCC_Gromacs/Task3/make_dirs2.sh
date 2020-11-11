for replex in 1 2 10 100 1000
do
for i in {1..22}
do
mkdir Production_Replex_${replex}/replica_$i
cp topology_NSP3-Xdomain.top Production_Replex_${replex}/replica_$i
cp Relax/replica_$i/relax.gro Production_Replex_${replex}/replica_$i
cp Relax/replica_$i/index.ndx Production_Replex_${replex}/replica_$i
cp -r toppar Production_Replex_${replex}/replica_$i
cp remd.mdp Production_Replex_${replex}/replica_$i

done
done
