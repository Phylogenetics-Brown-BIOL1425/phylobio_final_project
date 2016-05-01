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

mkdir GTR
cd GTR
mkdir seed1
mkdir seed2
mkdir seed3
cd ..

mkdir MK
cd MK
mkdir seed1
mkdir seed2
mkdir seed3
cd ..

mkdir ORDERED
cd ORDERED
mkdir seed1
mkdir seed2
mkdir seed3
cd ..

module load raxml
mpirun -n 8 raxmlHPC -f a -x 12345 -p 12345 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K GTR -n Temnospondyls.seed1.GTR.boot100
mv *.boot100 GTR/seed1/
mpirun -n 8 raxmlHPC -f a -x 34372 -p 34372 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K GTR -n Temnospondyls.seed2.GTR.boot100
mv *.boot100 GTR/seed2/
mpirun -n 8 raxmlHPC -f a -x 27119 -p 27119 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K GTR -n Temnospondyls.seed3.GTR.boot100
mv *.boot100 GTR/seed3/
mpirun -n 8 raxmlHPC -f a -x 12345 -p 12345 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K MK -n Temnospondyls.seed1.MK.boot100
mv *.boot100 MK/seed1/
mpirun -n 8 raxmlHPC -f a -x 34372 -p 34372 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K MK -n Temnospondyls.seed2.MK.boot100
mv *.boot100 MK/seed2/
mpirun -n 8 raxmlHPC -f a -x 27119 -p 27119 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K MK -n Temnospondyls.seed3.MK.boot100
mv *.boot100 MK/seed3/
mpirun -n 8 raxmlHPC -f a -x 12345 -p 12345 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K ORDERED -n Temnospondyls.seed1.ORDERED.boot100
mv mv *.boot100 ORDERED/seed1/
mpirun -n 8 raxmlHPC -f a -x 34372 -p 34372 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K ORDERED -n Temnospondyls.seed2.ORDERED.boot100
mv mv *.boot100 ORDERED/seed2/
mpirun -n 8 raxmlHPC -f a -x 27119 -p 27119 -N 100 -m MULTIGAMMA -s Temnospondyls.phy -K ORDERED -n Temnospondyls.seed3.ORDERED.boot100
mv mv *.boot100 ORDERED/seed3/