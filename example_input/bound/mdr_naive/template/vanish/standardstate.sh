#!/bin/bash
#SBATCH -o standardstate-%A.%a.out
#SBATCH -p GTX1080
#SBATCH -n 1

sleep 30

cd lambda-1.000

srun standardstatecorrection -C ../../input/sim.cfg -r traj000000001.dcd -s 1 -b 5 -d 0.25 -o 30 > ../standard-state-s-1-b-5-d-0.25-o-30.dat

cd ..

wait

