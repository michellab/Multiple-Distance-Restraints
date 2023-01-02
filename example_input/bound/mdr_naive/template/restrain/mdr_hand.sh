#!/bin/bash
#SBATCH -o somd-array-gpu-%A.%a.out --exclude=node02
#SBATCH -p GTX1080
#SBATCH -n 1
#SBATCH --gres=gpu:1
#SBATCH --time 24:00:00
#SBATCH --array=0-5

module load cuda

echo "CUDA DEVICES:" $CUDA_VISIBLE_DEVICES

lamvals=( 0.000 0.125 0.250 0.375 0.500 1.000 )
lam=${lamvals[SLURM_ARRAY_TASK_ID]}

echo "lambda is: " $lam

mkdir lambda-$lam
cd lambda-$lam

srun somd-freenrg -C ../../input/sim.cfg -l $lam -p CUDA
cd ..

if [ "$SLURM_ARRAY_TASK_ID" -eq "5" ]
then
  wait
  sleep 30
  sbatch ../mbar.sh
fi

