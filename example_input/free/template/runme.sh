for leg in discharge vanish;
do
	pushd $leg/output;
	sbatch ../somd-gpu.sh;
	popd;
done

