for stage in discharge vanish;
do
	pushd $stage/output;
	sbatch ../somd-gpu.sh;
	popd;
done

