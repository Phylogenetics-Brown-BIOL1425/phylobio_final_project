#!/bin/bash

# Request an hour of runtime:
#SBATCH --time=24:00:00

#SBATCH --nodes=1
#SBATCH --tasks-per-node=8

# Specify a job name:
#SBATCH -J RaxmlRun1

# Specify an output file
#SBATCH -o MyMPIJob-%j.out
#SBATCH -e MyMPIJob-%j.out

# Run a command

module load raxml

mpirun -n 8 raxmlHPC-MPI -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s alignments/gpt.phy -n gpt_100
mpirun -n 8 raxmlHPC-MPI -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s alignments/gpt2.phy -n gpt2_100
#mpirun -n 8 raxmlHPC-MPI -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s alignments/gpt_protein.phy -n gpt_protein_100
#mpirun -n 8 raxmlHPC-MPI -f a -x 12345 -p 12345 -N 100 -m GTRGAMMA -s alignments/gpt2_protein.phy -n gpt2_protein_100

mv gpt* results
