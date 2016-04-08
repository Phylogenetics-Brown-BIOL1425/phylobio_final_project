# Phylogenetic Biology - Final Project
___
# **Phylogenetic Reconstruction of the Evolution of Protein B** 

**Project done in collaboration with** *Chitan Modi* and *Isaiah Bryant* from the *Weinreich lab*. 

## Introduction and Goals

Our project seeks to study evolutionary relationships among different families Proteins B and their relationship to their sister of family A. Studies of Protein B suggests 4 major classes of protein B (B-a, B-b, B-c, B-d). Each one of these classes has distinctive and characteristic catalitic chemistry. However they are all descendants from Protein A. This projects seeks to resolve the origin of each class of protein B with the respect to proteins A. In other words, what and when particular classes of protein A gave rise to each class of protein B. Understading the evolution of protein B is important as this protein has applications in medicine and health.  
   
We will generate phylogenetic reconstructions using Both ML and Bayesian approaches using thousands of amino acid sequences from proteins A and B. We will also map Physicochemical traits of the proteins on the tree to gain a greater understading of functional evolution. 

The amino acid data will be obtained from the MEROPS data base (Rawlings et al. 2016), an online data base for pepdidases maintained by the wellcome trust sanger institute. MSAs

## Methods

Sequences from Proteins A and B were downloaded from MEROPS (https://merops.sanger.ac.uk/cgi-bin/family_index?type=P#S). Multiple sequence alignments (MSA) were performed in PROMALIS3D (http://prodata.swmed.edu/promals3d/promals3d.php). Protein identities were anonymized using an R script (Scripts 1 and 2). Nexus files were generated using mesquite (https://github.com/MesquiteProject/MesquiteCore). Phylogenetic reconstructions were constructed using bayesian inference in RevBayes (version of March 2016; http://revbayes.github.io). MSAs were filtered using GBlocks (http://molevol.cmima.csic.es/castresana/Gblocks.html) using parameters as defined in Table 1.

**Table 1: Parameters using for GBlock MSA filtering**
Trim Parameters are as Follows: 
1. Minimum Number Of Sequences For A Conserved Position:  
2. Minimum Number Of Sequences For A Flank Position: 
3. Maximum Number Of Contiguous Nonconserved Positions:  
4. Minimum Length Of A Block:
5. Allowed Gap Positions:

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

###Unix Portion

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
###R Portion
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

## Results

The tree in Figure 1...

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References

Rawlings, N.D., Barrett, A.J. & Finn, R.D. (2016) Twenty years of the MEROPS database of proteolytic enzymes, their substrates and inhibitors. Nucleic Acids Res 44, D343-D350.
