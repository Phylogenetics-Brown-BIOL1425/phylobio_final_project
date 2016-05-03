#! /bin/bash
#SBATCH -J stringency_75
#SBATCH -t 48:00:00
#SBATCH -n 1
#SBATCH --mem=8G

module load raxml

raxmlHPC -f a -s /users/mmoeglei/data/mmoeglei/phylobio/75_outfiles/75.phy -n stringency_75 -m GTRCAT -p 1234 -N 100 -x 1234 -w /users/mmoeglei/data/mmoeglei/phylobio
