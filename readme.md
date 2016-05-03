# Phylogenetic Biology - Final Project
___

## Abstract

The primary goal of this project is to apply the knowledge and tools acquired in phylogenetic biology to problems in ecology and evolution. This project, titled "Phylogenetic reconstruction of demographic structure in introgressed populations", uses phylogenetic methods to investigate demographic signals in a complete chromosome tree compared to trees constructed from individual genes within the chromosome. This project uses DNA sequences, and at its core, it is comparison of "chromosomal/concatenated locus trees" vs. "gene trees".     

#**"Phylogenetic reconstruction of demographic structure in introgressed populations"**

## Introduction and Goals

Your favorite marine organism inhabits the eastern seaboard of some contient. Ecological conditions across the eastern seaboard of some continent are variable thus your favorite organism is exposed to a drastic range of ecological conditions. The demographic history of this organism is characterized by a historical phylogenetic break occurring at the height of Middlecity (Figure 1). This phylogenetic break is thought to be the result of a recent vicariance event followed by a population bottleneck in the northern clade. 

![Figure 1](https://rawgit.com/Jcbnunez/phylobio_final_project/master/model_system.png "Figure 1 Ecology of your favorite Marine Organism")

*Figure 1: Left - A "map" of the sampled populations correlated with the dominant haplogroup. Right - a putative topology of a phylogeny including populations of the 2 major haplogroups and a sister taxa of your favorite marine organism.*    

This historical event has a very distinct demographic signal occurring in the chromosome K of your favorite marine organism. Organisms south of the historical break have a particular set of haplogroups and viceversa for the north. However, populations of your favorite marine organism living close to Middelcity town show a conspicuous introgression pattern such that about 50% of organisms living in this area show either a discrete northern or discrete southern haplogroup (Figure 2). In other words, demographic signals from chromosome K tend to split the middlecity populaiton in 2 groups that cluster with organisms living miles appart rather than reconstructing a single population even thought gene flow  among middlecity seems to be unrestricted.

This project will utilize bayesian phylogenetic reconstruction methods to unravel the demographic signal of chromosome K in a gene-by-gene fashion and investigate what gene(s) recapitulate the demographic signal.  

![Figure 2](https://rawgit.com/Jcbnunez/phylobio_final_project/master/cline_network_phylo.png "Figure 2 Maximun Parsimony Network with full chromosome haplotypes of  your favorite Marine Organism")

*Figure 2: a maximun parsimony haplotype network with individuals from all populations and the outgroup.*

## Methods

Data for this project corresponds to real anonymized data sequenced from various populations of *your favorite marine organism.* Sequencing data was assembles to high coverage and mapping quality standards to a reference sequence of chromosome K available in NCBI. Data was anonymized using scripts 1, 2, and 3 (see supplement). Monomorphic and singleton (parsimony non-informative) locus were filtered out of the file used to reconstruct the tree for the whole chromosome using TASSEL 5 (http://www.maizegenetics.net/#!tassel/c17q9). This data filtering scheme was necessary due to computational limitations. i.e. parameters would not converge using the computational resources available for this project. Nexus files were built in SEAVIEW (http://www.molecularevolution.org/software/alignment/seaview). As opposed to MESQUITE, SEAVIEW outputs revbayes ready NEXUS files.

Phylogenetic reconstructions were conducted in revbayes (rb and rb-mpi) version 1.00 (March 2016) using 2 independent parameter searches of 40,000 generations and a burn-in of 10,000 generations. Processes were run in the OSCAR super cluster computer. A major advantage of RevBayes is its modular nature allowing phylogenetic reconstruction to be informed by different assumptions and models: rate matrix(figure 3), among site variation(figure 4), tree topology (Figure 5), and the phylogenetic MCMC model (Figure 6). Briefly, the parameters used for phylogenetic inference are as follows: **Substitution model:** General time reversible (GTR; Tavaré, 1986) using an among site variation Γ. Priors for the GRT model parameters were established with uniform Dirichlet priors for the exchangeability rates (er) and the equilibrium frequencies (π). The Γ function parameter, alpha, was informed by an exponential prior of α = 0.05. A uniform tree topology was generated through a birth-death process with Metropolis-Hastings sampling and branch lengths drawn from an exponential prior with λ = 10. 


#####Figure 3: Rate matrix
![Figure 3](https://rawgit.com/Jcbnunez/phylobio_final_project/master/rate_matrix.png)
___

#####Figure 4: Site Variation
![Figure 4](https://rawgit.com/Jcbnunez/phylobio_final_project/master/among_sites_rate.png)
___

#####Figure 5: Topology
![Figure 5](https://rawgit.com/Jcbnunez/phylobio_final_project/master/Phylogeny_topology.png)
___

#####Figure 6: phyloMCMC
![Figure 5](https://rawgit.com/Jcbnunez/phylobio_final_project/master/phyloMCMC.png)
 
The original vision of this project was to compare the chromosomal tree with each individual gene tree in the molecule. However, given time constrains, this project will present a *'Lite'* version of the original vision focusing on the comparison of the main phylogeny constructed using the complete chromosome K sequences with 3 genes (gene A6 ~200 bp, Gene CI ~ 1600 bp, gene BigGene ~2000 bp) and 1 neutral marker (~ 900 bp). Quality control measures for tree inference were estimated and plotted using ggplot2. As way to explore tree-space, 10% of all proposed topologies(see suplemental code) were extracted and plotted with the highest posterior tree overlaid on top. 

Phylogenetic visualizations were produced in R using ggtree(https://www.bioconductor.org/packages/3.3/bioc/vignettes/ggtree/inst/doc/ggtree.html) and ape(https://cran.r-project.org/web/packages/ape/index.html). Visualization of posterior probabilities were produced using ggplot2. For some clustering tests, ape phylogenetic objects were converted to dendrogram objects and analyzed using the R package dendextend (https://cran.r-project.org/web/packages/dendextend/index.html). Blomberg's K estimates of phylogenetic signal were estimated using the R package "picante" (https://cran.r-project.org/web/packages/picante/index.html). Phenograms were plotted in R using a custom function by Liam Ravell "phenogram" (http://blog.phytools.org/2011/12/traitgram-with-mapped-discrete.html). Many clustering analyses were conducted under the assumptions that ultrametric -phylogenetic- trees, like dendrograms, can be seen as sets of nested lists with a defined hierarchy and structure. These clustering analyses mainly investigated the similarity between trees inferred using the entirety of the data set vs. trees inferred using only subsets of the data (chromosome trees vs. locus trees). These methods consist of: a) Tanglegrams, a comparison method that investigates the similarities in hierarchical clustering between the locus and chromosomal trees.  Tanglegrams allows for the estimation of "entanglement", a parameter which indicates the degree in which the branches and tips retain order between trees (lower entanglement suggests highest conservation of structure). Since tree topology can be represented in multiple ways, the relationship between two trees may not be entirely intuitive at face value. Built in algorithms in dendextend were used to "disentangle" tree visualization such that both topologies are visualized to the highest degree of similarity. Tree similarity was compared quantitively using two metrics, Baker's Gamma (Baker, 1974) measures the degree of association between two sets of hierarchical clusters (trees in this case). Statistical confidence for the Baker's Gamma Index was estimated using a permutation test (here done with 100 repetitions) as follows:

```{r}

#Here I provide an example of Baker's Gamma using the comparison between the Chromosomal tree (K) and the gene tree of "Big Gene" 

set.seed(123456) #setting a random seed
K_cor <- cor_bakers_gamma(k_dend, k_dend) #estimating the baker's index  between two indetical trees from the chromosome K. This set a null expectation.
K_BG_cor <- cor_bakers_gamma(k_dend,BG_dend) #estimating the baker's index between a gene tree and a chromosome tree. Here trees have been transformed to dendrograms (input trees were ultrametic). 

rep = 100 #Number of iterations

cor_bakers_gamma_results <- numeric(rep) #Generating vector to store results
dend_mixed <- k_dend

#sampling loop
for(i in 1:rep) {
   dend_mixed <- sample.dendrogram(dend_mixed, replace = FALSE)
   cor_bakers_gamma_results[i] <- cor_bakers_gamma(k_dend, dend_mixed)
}

#P-value was estimated from the sampling distribution

round(sum(K_BG_cor < cor_bakers_gamma_results)/ rep, 4)

```

The Fowlkes-Mallows Index is another measure of the association between two trees (Fowlkes and Mallows, 1983). The index investigates the similarity between the trees when these trees are subdivided in clusters of size "k" from the trees. The expected value of Fowlkes-Mallows under the null hypothesis that the two trees are not similar can be compared to the observed values of Fowlkes-Mallows to obtain an idea of the similarity of the trees at different "depths" of the topology. Branch lengths analysis within haplogroup clades were conducted with the function "pd.calc" in the R package caper (https://cran.r-project.org/web/packages/caper/index.html).

## Results
___


###**Phylogenetic Inference Quality Control**

**Chromosomal Tree**

Two runs of phylogenetic inferences were conducted with the entire chromosomal sequence in RevBayes. Only one of the two runs showed parameter convergence (Mean of Posterior Distribution = -11907.167; ESS = 922). Other quality measures of the inference are also explored: tree space uncertainty of the best tree in the tree space is shown in figure 7 (Due to time and computational constrains, only 10% -4000 randomly sampled trees- of the treespace is shown). Posterior probability search and probability distribution are shown in figure 8. At face value, exploration of the tree space indicates that the brach leading to the outgroup has problematic placement. This low leaf stability is seen much more acutely in the phylogenetic reconstructions of individual genes (see below). The impact of this unstable taxon on the tree topology was investigated by retuning some of the analyses without the outgroups (see below).  

![Figure 7](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_tree_space.png)
*Figure 7: Light blue, 10% of the tree space constructed for chromosome K. Red, Best tree.

![Figure 8](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_posterior_QC1.png)
*Figure 8: Parameter searches conducted by revBayes during phylogenetic inference of chromosome K. Left: PDF of sampled posteriors. The blue vertical line represent the mean of the sampling distribution. Right: Posterior sampling per state (i.e. *per* generations)*

**Gene Tree A6:** Two independent runs were conducted with the sequence of gene A. Tree space uncertainty and and best tree are shown in figure 9. For both runs, parameter searches converged to similar posterior distributions (Distribution Mean 1 = -1695.242, ESS = 992, Distribution Mean 2 = -1695.473, ESS = 739). Distribution and parameter search *per* state are shown in figure 10. 

![Figure 9](https://rawgit.com/Jcbnunez/phylobio_final_project/master/a_treespace.png)
*Figure 9: Light blue, 10% of the tree space constructed for chromosome K. Red, Best tree. 

![Figure 10](https://rawgit.com/Jcbnunez/phylobio_final_project/master/A_posterior_QC2.png)
*Figure 10: Parameter searches conducted by revBayes during phylogenetic inference for gene a6. Left: PDF of sampled posteriors. The vertical lines represent the mean of the sampling distribution. The color scheme is blue and red for first and second independent run respectively. Right: Posterior sampling per state (i.e. *per* generations.) Color scheme is the same as the sampling distributions*

**Gene Tree CI:** Two independent runs were conducted with the sequence of gene CI. Tree space uncertainty and and best tree are shown in figure 11. For both runs, parameter searches converged to similar posterior distributions, the effective sample size of these searches was relatively small (Distribution Mean 1 = -3742.323, ESS = 115, Distribution Mean 2 = -3741.266, ESS = 182). Distribution and parameter search *per* state are shown in figure 12. 

![Figure 11](https://rawgit.com/Jcbnunez/phylobio_final_project/master/CI_treespace2.png)
*Figure 11: Light blue, 10% of the tree space constructed for Gene CI. Red, Best tree. 

![Figure 12](https://rawgit.com/Jcbnunez/phylobio_final_project/master/CI_posterior_QC.png)
 *Figure 12: Parameter searches conducted by revBayes during phylogenetic inference for gene CI. Left: PDF of sampled posteriors. The vertical lines represent the mean of the sampling distribution. The color scheme is blue and red for first and second independent run respectively. Right: Posterior sampling per state (i.e. *per* generations.) Color scheme is the same as the sampling distributions*


**Gene Tree BigGene:**  Two independent runs were conducted with the sequence of gene Big Gene. Tree space uncertainty and and best tree are shown in figure 13. For both runs, parameter searches converged to similar posterior distributions, the effective sample size of these searches was relatively small (Distribution Mean 1 = -4919.782, ESS = 60, Distribution Mean 2 = -4928.707, ESS = 79). Distribution and parameter search *per* state are shown in figure 14. 

![Figure 13](https://rawgit.com/Jcbnunez/phylobio_final_project/master/BG_treespace2.png)
*Figure 13: Light blue, 10% of the tree space constructed for the neutral marker. Red, Best tree. 

![Figure 14](https://rawgit.com/Jcbnunez/phylobio_final_project/master/BG_posterior_QC.png)
*Figure 14: Parameter searches conducted by revBayes during phylogenetic inference for the Big Gene. Left: PDF of sampled posteriors. The vertical lines represent the mean of the sampling distribution. The color scheme is blue and red for first and second independent run respectively. Right: Posterior sampling per state (i.e. *per* generations.) Color scheme is the same as the sampling distributions*


**Loci Tree Neutral Marker:** Two independent runs were conducted with the sequence of gene Big Gene. Tree space uncertainty and and best tree are shown in figure 15. For both runs, parameter searches converged to similar posterior distributions, the effective sample size of these searches was relatively small (Distribution Mean 1 = -2273.422, ESS = 86, Distribution Mean 2 = -2272.512, ESS = 268). Distribution and parameter search *per* state are shown in figure 16. 

![Figure 15](https://rawgit.com/Jcbnunez/phylobio_final_project/master/NM_treespace.png)
*Figure 15: Light blue, 10% of the tree space constructed for the neutral marker. Red, Best tree. 

![Figure 16](https://rawgit.com/Jcbnunez/phylobio_final_project/master/NM_posterior_QC.png)
*Figure 16: Parameter searches conducted by revBayes during phylogenetic inference for loci CI. Left: PDF of sampled posteriors. The vertical lines represent the mean of the sampling distribution. The color scheme is blue and red for first and second independent run respectively. Right: Posterior sampling per state (i.e. *per* generations.) Color scheme is the same as the sampling distributions*

###**Chromosomal Tree and Missing Data**

Tree constructed using polymorphic sites from the entire chromosome is shown in figure 17 next to the MSA used to build the tree. The tree reconstruct a bipartition splitting the northern and Southern clades (Posterior probability = 0.92). As expected from the network analysis, individuals from the introgression zone clustered within either of the clades. The MSA reveals that most taxa, except the outgroups, northville, south pier city and North harbourshire have some degree of missing data.   

To asses the impact of missing data on the phylogenetic reconstruction, the character of "% missing data" was mapped onto the tips of the tree. This mapping is displayed a tree showing the estimated branch length (Figure 17B) and in a tree with "flat" branch length (brl. = 1; Figure 17D). For both trees phylogenetic signal was estimated with Blomber's K (Estimated Brl = 0.01374608, Flat brl = 0.2848437) and yielded values close to random expectation. The relationship between branch length and missing data was visualized in figure 17D. Figure 17D reveals that while 3 of the populations with 0% missing data where clustered as single clades, one population with 0% missing data, Northville, was not recovered as a single clade.     

![Figure 17A](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_phylogeny.png "Figure 17: phylogeny for chromosome K")
**Figure 17A:** Left: Phylogenetic reconstruction of of populations of your favorite organism. Branch leading to the split of the norther and souther clades is indicated in gold, posterior probability of the branch is also shown. Right: Mulutiple sequence aligment (MSA) of chromosome K used in the phylogenetic reconstruction
![Figure 17B](https://rawgit.com/Jcbnunez/phylobio_final_project/master/N_mapped_BR.png "Figure 17B: phylogeny for gene BG")
**Figure 17B:** Percent of missing data mapped onto the phylogeny. Estimated Branch length is shown 
![Figure 17C](https://rawgit.com/Jcbnunez/phylobio_final_project/master/N_mapped_noBR.png)
**Figure 17C:** Percent of missing data mapped onto the phylogeny. Flat branch lenght (brl = 1)
![Figure 17D](https://rawgit.com/Jcbnunez/phylobio_final_project/master/traitgram_missingdata.png)
**Figure 17D:** Percent of missing data vs. Flat Branch length/Topology 

___

###**Topology Comparison: Gene trees vs. Chromosomal Trees**

####Gene Big Gene

Phylogenetic reconstruction for the the Big Gene produced the most accurate tree reconstruction relative to all other genes. The tree grouped both northern and southern haplogroups in clades with excellent branch support (out-group to Southern-clade posterior = 1, Southern Clade to Northern Clade posterior = 1 (Figue 19A). Topology similarity between the chromosomal tree and the Big Gene tree was the highest of all gene-to-chromosome tree comparisons. Corrected entanglement = 0.0322881. Baker's Gamma = 0.8 (P-val = 0; Figure 18D). Finally, Fowlkes–Mallows index reveals high levels of similarity between the chromosomal and gene tree at all levels of topology (Figure 18E). 

![Figure 18A](https://rawgit.com/Jcbnunez/phylobio_final_project/master/BG_phylogeny2.png)
**Figure 18A:** Phylogenetic tree constructed from data from the Big Gene
![Figure 18B](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_BG_tangled.png "Figure")
**Figure 18B:** Raw entanglement of Big Gene vs Chromosome K. In this state the entanglement coefficient is =  0.8978911.
![Figure 18C](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_BG_untangled.png "Figure 20B: untangled K vs BG")
**Figure 18C:** Corrected entanglement. New coefficient is =  0.8978911.
![Figure 18D](https://rawgit.com/Jcbnunez/phylobio_final_project/master/Bakers_gamma_kvsBG3.png)
**Figure 18D:**  Baker's Gamma index. P-value estimated with 100 replications.
![Figure 18E](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_BG_BK.png)
**Figure 18E:** Fowlkes–Mallows index of "dissimilarity" Notice high level of similarity at all levels of topology

___

####Gene A

Phylogenetic reconstruction for gene A produced a relatively bad (not the worst) reconstruction of the chromosomal tree. The tree grouped both northern and southern haplogroups in clades with poor branch support (out-group to Southern-clade posterior = 0.38, Southern Clade to Northern Clade posterior = 0.79). Unlike the chromosomal tree, populations of northern and southern haplogroup were not recovered as two distinct sister clades, but rather the northern clade derives entirely from the southern clade (Figue 19A). Topology similarity between the chromosomal tree and gene A tree was low. Corrected entanglement =  0.1615409. Baker's Gamma = 0.3 (P-val = 0; Figure 19D). Finally, Fowlkes–Mallows index reveals very low  similarity between the chromosomal and gene tree at all levels of topology, except at deep levels of topology K = ~ 5-10 (Figure 19E).

![Figure 19A](https://rawgit.com/Jcbnunez/phylobio_final_project/master/a6_phylo.png)
**Figure 19A:** Phylogenetic tree constructed from data from the Gene A
![Figure 19B](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_A_tangled.png)
**Figure 19B:** Raw entanglement of Big Gene vs Chromosome K. In this state the entanglement coefficient is =   0.3317921
![Figure 19C](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_A6_untangled.png)
**Figure 19C:** Corrected entanglement. New coefficient is = 0.1615409
![Figure 19D](https://rawgit.com/Jcbnunez/phylobio_final_project/master/Baker_gamma_K_A6.png)
**Figure 19D:**  Baker's Gamma index. P-value estimated with 100 replications.
![Figure 19E](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_A6_BK.png)
**Figure 19E:** Fowlkes–Mallows index of "dissimilarity" Notice high level of similarity at all levels of topology

___

####Gene CI

Phylogenetic reconstruction for gene CI produced  the worst reconstruction of the chromosomal tree. However, tree grouped both northern and southern haplogroups in clades with excellent branch support (out-group to Southern-clade posterior = 1, Southern Clade to Northern Clade posterior = 1). Unlike the chromosomal tree, populations of northern and southern haplogroup were not recovered as two distinct sister clades, but rather the northern clade derives entirely from the southern clade (Figue 20A). Topology similarity between the chromosomal tree and gene CI was low. Corrected entanglement = 0.35123. Baker's Gamma = 0.26 (the lowest of all genes, P-val = 0; Figure 20D). Finally, Fowlkes–Mallows index reveals very low  similarity between the chromosomal and gene tree at all levels of topology, except at deep levels of topology K = ~ 30 (Figure 20E).

![Figure 20A](https://rawgit.com/Jcbnunez/phylobio_final_project/master/CI_phylogeny.png)
**Figure 20A:** Phylogenetic tree constructed from data from the Gene CI
![Figure 20B](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_CI_entangled.png)
**Figure 20B:** Raw entanglement of Big Gene vs Chromosome K. In this state the entanglement coefficient is = 0.4619899
![Figure 20C](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_CI_untangled.png)
**Figure 20C:** Corrected entanglement. New coefficient is = 0.35123
![Figure 20D](https://rawgit.com/Jcbnunez/phylobio_final_project/master/Bakers_gamma_K_CI2.png)
**Figure 20D:**  Baker's Gamma index. P-value estimated with 100 replications.
![Figure 20E](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_CI_BK.png )
**Figure 20E:** Fowlkes–Mallows index of "dissimilarity" Notice high level of similarity at all levels of topology

___

####Neutral Loci

Phylogenetic reconstruction for the neutral marker produced the messiest reconstruction of the chromosomal tree with individuals from both northern and southern haplogroups being mixed at one clade with low posterior support (0.52). This mixed clade aside, one branch seemed to roughly divide northern and southern halpogroups with excellent posterior support (1; Figure 21A). Unlike all other gene trees, placement of the outgroup had extremely low posterior support (<< 0.1). Unlike other reconstructions, the southern clade seems to derive from the northern clade, this inference, however, is weakened by the low posterior support of the outgroup. Topology similarity between the chromosomal tree and the neutral marker was medium with Corrected entanglement = 0.25 and Baker's Gamma = 0.63 (P-val = 0; Figure 21D). Finally, Fowlkes–Mallows index revealed high degree of similarity only at deep levels of the topology (K = ~5 - 20, Figure 21E).


![Figure 21A](https://rawgit.com/Jcbnunez/phylobio_final_project/master/NM_phylo2.png)
**Figure 21A:** Phylogenetic tree constructed from data from the Neutral Marker
![Figure 21B](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_NM_tangled.png)
**Figure 21B:** Raw entanglement of Big Gene vs Chromosome K. In this state the entanglement coefficient is = 0.3514943

![Figure 21C](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_NM_untangled.png)
**Figure 21C:** Corrected entanglement. New coefficient is = 0.2572355
![Figure 21C](https://rawgit.com/Jcbnunez/phylobio_final_project/master/Baker_gamma_KvsNM.png)
**Figure 21D:**  Baker's Gamma index. P-value estimated with 100 replications.
![Figure 21D](https://rawgit.com/Jcbnunez/phylobio_final_project/master/K_vs_NM_BK.png)
**Figure 21E:** Fowlkes–Mallows index of "dissimilarity" Notice high level of similarity at all levels of topology

___

####Potential sequence length Bias of phylogenetic signal 

To test whether or not the high similarity between the chromosomal tree and the big gene was driven exclusively due to the large size of the big gene, a phylogenetic tree was inferred form the concatenated sequences of genes A, CI and the neutral Marker (Figure 22A). The tree inferred form the concatenated genes successfully reconstructed the northern and souther haplogroups (posterior = 1), however, as in the case of gene A and the neutral marker, outgroup placement and support was highly problematic (posterior << 0.1). Corrected entanglement measurement was low (0.092) and Baker's gamma was medium (0.64, P-value = 0). The Foulkes-Mallows index reveals a degree of similarity much higher for the concatenated genes relative to any individual gene, yet much lower than the Big Gene alone.   

![Figure 22](https://rawgit.com/Jcbnunez/phylobio_final_project/master/Concatenated_tree.png)
**Figure 21A:** Phylogenetic tree constructed from data from the Neutral Marker. *Notice the very short branch length*
![Figure 21D](https://rawgit.com/Jcbnunez/phylobio_final_project/master/Concatnated_tanglegram.png)
**Figure 21B:** Corrected entanglement. New coefficient is =  0.09186049**

![Figure 21D](https://rawgit.com/Jcbnunez/phylobio_final_project/master/BKandGamma_concatenated.png)
**Figure 21C:**  Baker's Gamma index. P-value estimated with 100 replications, and Fowlkes–Mallows index of "dissimilarity" Notice high level of similarity at all levels of topology

#### Stability of the out-group 

Tree space analysis of the first trees constructed revealed  high leaf instability in the placement of the outgroup in all runs expect for the Big gene. To explore the potential effects of this instability, 3 analyses were revisited without the outgroup: Complete chromosome (Figure 22A), and the two most unstable trees, A6 (Figure 23A), and the neutral marker (Figure 24A). 

For the chromosomal tree (K), removal the outgroup has positive effects by increasing the posterior probabilities of the branches leading to the bipartition of the northern and southern haplogroups (Figure 22B).

![Figure 22A](https://rawgit.com/Jcbnunez/phylobio_final_project/master/no_out_K_qc.png)
**Figure 22A**: Parameter searches conducted by revBayes during phylogenetic inference of chromosome K without the outgroup. Left: PDF of sampled posteriors. The blue vertical line represent the mean of the sampling distribution. Right: Posterior sampling per state (i.e. *per* generation). Notice the bad convergence as the first generations post burning.
![Figure 22B](https://rawgit.com/Jcbnunez/phylobio_final_project/master/no_out_tree_comparison_K.png)
**Figure 22B:** Phylogenetic tree constructed from data from chromosome K without the outgroup. 

For the tree constructed from gene A, removal of the outgrup didn't improve the phylogenetic inference or the posterior support of key branches leading to the two haplogroup clades (Most posterior probabilities leading to key bipartitions rather decreased in value). Tree space visualization reveals that, while there is no longer a jumping outgroup throughout the topologies, the tree space is broad and diffuse (Figure 23C).

![Figure 23A](https://rawgit.com/Jcbnunez/phylobio_final_project/master/no_out_A6_qc.png)
**Figure 23A**: Parameter searches conducted by revBayes during phylogenetic inference of gene A without the outgroup. Left: PDF of sampled posteriors. The blue vertical line represent the mean of the sampling distribution. Right: Posterior sampling per state (i.e. *per* generation). Notice the bad convergence as the first generations post burning.
![Figure 23B](https://rawgit.com/Jcbnunez/phylobio_final_project/master/noOut_A6_tree_comparison.png)
**Figure 23B:** Phylogenetic tree constructed from data from gene A without the outgroup. 
![Figure 23C](https://rawgit.com/Jcbnunez/phylobio_final_project/master/A6_noout_treespace.png)
**Figure 23C:** Tree space of gene A without the outgroup. 

A situation similar to that observed for gene A is seen in the case of the neutral marker, with no appreciable improvement resulting from removing the outgroup (Figure 24B). 

![Figure 24A](https://rawgit.com/Jcbnunez/phylobio_final_project/master/no_out_NM_qc.png)
**Figure 24A**: Parameter searches conducted by revBayes during phylogenetic inference the neutral marker without the outgroup. Left: PDF of sampled posteriors. The blue vertical line represent the mean of the sampling distribution. Right: Posterior sampling per state (i.e. *per* generation). Notice the bad convergence as the first generations post burning.
![Figure 24B](https://rawgit.com/Jcbnunez/phylobio_final_project/master/noOUT_NM_trees.png)
**Figure 24B:** Phylogenetic tree constructed from data from the neutral marker without the outgroup. 

####Branch Length Analysis 

Finally, a branch length analysis was conducted comparing the norther and Southern clades genetrated in the chromosomal tree, the Big gene tree, and the concatenated tree (Table 1). The following metric were estimated: Total Branch Length, the sum of all branch lengths in the clade; Shared Branch Length, the sum of all branch lengts shared by more than one tip; and, Unique Evolutionary History, the sum of the branch lengths that give rise to only one tip in the clade.

**Table 1:** Branch length analysis for the two haplogroups in three trees chromosomal tree, the Big gene tree, and the concatenated tree. UEH = Unique Evolutionary History; SBL = Shared Branch Length; TBL = Total Branch Length. TBL_S/TBL_N = The ratio of total branch lenght of South to North haplogroups.

| Clade | Partition | UEH      | SBL      | TBL      | TBL_S/TBL_N |
|-------|-----------|----------|----------|----------|-------------|
| North | K         | 0.166674 | 0.030191 | 0.196865 | 3.082117187 |
| South | K         | 0.485426 | 0.121335 | 0.606761 | *           |
| North | A6-CI-NM  | 0.037607 | 0.013497 | 0.051104 | 1.667325454 |
| South | A6-CI-NM  | 0.060772 | 0.024435 | 0.085207 | *           |
| North | Big Gene  | 0.098208 | 0.023287 | 0.121495 | 2.098991728 |
| South | Big Gene  | 0.177707 | 0.07731  | 0.255017 | *           |

## Discussion

**Demographic Signal:**

This project investigated posterior support and topology similarities between a tree constructed using full chromosome data and trees built with data partitions per gene from the chromosome. The main aim was determine which partition (gene), if any, better reconstructed the chromosome topology (and putative demographic signal), and if any particular partition was responsable for the topology of the chromosomal tree. Neither the chromosome tree, nor any individual gene tree reconstructed individual demes rather reconstructing two general haplogroup clades, North and South. Investigations of 3 genes (A6, CI, Big Gene) and a neutral region revealed that trees constructed from Big Gene alone recapitulated with high fidelity the topological (and putatively demographic) signal observed in the whole chromosome tree. All other genes performed poorly by themselves, and, even when concatenated into a single sequence, only recapitulated the chromosomal with a low signal. There are two hypotheses that could explain this observations. If the phylogenetic signal derived form the haplogroups is purely demographic (i.e. neutral), the large size and low functional constrains of big Gene would make it the target of multiple neutral mutations not purged out by purifying selection. Under this model, Big gene's amino acid substitution rate would allow for a higher number of synonymous/non-synonymous substitutions and low codon bias, specially at the non-active pockets of the protein. As a result, Big Gene's signal would be much less saturated than the other shorter, more constrained genes, under strong purifying selection and potentially strong codon bias. Much of the standing variation resulting form this, may have been stochastically purged in the northern haplogroups during the vicariance and subsequence bottleneck events, thus resulting in the observed demographic/topological signal. This scenario is supported by the low (relative to Big Gene) level of topological concordance obtained in the tree build from the concatenated genes. The concatenated sequence, while longer than Big gene, is composed of smaller genes with high levels of functional constraints and potentially high levels of signal saturation in the short genes making up the concatenate). This hypothesis also gains additional support by the drastic differences in branch length between Northern and Southern clades in all genes trees and particularly in the long branches observed in the big gene tree relative to the chromosomal tree. In order to explore this idea, future experiments should explore the demographic signal at various levels of data partitioning other than the gene level, particularly, aminoacid level signal, and codon level signal. This approach would allow to explore the degree of saturation on the chromosome and its constituting genes. An alternative hypothesis may consider natural selection acting on the big gene and driving diferences in the evolution of two clades. This hypothesis would require estimating the degree of functional changes (vs. synonymous changes; i.e. dN/dS or MK-Test) along the branches leading to the clades. Ultimately, this hypothesis would require a population genetic study associating genotype with phenotype from individuals of the two haplogroups. Future studies may explore this.

**Effects of Missing Data**

At face value, figure 17A shows that some of the clustering patterns seem to be associated with missing amount of missing data (red dashes in the MSA). Missing data was mapped to the topology of of the chromosomal and Blomber's K analyses were conducted for a tree with estimated branch length and with flat (=1) branch length. For both cases K was close to ~0, thus suggesting missing data has little effect on the tree inference. Moreover, plotting the tree topology and branch lengths vs. missing data reveal that not all taxa with similar levels of missing data clustered together (e.g. Northville, Figure 17D). This results are consistent with those published by Jiang et al. (2014) who showed that, for maximun likelihood analyses, moderate amounts of missing data had positive or no impact in phylogenetic inference relative to analyses that purposefully excluded genes with missing data. It is important to consider, however, that Jiang's analyses were conducted using a maximun likelihood strategy. Literature considering the effect of missing data for bayesian approaches is permeated by conflicting views. For instane, Lemmon et al. 2009 reported misleading results when using missing data in bayesian methods. Conversely, Wiens and Morrill (2011) used simulated data to show that including traits  with missing informtion tended to either increase or have no effect on the accuracy for Bayesian phylogenetics. The results of this project seem to echo the latter.

**Out-group stability and Tree-space**

An interesting observation through this project was the stability of the outgroup through phylogenetic reconstructions. In all analyses, except for the inference of big gene, branches leading to the outgroup has a very poor posterior support and a very problematic placement in tree space, often jumping from northern and southern haplogroups (see Tree Spaces in the QC portion in Results. Two runs of phylogenetic inferences were...) To investigate this phenomenon, analyses for the chromosomal tree, gene A6, and the neutral marker were revisited without the outgroup. Lower support values can be caused by large structural rearrangements across taxa or by the presence of instable taxa (Dunn et al. 2008). Given that all the trees in taxa are composed by the same species, and that there are no visible rearrangements in the sequences,it is parsimonious to believe that the phylogenetic signal in gene A6, CI and the neutral markers may be saturated or posseses many uninformative characters, and thus produces trees with unstable taxa. For the chromosomal tree, removal of the outgroup improved the posterior branch support on the  branch leading to the bipartition of the North/South haplogroups. This was not the case for the other two genes in which removal of the outgroup, had bad effects or no effect in the overall support of the trees.  This suggests that that posterior support only increases -relative to the exclusion of the unstable outgroup- when the base tree has stable taxa (i.e. the chromosomal tree or the Big Gene Tree).     

**Technical notes: Future directions**

Future installments of this project will investigate the remaining genes of chromosome K. A great weakness and frustration throughout the analysis was the lack of parameter convergence on when using long sequences of more than 2 independent runs. This is probably related to the small number of states ran in the MCMC process. Future installments of this research will try to upscale the computational resources increasing the number of simulations and independent runs, this may be particularly beneficial for the loci with low overall posterior support (e.g. A6 and NM). 

## References

Baker, Frank B. "Stability of two hierarchical grouping techniques Case I: Sensitivity to data errors." Journal of the American Statistical Association 69.346 (1974): 440-445.

Fowlkes, Edward B., and Colin L. Mallows. "A method for comparing two hierarchical clusterings." Journal of the American statistical association 78.383 (1983): 553-569.

Tavaré S (1986). "Some Probabilistic and Statistical Problems in the Analysis of DNA Sequences" (PDF). Lectures on Mathematics in the Life Sciences (American Mathematical Society) 17: 57–86.

Jiang, W., Chen, S.Y., Wang, H., Li, D.Z. & Wiens, J.J. Should genes with missing data be excluded from phylogenetic analyses? Mol Phylogenet Evol 80, 308-18 (2014).

Lemmon, A.R., Brown, J.M., Stanger-Hall, K., Lemmon, E.M., 2009. The effect of
ambiguous data on phylogenetic estimates obtained by maximum likelihood
and Bayesian inference. Syst. Biol. 58, 130–145.

Dunn, C.W. et al. Broad phylogenomic sampling improves resolution of the animal tree of life. Nature 452, 745-9 (2008).


## Supplement 

##Annomizing Data in R

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

##Script to collect 10% of tree_space

```{r}
#R-portion
setwd("~/my_working_dir")
set.seed(123456)
rand40 = floor(runif(4000,0,40000)) 
write.table(rand40, file = "40random.txt", quote = F, col.names = F, row.names =  F)
```
```{sh}
#Unix-portion

sort 40random.txt | uniq > 40_uniq_sorted_random.txt

sort tree_Space.trees > Tree_Space_sorted.trees

while read line; 
do grep -e "^$line" Tree_Space_sorted.trees >> 10percent_Tree_Space_sorted.trees
done < "40_uniq_sorted_random.txt"
echo "loop completed"
```

##General Scripts for plotting trees as used in this project

```{r}
library(ggtree) #load dependencies



###################
# Trees in GGTREE #
###################

#The code below produces a ggtree tree plot. Example from chromosome K
tree_K_gg = ggtree::read.beast("./output/chrm_GTR_Gamma_run_2.tree") #load the tree
ggtree(tree_K_gg)  + geom_text(aes(x= branch, label=node)) #visualize the raw tree
tree_K_gg_rr = ggtree::reroot(tree_K_gg, 110) #do not use ade for ggtree # reroot tree in desired node

tree_K_gg_rr_cl <- groupClade(tree_K_gg_rr, node=c(58,59)) #Classify nodes 58 and 59 and all of their descendants as clade objects.

Krrcl_ggtree = ggtree(tree_K_gg_rr_cl) + geom_tiplab(size=2.7, aes(colour = group)) + (geom_text2(aes(subset=(node="58"), x=branch, label=round(posterior, digits = 2), vjust=-0.3))) + geom_treescale(x=1.7, y=5) + geom_point2(aes(subset=(node = "58")), size=5, shape=23, fill="gold") + geom_tippoint(aes(color=group)) # This plots a pretty tree.

K_fasta = "~/myfasta_file_MSA.fasta"


Kchrom_phyloMSA = msaplot(Krrclf_ggtree, K_fasta, offset = 0.45) + annotate("text", x = 0, y = 0, label = "A") + annotate("text", x = 1.9, y = 0, label = "B") # This creates a figure that displays MSAs and Trees side by side
Kchrom_phyloMSA # plot the figure


```

## RvBayes code

```{r, eval = F}
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