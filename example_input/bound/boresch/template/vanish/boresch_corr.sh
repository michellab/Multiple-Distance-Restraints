#!/bin/bash
#SBATCH -o boresch_analytical_correction-%A.%a.out
#SBATCH -p GTX1080
#SBATCH -n 1
#SBATCH --time 24:00:00

sleep 30 

srun boresch_numerical_correction -C ../input/sim.cfg --verbose > boresch_numerical_correction.dat

cd ..

wait


