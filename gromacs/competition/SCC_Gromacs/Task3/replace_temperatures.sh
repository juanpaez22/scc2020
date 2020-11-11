for dir in P*/
do
echo $dir

sed -i 's/310.00/310.00/g' ${dir}/replica_1/remd.mdp
sed -i 's/310.00/311.77/g' ${dir}/replica_2/remd.mdp
sed -i 's/310.00/313.55/g' ${dir}/replica_3/remd.mdp
sed -i 's/310.00/315.34/g' ${dir}/replica_4/remd.mdp
sed -i 's/310.00/317.13/g' ${dir}/replica_5/remd.mdp
sed -i 's/310.00/318.94/g' ${dir}/replica_6/remd.mdp
sed -i 's/310.00/320.72/g' ${dir}/replica_7/remd.mdp
sed -i 's/310.00/322.54/g' ${dir}/replica_8/remd.mdp
sed -i 's/310.00/324.37/g' ${dir}/replica_9/remd.mdp
sed -i 's/310.00/326.21/g' ${dir}/replica_10/remd.mdp
sed -i 's/310.00/328.05/g' ${dir}/replica_11/remd.mdp
sed -i 's/310.00/329.91/g' ${dir}/replica_12/remd.mdp
sed -i 's/310.00/331.77/g' ${dir}/replica_13/remd.mdp
sed -i 's/310.00/333.64/g' ${dir}/replica_14/remd.mdp
sed -i 's/310.00/335.52/g' ${dir}/replica_15/remd.mdp
sed -i 's/310.00/337.41/g' ${dir}/replica_16/remd.mdp
sed -i 's/310.00/339.31/g' ${dir}/replica_17/remd.mdp
sed -i 's/310.00/341.21/g' ${dir}/replica_18/remd.mdp
sed -i 's/310.00/343.13/g' ${dir}/replica_19/remd.mdp
sed -i 's/310.00/345.05/g' ${dir}/replica_20/remd.mdp
sed -i 's/310.00/346.99/g' ${dir}/replica_21/remd.mdp
sed -i 's/310.00/348.93/g' ${dir}/replica_22/remd.mdp


done

