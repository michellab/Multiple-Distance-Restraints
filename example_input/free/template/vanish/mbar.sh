#!/bin/bash
#SBATCH -o analyse-free-nrg-%A.%a.out
#SBATCH -p main
#SBATCH -n 1
#SBATCH --time 01:00:00

#sleep 30 

export OPENMM_PLUGIN_DIR=/home/finlayclark/anaconda3/envs/biosimspace-dev/lib/plugins/

srun /home/finlayclark/anaconda3/envs/biosimspace-dev/bin/analyse_freenrg mbar -i lambda*/simfile.dat -p 83 --overlap --temperature 298.0 > freenrg-MBAR-5ns-overlap.dat

#bzip2 lambda-*/*




