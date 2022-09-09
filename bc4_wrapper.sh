#!/bin/bash
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --mem 3570
#SBATCH --time=01:00:00
#SBATCH --partition=test
set -euo pipefail

module load apps/singularity/3.8.3

singularity exec \
--no-mount home \
--bind /user/home/ml18692/projects:/user/home/ml18692/projects \
--pwd `pwd` \
/user/home/ml18692/projects/varGWAS/sim/vargwas-sim.sif \
Rscript "$@"