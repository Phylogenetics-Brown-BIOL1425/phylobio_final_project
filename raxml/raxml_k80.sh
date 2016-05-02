#!/bin/bash

# Request 1 day of runtime:
#SBATCH --time=24:00:00

#SBATCH --nodes=1
#SBATCH --tasks-per-node=8

# Specify a job name:
#SBATCH -J MyMPIJob

# Specify an output file
#SBATCH -o MyMPIJob-%j.out
#SBATCH -e MyMPIJob-%j.out

# Run a command

module load raxml/8.2.0

mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 1000 -m GTRGAMMA -s DQA_Outgroup2.phy -n DQA_Outgroup2_GTRGAMMA_boot1000
mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 1000 -m GTRGAMMA --K80 -s DQA_Outgroup2.phy -n DQA_Outgroup2_K80_boot1000

mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 1000 -m GTRGAMMA -s DQA_Lepus.phy -n DQA_Lepus_K80_boot1000
mpirun -n 8 raxmlHPC-MPI  -f a -x 12345 -p 12345 -N 1000 -m GTRGAMMA --K80 -s DQA_Lepus.phy -n DQA_Lepus_K80_boot1000