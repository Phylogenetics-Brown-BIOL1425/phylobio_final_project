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
Data for this project corresponds to real anonymized sequencing data from various populations of *your favorite marine organism.* Sequencing data was assembles to high coverage and mapping quality standards to a reference sequence of chromosome K available in NCBI. Data was anonymized using scripts 1, 2, and 3 (see supplement). Monomorphic and singleton (parsimony non-informative) locus were filtered using TASSEL 5 (http://www.maizegenetics.net/#!tassel/c17q9). Nexus files were built in SEAVIEW (http://www.molecularevolution.org/software/alignment/seaview). As opposed to MESQUITE, SEAVIEW outputs revbayes ready NEXUS files.

Phylogenetic reconstructions were conducted in revbayes (rb) version 1.00 (March 2016) using two types of runs: heavy and light. Heavy runs were computationally expensive with 4 independent searches and 100,000 generations. Light runs were computationally moderate with only 2 searches and 30,000 generations. For both types of runs, searches were conducted in independent nodes of the OSCAR computer cluster using the MPI version of revbayes (rb-mpi; rb scripts 4 and 5 are also included in the supplement). A major advantage of RevBayes is its modular nature allowing phylogenetic reconstruction to be informed by different assumptions and models: rate matrix(figure 3), among site variation(figure 4), tree topology (Figure 5), and the phylogenetic MCMC model (Figure 6).

The original vision of this project was to compare the chromosomal tree with each individual gene tree in the molecule. However, given time constrains, this project will present a 'Lite' version of the original vision focusing on the comparison of the  

#####Figure 3: Rate matrix
![Figure 3](https://rawgit.com/Jcbnunez/phylobio_final_project/master/rate_matrix.png "Figure 3 Rate Matrix")
___

#####Figure 4: Site Variation
![Figure 4](https://rawgit.com/Jcbnunez/phylobio_final_project/master/among_sites_rate.png "Figure 4 Site Variation")
___

#####Figure 5: Topology
![Figure 5](https://rawgit.com/Jcbnunez/phylobio_final_project/master/Phylogeny_topology.png "Figure 4 Site Variation")
___

#####Figure 6: phyloMCMC
![Figure 5](https://rawgit.com/Jcbnunez/phylobio_final_project/master/phyloMCMC.png "Figure 4 Site Variation")
   

## Results

###**Phylogenetic Inference Quality Control**

**Chromosomal Tree**
Two runs of phylogenetic inferences where conducted with the entire chromosomal sequence in RevBayes. Only one of the two runs showed parameter convergence (Mean of Posterior Distribution = -11907.167; ESS = 922). Other quality measures of the inference are also explored: tree space uncertainty of the best tree in the tree space is shown in figure 7 (Due to time and computational constrains, only 10% of the treespace is shown). Posterior probability search and probability distribution are shown in figure 8. 


![Figure 8](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_posterior_QC1.png "Figure 8: Chromosome K Quality Control of Parameter Convergence")
**Figure 8:** Parameter searches conducted by revBayes during phylogenetic inference. Left: PDF of sampled posteriors. Right: Posterior sampling per state (i.e. *per* generations)


**Gene Tree A6**

![Figure 9](https://rawgit.com/Jcbnunez/phylobio_final_project/master/a_posterior_QC2.png "Figure 9: Gene A6 Quality Control of Parameter Convergence")



**Gene Tree CI**

**Gene Tree BigGene**

**Gene Tree Neutral Marker**

###**Phylogenetic Signal**


and thus was used as the phylogeny for the chromosome.  The tree shows the split of the northern and Southern clades (Posterior probability = 0.92). As expected from the network analysis, individuals from the introgression zone clustered within either of the clades.      

**Figure 7:** Left: Phylogenetic reconstruction of of populations of your favorite organism. Branch leading to the split of the norther and souther clades is indicated in gold, posterior probability of the branch is also shown. Right: Mulutiple sequence aligment (MSA) of chromosome K used in the phylogenetic reconstruction




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

#Deposit all Fasta files obtained from MEROPS/NCBI/Sequencing in a single folder
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

```{sh, eval - F}
#Script 3 - Reconstructing Fasta files from Anonymized files

files=(*.out.txt) #change to the output of files from Script 2 
for i in "${files[@]}"
# depending on input the ">" may not be needed
awk '{print ">"$1"\n"$2 }' $i > $i.fasta
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

## RvBayes code

#### Heavy Run

```{r, eval = F}
#script 4
####################################################################################
#                                                                                  #
# RevBayes Script for CTMC phylogetic recpnstruction of DNA data from Chromosome K #
#		This is a "heavy" run - with 4 independent runs and 100k generations	   #
#                                                                                  #
####################################################################################

#######################
#  Imput NEXUS file   #
#######################

data <- readDiscreteCharacterData("annon_master1line.nxs")

# gather data from nexus format
n_species <- data.ntaxa()
taxa <- data.taxa()
n_branches <- 2 * n_species - 3

# move index
mi = 0

######################
# Substitution Model #
######################

#### GTR+G substitution model applied uniformly to all sites ###
er_prior <- v(1,1,1,1,1,1)
er ~ dnDirichlet(er_prior)
moves[++mi] = mvSimplexElementScale(er,weight=3)

pi_prior <- v(1,1,1,1) 
pi ~ dnDirichlet(pi_prior)
moves[++mi] = mvSimplexElementScale(pi,weight=2)

#### create a deterministic variable for the rate matrix ####
# General time reversible# 
Q := fnGTR(er,pi) 

#### monitor difference between empirical and estimated base frequencies ####
pi_empirical <- data.getEmpiricalBaseFrequencies()
# pi_diff := pi_empirical - pi

#############################
# Among Site Rate Variation #
#############################

alpha_prior <- 0.05
alpha ~ dnExponential( alpha_prior )
gamma_rates := fnDiscretizeGamma( alpha, alpha, 4, false )

# add moves the shape parameter
moves[++mi] = mvScale(alpha,weight=2)


##############
# Tree model #
##############

# Uniform topology from a birth death process
topology ~ dnUniformTopology(taxa=taxa)

# add topology Metropolis-Hastings moves
moves[++mi] = mvNNI(topology, weight=1.0)
moves[++mi] = mvSPR(topology, weight=1.0)

# create branch length vector and add moves
for (i in 1:n_branches) {
   br_lens[i] ~ dnExponential(10.0)
   moves[++mi] = mvScale(br_lens[i])
}

# add deterministic node to monitor tree length
TL := sum(br_lens)

# unite topology and branch length vector into phylogeny object
phylogeny := treeAssembly(topology, br_lens)


###################
# PhyloCTMC Model #
###################

# the sequence evolution model
seq ~ dnPhyloCTMC(tree=phylogeny, Q=Q, siteRates=gamma_rates, type="DNA")

# attach the data
seq.clamp(data)


##############
# CTMC Model #
##############

#Define model as a handle:
mymodel = model(Q)

#Create monitors:
monitors[1] = mnModel(filename="output/chrm4x_GTR_Gamma.log",printgen=10, separator = TAB)
monitors[2] = mnFile(filename="output/chrm4x_GTR_Gamma.trees",printgen=10, separator = TAB, phylogeny)
monitors[3] = mnScreen(printgen=1000, TL)

# the mcmc algorithm will run with 4 chains for 100,000 generations
mymcmc = mcmc(mymodel, monitors, moves, nruns=4)

# For the purpose of the project I will include the burnin in the output.
# mymcmc.burnin(generations=10000,tuningInterval=1000)
mymcmc.run(generations=100000)


# Analyze the tree output.
treetrace1 = readTreeTrace("output/chrm4x_run_1.trees", treetype="non-clock")
treetrace2 = readTreeTrace("output/chrm4x_run_2.trees", treetype="non-clock")
treetrace3 = readTreeTrace("output/chrm4x_run_3.trees", treetype="non-clock")
treetrace4 = readTreeTrace("output/chrm4x_run_4.trees", treetype="non-clock")
# and get the summary of the tree trace
#treetrace1.summarize()

#Map to a consensus tree
map_tree1 = mapTree(treetrace1,"output/chrm4x_run_1.tree", burnin=1000)
map_tree2 = mapTree(treetrace2,"output/chrm4x_run_2.tree", burnin=1000)
map_tree3 = mapTree(treetrace3,”output/chrm4x_run_3.tree", burnin=1000)
map_tree4 = mapTree(treetrace4,”output/chrm4x_run_4.tree", burnin=1000)

# terminate rb or rb-mpi
q()
```


#### Light Run

```{r, eval = F}
#Script 5
####################################################################################
#                                                                                  #
# RevBayes Script for CTMC phylogetic recpnstruction of DNA data from Chromosome K #
#		This is a "Light" run - with 2 independent runs and 40k generations	   	   #
#                                                                                  #
####################################################################################

#######################
#  Imput NEXUS file   #
#######################

data <- readDiscreteCharacterData("annon_master1line.nxs")

# gather data from nexus format
n_species <- data.ntaxa()
taxa <- data.taxa()
n_branches <- 2 * n_species - 3

# move index
mi = 0

######################
# Substitution Model #
######################

#### GTR+G substitution model applied uniformly to all sites ###
er_prior <- v(1,1,1,1,1,1)
er ~ dnDirichlet(er_prior)
moves[++mi] = mvSimplexElementScale(er,weight=3)

pi_prior <- v(1,1,1,1) 
pi ~ dnDirichlet(pi_prior)
moves[++mi] = mvSimplexElementScale(pi,weight=2)

#### create a deterministic variable for the rate matrix ####
# General time reversible# 
Q := fnGTR(er,pi) 

#### monitor difference between empirical and estimated base frequencies ####
pi_empirical <- data.getEmpiricalBaseFrequencies()
# pi_diff := pi_empirical - pi

#############################
# Among Site Rate Variation #
#############################

alpha_prior <- 0.05
alpha ~ dnExponential( alpha_prior )
gamma_rates := fnDiscretizeGamma( alpha, alpha, 4, false )

# add moves the shape parameter
moves[++mi] = mvScale(alpha,weight=2)


##############
# Tree model #
##############

# Uniform topology from a birth death process
topology ~ dnUniformTopology(taxa=taxa)

# add topology Metropolis-Hastings moves
moves[++mi] = mvNNI(topology, weight=1.0)
moves[++mi] = mvSPR(topology, weight=1.0)

# create branch length vector and add moves
for (i in 1:n_branches) {
   br_lens[i] ~ dnExponential(10.0)
   moves[++mi] = mvScale(br_lens[i])
}

# add deterministic node to monitor tree length
TL := sum(br_lens)

# unite topology and branch length vector into phylogeny object
phylogeny := treeAssembly(topology, br_lens)


###################
# PhyloCTMC Model #
###################

# the sequence evolution model
seq ~ dnPhyloCTMC(tree=phylogeny, Q=Q, siteRates=gamma_rates, type="DNA")

# attach the data
seq.clamp(data)


##############
# CTMC Model #
##############

#Define model as a handle:
mymodel = model(Q)

#Create monitors:
monitors[1] = mnModel(filename="output/chrm2x_GTR_Gamma.log",printgen=10, separator = TAB)
monitors[2] = mnFile(filename="output/chrm2x_GTR_Gamma.trees",printgen=10, separator = TAB, phylogeny)
monitors[3] = mnScreen(printgen=1000, TL)

# the mcmc algorithm will run with 4 chains for 100,000 generations
mymcmc = mcmc(mymodel, monitors, moves, nruns=2)

# burning on!
mymcmc.burnin(generations=10000,tuningInterval=1000)

mymcmc.run(generations=40000)


# Analyze the tree output.
treetrace1 = readTreeTrace("output/chrm2x_run_1.trees", treetype="non-clock")
treetrace2 = readTreeTrace("output/chrm2x_run_2.trees", treetype="non-clock")

# and get the summary of the tree trace
#treetrace1.summarize()

#Map to a consensus tree
map_tree1 = mapTree(treetrace1,"output/chrm2x_run_1.tree", burnin=1000)
map_tree2 = mapTree(treetrace2,"output/chrm2x_run_2.tree", burnin=1000)

# terminate rb or rb-mpi
q()
```
####Amino Acid Run

```{r, eval = F}
################################################################################
#																			   #
# 		RevBayes Script for CTMC phylogetic recpnstruction of AA data 		   #
#																			   #
################################################################################

#######################
# Reading in the Data #
#######################

###### This just defines a single model for all sites #######

### Read in sequence data for both genes

data <- readDiscreteCharacterData("AA_data.nex")

# Get some useful variables from the data. We need these later on.
n_species <- data.ntaxa()
taxa <- data.names()
n_branches <- 2 * n_species - 3

# set my move index
mi = 0



######################
# Substitution Model #
######################

#### specify the Jukes-Cantor substitution model applied uniformly to all sites ###
Q <- fnWAG() 



##############
# Tree model #
##############

# construct a variable for the tree drawn from a birth death process
topology ~ dnUniformTopology(taxa)

# add topology Metropolis-Hastings moves
moves[++mi] = mvNNI(topology, weight=1.0)
moves[++mi] = mvSPR(topology, weight=1.0)

# create branch length vector and add moves
for (i in 1:n_branches) {
   br_lens[i] ~ dnExponential(10.0)
   moves[++mi] = mvScale(br_lens[i])
}

# add deterministic node to monitor tree length
TL := sum(br_lens)

# unite topology and branch length vector into phylogeny object
phylogeny := treeAssembly(topology, br_lens)



###################
# PhyloCTMC Model #
###################

# the sequence evolution model
seq ~ dnPhyloCTMC(tree=phylogeny, Q=Q, type="AA")

# attach the data
seq.clamp(data)



#############
# The Model #
#############

# We define our model.
# We can use any node of our model as a handle, here we chose to use the rate matrix.
mymodel = model(Q)


monitors[1] = mnModel(filename="AA.log",printgen=10, separator = TAB)
monitors[2] = mnFile(filename="AA.trees",printgen=10, separator = TAB, phylogeny)
monitors[3] = mnScreen(printgen=1000, TL)

mymcmc = mcmc(mymodel, monitors, moves, nruns=2)

# burning on!
mymcmc.burnin(generations=10000,tuningInterval=1000)
mymcmc.run(generations=40000)



# Now, we will analyze the tree output.
# Let us start by reading in the tree trace
treetrace1 = readTreeTrace("AA_run_1.trees", treetype="non-clock")
treetrace2 = readTreeTrace("AA_run_2.trees", treetype="non-clock")
# and get the summary of the tree trace
#treetrace.summarize()

map_tree1 = mapTree(treetrace1,"AA_run_1.tree", burnin=1000)
map_tree2 = mapTree(treetrace2,"AA_run_2.tree", burnin=1000)

# quit RevBayes
q()
```