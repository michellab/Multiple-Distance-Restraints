#!/bin/bash
#SBATCH -o somd-array-gpu-%A.%a.out
#SBATCH -p GTX980
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --time 24:00:00
#SBATCH --array=0-7

module load cuda

echo "CUDA DEVICES:" $CUDA_VISIBLE_DEVICES

lamvals=( 0.000 0.143 0.286 0.429 0.571 0.714 0.857 1.000 )
lam=${lamvals[SLURM_ARRAY_TASK_ID]}

echo "lambda is: " $lam

mkdir lambda-$lam
cd lambda-$lam

srun somd-freenrg -C ../../input/sim.cfg -l $lam -p CUDA
cd ..

if [ "$SLURM_ARRAY_TASK_ID" -eq "7" ]
then
  wait
  sleep 30
  sbatch ../mbar.sh
fi

