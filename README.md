# Multiple-Distance-Restraints

Inputs and code to reproduce the results from "Comparison of Receptor-Ligand Restraints Schemes for Alchemical Absolute Binding Free Energy Calculations".

### Example Input

`example_input` contains the input files required to rerun the calculations described. One example is given for each class of calculation. Their corresponding names in the manuscript are:

- bound/boresch : B2
- bound/mdr_naive : M-Hand
- bound/mdr_release : M-Hand-R
- bound/mdr_rigidification : M-Rig
- free : free

Note that mdr_release (M-Hand-R) only contains the input for the release stage (where all the distance restraints but one are turned off) because the restrain, discharge, and vanish stages are identical to mdr_naive (M-Hand). To calculate the free energy of releasing the single remaining distance restraint after the release stage in mdr_release (M-Hand-R), `distance_restraint_cor.ipynb` is provided in the `notebooks` directory. For all other bound leg runs, the correction is calculated automatically after all MD has finished. The parameters required to set up all calculations reported are given in the S.I. of the manuscript. 

The branches of Sire which should be used to reproduce the results are [mdr_paper](https://github.com/michellab/Sire/tree/mdr_paper) and [mdr_paper_lam5](https://github.com/michellab/Sire/tree/mdr_paper_lam5). The latter is identical to the former other than the restraints are scaled with $\lambda^5$ when `turn on receptor-ligand restraints mode = True` is set in `sim.cfg`, rather than linearly with $\lambda$. To reproduce the work reported, scaling with $\lambda^5$ should be used for M-Hand-R and M-Rig, with linear scaling otherwise.

To run the examples:

- Change the slurm settings in each of the relevant bash scripts to suit your configuration
- Ensure you have the correct Sire bin directory in your path
- Run `./run_all.sh` in the desired example directory

Note that when calculating the standard state correction, any permanent restraints (restraints not affected by $\lambda$ when `turn on receptor-ligand restraints mode = True` is set in `sim.cfg`) will not be taken into account for the correction. If you need to work around this, create a dummy `sim.cfg` file where `permanent distance restraints dictionary` is changed to `distance restraints dictionary` or similar for Boresch restraints. For an explanation of all the configuration options which can be changed in `sim.cfg` (including the form of the restraints dictionaries), run `somd-freenrg --help-config`.

### Notebooks

The `notebooks` directory contains:

- distance_restraint_cor.ipynb: Calculates the free energy of releasing a single (harmonic or flat-bottomed) distance restraint
- find_restraints_boresch.ipynb: Selects sets of Boresch restraints from an unrestrained trajectory of the fully-interacting complex, as described in the manuscript. An example trajectory is not provided due to github's file size limit, but we are happy to provide this.
- find_restraints_multiple_distance.ipynb: Selects a single unique harmonic distance restraint for every heavy atom in the ligand from an unrestrained trajectory of the fully-interacting complex, as done for M-Rig (mdr_rigidification above).

Note that an improved version of the restraints selection algorithm has been developed and will be available through [BioSimSpace](https://github.com/michellab/BioSimSpace) soon.

### Issues

If you have any questions or issues, please raise an issue on this repo and we will be happy to help.
