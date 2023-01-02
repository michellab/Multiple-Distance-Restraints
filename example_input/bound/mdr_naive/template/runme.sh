for stage in restrain discharge vanish;
do 
	pushd $stage/output;
	sbatch ../mdr_hand.sh;
	popd;
done
