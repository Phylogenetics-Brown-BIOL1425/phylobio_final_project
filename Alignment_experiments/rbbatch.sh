#!/bin/bash
#SBATCH -n 4
#SBATCH -t 24:00:00
#SBATCH --mem=16G

module load git
module load revbayes

rb 0_1.Rev


