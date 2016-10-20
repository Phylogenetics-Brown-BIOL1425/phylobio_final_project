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

mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s concat.phy -n concat_boot100
mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s x16s.phy -n x16s_boot100
mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s x12s.phy -n x12s_boot100


