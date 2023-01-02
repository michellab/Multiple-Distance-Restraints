for stage in restrain discharge vanish;
do 
	pushd $stage/output;
	sbatch ../bor_935_somd-gpu.sh;
	popd;
done

