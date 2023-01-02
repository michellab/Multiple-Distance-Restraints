cd rigidify/output
sbatch ../somd-gpu.sh
cd ../..

cd restrain/output
sbatch ../somd-gpu.sh
cd ../..

cd unrigidify_lig/output
sbatch ../somd-gpu.sh
cd ../..

cd unrigidify_prot/output
sbatch ../somd-gpu.sh
cd ../..

cd discharge/output
sbatch ../somd-gpu.sh
cd ../..

cd vanish/output
sbatch ../somd-gpu.sh
cd ../..
