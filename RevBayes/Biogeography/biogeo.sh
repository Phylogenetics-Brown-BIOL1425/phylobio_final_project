#!/bin/bash

# Request two hours of runtime:
#SBATCH --time=2:00:00

# Use 1 node with 8 tasks, for 8 MPI tasks:
#SBATCH --nodes=1
#SBATCH --tasks-per-node=8

# Specify a job name:
#SBATCH -J TemnospondylsBiogeography

# Specify an output file
#SBATCH -o TemnospondylsBiogeography-%j.out
#SBATCH -e TemnospondylsBiogeography-%j.out

# Run a command

module load revbayes
rb Biogeography.Rev
