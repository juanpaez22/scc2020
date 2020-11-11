for i in {1..22}
do
mkdir Relax/replica_$i
cp em.mdp Relax/replica_$i
cp relax.mdp Relax/replica_$i
cp topology_NSP3-Xdomain.top Relax/replica_$i
cp inputCoordinates.gro Relax/replica_$i
cp -r toppar Relax/replica_$i

done
