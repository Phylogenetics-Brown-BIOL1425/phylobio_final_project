# Phylogenetic Biology - Final Project
___

# General introduction 

The primary goal of these projects is to apply the knowledge and tools acquired in phylogenetic biology to problems in ecology and evolution. This project has 2 parts, both centered in the use of three topology for inferring evolutionary relationship among and between taxa, these parts differ in the scale of evolutionary relationship of interest and the type of information used for the inference. 

Part 1, titled "phylogenetic reconstruction of demographic structure in admixed populations", uses phylogenetic methods to unravel demographic signals in a complete chromosome compared to individual genes within the chromosome. This part looks at short evolutionary scales and its primarily intersted in the topology leading to the population members as the tips of the phylogeny. DNA sequences were used for this part of the project, and at its core, it is comparison of "chromosomal/concatenated locus trees" vs. "gene trees".     

Part 2, tiled "Phylogenetic Reconstruction of the Evolution of Protein B" seeks to reconstruct the evolutionary history of two putatively sister taxa of protein (A and B). This project looks at long evolutionary times and thus it is interested in investigating the topology and potential branch length leading to the different protein families (tips). Due to long divergence, nucleotide level signal is highly convoluted, thus, I will use protein level sequences. 

#Part 1: **"Phylogenetic reconstruction of demographic structure in admixed populations"**

## Introduction and Goals

Your favorite marine organism inhabits the eastern seaboard of some contient. Ecological conditions across the eastern seaboard of some continent are variable thus your favorite organism is exposed to a drastic range of ecological conditions. The demographic history of this organism is characterized by historical phylogenetic break occurring at the height of Middlecity (Figure 1). This phylogenetic break is likely due to a vicariance event occurring  recently in geologic time. 



![Figure 1](https://rawgit.com/Jcbnunez/phylobio_final_project/master/model_system.png "Figure 1 Ecology of your favorite Marine Organism")

*Figure 1:* Left - A "map" of the sampled populations correlated with the dominant haplogroup. Right - a putative topology of a phylogeny including populations of the 2 major haplogroups and a sister taxa of your favorite marine organism.    

This historical event has a very distinct demographic signal occurring in the chromosome K such that organism south of the break have a particular set of haplogroups and viceversa for the north. However, populations of your favorite marine organism living close to Middelcity town show a conspicuous introgression pattern such that about 50% of organisms living in this area show either a discrete northern or discrete southern haplogroup (Figure 2). In other words, demographic signals from chromosome K tend to split the middlecity populaiton in 2 groups that cluster with organisms living miles appart rather than reconstructing a single population even thought gene flow  among middlecity seems to be unrestricted.

This project will utilize phylogenetic reconstruction methods to unravel the demographic signal of chromosome K in a gene-by-gene fashion and investigate what gene(s) recapitulate the demographic signal.  

![Figure 2](https://rawgit.com/Jcbnunez/phylobio_final_project/master/cline_network_phylo.png "Figure 2 Maximun Parsimony Network with full chromosome haplotypes of  your favorite Marine Organism")

*Figure 2:* a maximun parsimony haplotype network with individuals from all populations and the outgroup.  

## Methods

## Results

## Discussion


#Part 2: **"Phylogenetic Reconstruction of the Evolution of Protein B"** 

**Project done in collaboration with** *Chitan Modi* and *Isaiah Bryant* from the *Weinreich lab*. 

## Introduction and Goals

Our project seeks to study evolutionary relationships among different families Proteins B and their relationship to their sister of family A. Studies of Protein B suggests 4 major classes of protein B (B-a, B-b, B-c, B-d). Each one of these classes has distinctive and characteristic catalitic chemistry. However they are all descendants from Protein A. This projects seeks to resolve the origin of each class of protein B with the respect to proteins A. In other words, what and when particular classes of protein A gave rise to each class of protein B. Understading the evolution of protein B is important as this protein has applications in medicine and health.  
   
We will generate phylogenetic reconstructions using Both ML and Bayesian approaches using thousands of amino acid sequences from proteins A and B. We will also map Physicochemical traits of the proteins on the tree to gain a greater understading of functional evolution. 

The amino acid data will be obtained from the MEROPS data base (Rawlings et al. 2016), an online data base for pepdidases maintained by the wellcome trust sanger institute. MSAs

## Methods

Sequences from Proteins A and B were downloaded from MEROPS (https://merops.sanger.ac.uk/cgi-bin/family_index?type=P#S). Multiple sequence alignments (MSA) were performed in PROMALIS3D (http://prodata.swmed.edu/promals3d/promals3d.php). Protein identities were anonymized using an R script (Scripts 1 and 2; provided in the supplement). Nexus files were generated using mesquite (https://github.com/MesquiteProject/MesquiteCore). Phylogenetic reconstructions were constructed using bayesian inference in RevBayes (version of March 2016; http://revbayes.github.io). MSAs were filtered using GBlocks (http://molevol.cmima.csic.es/castresana/Gblocks.html) using parameters as defined in Table 1.

**Table 1:** *Parameters using for GBlock MSA filtering: 1. Minimum Number Of Sequences For A Conserved Position, 2. Minimum Number Of Sequences For A Flank Position, 3. Maximum Number Of Contiguous Nonconserved Positions, 4. Minimum Length Of A Block, 5. Allowed Gap Positions.*

|  Family |  1 |  2 |  3 | 4 |  5  | Blocks Kept | %Filtering |
|:-------:|:--:|:--:|:--:|:-:|:---:|:-----------:|:----------:|
| S11.001 | 36 | 36 | 10 | 6 | All |     388     |     19     |
| S11.002 | 84 | 84 | 20 | 6 | All |     295     |     32     |
| S11.005 | 94 | 94 | 20 | 6 | All |     380     |     16     |
| S12.003 | 83 | 83 | 30 | 6 | All |     379     |     24     |
| S12.009 | 60 | 60 | 40 | 6 | All |     344     |     15     |
| S12.A21 | 17 | 20 | 20 | 6 | All |     297     |     25     |
| S12.A23 | 27 | 27 | 40 | 6 | All |     235     |     37     |
| S12.A28 |  5 |  5 | 50 | 6 | All |     300     |     25     | 


## Results

The tree in Figure 1...

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References

Rawlings, N.D., Barrett, A.J. & Finn, R.D. (2016) Twenty years of the MEROPS database of proteolytic enzymes, their substrates and inhibitors. Nucleic Acids Res 44, D343-D350.

## Supplement 

###Unix Code

```{sh}
#Script 1 - Data wrangling in Unix

#Deposit all Fasta files obtained from MEROPS in a single folder
# cd to folder containing Fasta sequences
#make sequences one line
mkdir ./1_continious_FASTAs
files=(*.fasta)
#echo ${files[@]}
for i in "${files[@]}"
do awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < $i > ./1_continious_FASTAs/$i.continuouslines.fasta
done


mkdir ./2_Linearized_Fastas
#Generarate array with original files
cd ./1_continious_FASTAs
files=(*.fasta)
echo ${files[@]}

#Linearizing Fasta
for i in "${files[@]}"
do paste -d "\t" <(awk 'NR%2==1' $i) <(awk 'NR%2==0' $i) > ../2_Linearized_Fastas/$i.linerized.txt
done
```
###R Code

```{r, eval=FALSE}
#Script 2 - Annomizing Data in R

#!/usr/bin/env Rscript
#Script name = TabFastaIndexer.r
#This scrip aims at changeing the names of a tabulated/linerized fasta file for index names
#takes two arguments "args", [1] = infile, [2] = outfile

args = commandArgs(trailingOnly=TRUE)

# test if there is at least one argument: if not, return an error
if (length(args)==0) {
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
} else if (length(args)==1) {
  # default output file
  args[2] = "out.txt"
}

##Script

DF = read.delim2(args[1], header = F)

DF$V1 = paste(args[1],1:nrow(DF), sep = "_")

write.table(DF, file = args[2], col.names = F, row.names = F, quote = F )

```
