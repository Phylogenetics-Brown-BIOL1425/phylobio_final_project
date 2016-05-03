#! /bin/bash
#SBATCH -J st98
#SBATCH -t 48:00:00
#SBATCH -n 1
#SBATCH --mem=8G

module load raxml
raxmlHPC -f a -s /users/mmoeglei/data/mmoeglei/phylobio/st98_outfiles/98.phy -n stringency_98 -m GTRCAT -p 1234 -N 100 -x 1234 -w /users/mmoeglei/data/mmoeglei/phylobio
