for leg in restrain discharge vanish;
do 
	pushd $leg/output;
	sbatch ../bor_935_somd-gpu.sh;
	popd;
done

