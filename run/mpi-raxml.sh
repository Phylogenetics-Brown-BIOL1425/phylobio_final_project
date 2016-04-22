#!/bin/bash

# Request two days of runtime:
#SBATCH --time=48:00:00

# Use 1 node with 8 tasks, for 8 MPI tasks:
#SBATCH --nodes=1
#SBATCH --tasks-per-node=8

# Specify a job name:
#SBATCH -J MPITemnospondyls

# Specify an output file
#SBATCH -o MPITemnospondyls-%j.out
#SBATCH -e MPITemnospondyls-%j.out

# Run a command

module load raxml

mpirun -n 8 raxmlHPC -f a -x 12345 -p 12345 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K GTR -n Temnospondyls.seed1.GTR.boot100
mpirun -n 8 raxmlHPC -f a -x 34372 -p 34372 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K GTR -n Temnospondyls.seed2.GTR.boot100
mpirun -n 8 raxmlHPC -f a -x 27119 -p 27119 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K GTR -n Temnospondyls.seed3.GTR.boot100
mpirun -n 8 raxmlHPC -f a -x 12345 -p 12345 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K KM -n Temnospondyls.seed1.KM.boot100
mpirun -n 8 raxmlHPC -f a -x 34372 -p 34372 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K KM -n Temnospondyls.seed2.KM.boot100
mpirun -n 8 raxmlHPC -f a -x 27119 -p 27119 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K KM -n Temnospondyls.seed3.KM.boot100
mpirun -n 8 raxmlHPC -f a -x 12345 -p 12345 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K ORDERED -n Temnospondyls.seed1.ORDERED.boot100
mpirun -n 8 raxmlHPC -f a -x 34372 -p 34372 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K ORDERED -n Temnospondyls.seed1.ORDERED.boot100
mpirun -n 8 raxmlHPC -f a -x 27119 -p 27119 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K ORDERED -n Temnospondyls.seed1.ORDERED.boot100