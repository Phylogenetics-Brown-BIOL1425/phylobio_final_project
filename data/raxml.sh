#!/bin/bash

# Request an hour of runtime:
#SBATCH --time=24:00:00

#SBATCH --nodes=1
#SBATCH --tasks-per-node=8

# Specify a job name:
#SBATCH -J MyMPIJob

# Specify an output file
#SBATCH -o MyMPIJob-%j.out
#SBATCH -e MyMPIJob-%j.out

# Run a command

module load raxml

mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s trnKcombined.correct.phy -n trnKcombined_boot100
mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s trnLcombined.correct.phy -n trnLcombined_boot100
mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s ITScombined.correct.phy -n ITScombined_boot100