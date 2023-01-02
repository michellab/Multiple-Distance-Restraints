for stage in rigidify restrain unrigidify unrigidify_lig unrigidify_prot discharge vanish;
do
	pushd $stage/output;
	sbatch ../somd-gpu.sh;
	popd;
done

