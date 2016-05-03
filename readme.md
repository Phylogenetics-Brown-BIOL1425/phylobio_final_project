# Testing ipyrad Parameter Effects on Tree Output for a Recently Diverged Group

## Introduction and Goals

RADseq ([Baird et al., 2008](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0003376)) is a commonly used method for DNA sequencing when the aim is to sequence only a subset of the genome. It involves fragmenting total DNA, sequencing the short reads, and then stitching proximal pieces back together, producing a set of longer sequences, or contigs. These contigs are ideally made up of many overlapping reads contributing to increased coverage and thus increased certainty of the given sequence. Once contigs are assembled for one individual, they can then be compared across individuals for the purpose of comparative study. 

The challenge of building and comparing contigs is nontrivial. Finding overlap between millions of reads, building a consensus sequence, and then comparing these sequences between individuals is computationally intensive and statistically challenging. One program designed to facilitate this type of analysis is ipyrad ([Eaton, 2015](http://bioinformatics.oxfordjournals.org/content/30/13/1844)), the use of which will be the focus of this project.

Ipyrad uses default parameters for the assembly and comparison of RADseq data. While the default parameters are generally sufficient, they may not be ideal for all analyses. One possible parameter we may want to change is the stringency of clustering. The default parameter for clustering reads within or between samples is 85%, meaning that two reads or two contigs must have 85% sequence similarity in order to be grouped together. While this may be suitable for most studies comparing species that have diverged a relatively long time ago, it may not be stringent enough for more recently diverged taxa that share more sequence similarity. A clustering threshold that is too low may lump together paralogs or cluster reads that don't actually belong to the same locus, obscuring the evolutionary history we are trying to reconstruct with too much noise. A clustering threshold that is too high could lead to a loss of contigs that could have been informative to the comparative analysis. The goal of my project is to answer the question, what is the best clustering stringency for assembling RADseq data when comparing individuals that are recently diverged?

In this project, I will optimize clustering thresholds for RADseq data obtained from members of the woody shrub genus *Viburnum*. This data was collected from a complex of closely related Mexican species and their hybrids. (Donoghue, 1982) *V. mattii* and *V. oonakatensis* are sister species that are known to hybridize. *V. bonolobum* and *V. neilius* are also sister species that are known to hybridize. The *V. mattii/oonakatensis* and *V. bonolobum/neilius* complexes are closely related (divergence within the last 2 million years), but are not known to hybridize and are geographically separated. It is not known when exactly the hybridization events took place in these groups, but we can assume that it was more recent than their original divergence. Because we have an expected phylogenetic topology for this group, these sequences present a good data set for testing the affect of clustering parameters on tree topology in a recently diverged group. After assembling the data with various between-species clustering parameters in ipyrad, I will check how the parameters change tree topology by building trees in RAxML ([Stamatakis, 2014](http://bioinformatics.oxfordjournals.org/content/early/2014/01/21/bioinformatics.btu033.abstract?keytype=ref&ijkey=VTEqgUJYCDcf0kP)). The trees that most closely resemble the expected relationships of these individuals will indicate clustering parameters that may be a better fit than the defaults for recently diverged taxa.

## Methods

To create assemblies at different clustering stringencies, I assembled RADseq fastq files into contigs using ipyrad. The first five steps of the assembly (1. start assembly, 2. filter reads, 3. cluster reads within sample, 4. joint estimation of error rate and heterozygosity, 5. consensus base calling within sample) were performed once to produce consensus contigs for each sample. This part of the analysis was run using a [parameters file](https://github.com/moeglein/phylobio_final_project/blob/master/code/params-default.txt) containing default settings and the command: ipyrad -p params-default.txt -s 12345. 

After this step, I created parameter files for [75%]( https://github.com/moeglein/phylobio_final_project/blob/master/code/params-75.txt), [95%]( https://github.com/moeglein/phylobio_final_project/blob/master/code/params-95.txt), and [98%]( https://github.com/moeglein/phylobio_final_project/blob/master/code/params-98.txt) clustering stringency by [branching](https://github.com/moeglein/phylobio_final_project/blob/master/code/ipyrad_code) the earlier analysis and then changing the clust_threshold value to it’s respective percentage. The [default](https://github.com/moeglein/phylobio_final_project/blob/master/code/params-default.txt) parameter file was left as is at a clust_threshold of 85%. I then ran the remaining sixth and seventh step of the ipyrad assembly with the command: ipyrad -p params-X.txt -s 67, where X is 75, default, 95, or 98. The sixth step clusters the individual sample consensus sequences between samples with a percent similarity specified by clust_threshold. Step 7 does a final filtering step and then outputs various file formats for cluster analysis, including the [.phy](https://github.com/moeglein/phylobio_final_project/tree/master/data) files used here for tree building and ipyrad [stats]( https://github.com/moeglein/phylobio_final_project/tree/master/data) files showing information about total reads and clustering. I attempted to run this analysis at lower clustering stringencies as well, but anything under 75% clust_threshold broke the assembler and would not run to completion. The ipyrad code I used for all steps can be found [here](https://github.com/moeglein/phylobio_final_project/blob/master/code/ipyrad_code).

After finishing ipyrad assembly at different clustering parameters, I used the .phy file output to create unrooted maximum likelihood trees in [RAxML](https://github.com/moeglein/phylobio_final_project/blob/master/code/default_tree.sh) with a GTR+gamma model of evolution and 100 bootstrap replicates. I then used the [bipartitions](https://github.com/moeglein/phylobio_final_project/blob/master/data/RAxML_bipartitions.default) output to view my trees in FigTree.


## Results and Discussion

In evaluating the resulting trees, I expected individuals of the same species to form clades. I also expected *V. oonakatensis* and *V. mattii* to be near each other with their hybrids in between and *V. bonolobum* and *V. neilius* to be near each other and their hybrids. I expected some uncertainty in the placement of hybrids in the tree given their genetic similarity to either parent and some uncertainty within the clades containing parents given that they are members of the same population and possibly so similar that it is hard to get phylogenetic signal. 

The tree built with the ipyrad default parameter of 85% similarity (Figure 1) did a pretty good job of recreating these expected relationships. The *V. mattii/oonakatensis* clade is strongly supported with hybrids falling near the parents. It is unexpected that *V. mattii* does not form a monophyletic group, raising the possibility that the hybrid V_oXm_2 could have been misidentified, but the placement of V_oXm_2 has very low support, so we cannot be sure. The *V. bonolobum/neilius* complex is hard to resolve given that there are fewer sequenced individuals, but at least they didn't land in the *V. mattii/oonakatensis* part of the tree, providing something of a sanity check.

![Figure 1](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.default.png)

*Figure 1*: Default settings, 85% clustering

The tree built using a 75% clustering threshold (Figure 2) is a complete mess. Though the most likely tree generally recapitulates the expected groups, many of the placements have zero bootstrap support. In this clustering analysis, any sequences with 75% or more overlap were counted as belonging to the same locus. Because 75% is not a very stringent threshold, it is possible that paralogs with different evolutionary histories could have been lumped together as one locus, leading to difficulty in resolving evolutionary relationships. The 75% stringency threshold also allowed for a larger number of alignment patterns ([359635](https://github.com/moeglein/phylobio_final_project/blob/master/data/RAxML_info.stringency_75) 75% compared to [263435](https://github.com/moeglein/phylobio_final_project/blob/master/data/default_stats.txt) at 85%) allowed in the analysis, some of which may share sequence similarity by chance. 

![Figure 2](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.stringency_75.png)

*Figure 2*: 75% clustering

The 95% and 98% clustering thresholds (Figures 3 and 4) produced trees closer to what I was expecting. The expected species complexes are present and strongly supported and all members of *V. mattii* form a clade, unlike in the default analysis. Furthermore, the 98% stringency tree shows ambiguous placement of the V_oXm hybrids while maintaining strong support for the parent clades and the *V. mattii/oonakatensis* clade in general. This is the tree that makes the most sense to me given the expected species relationships and the intermediate nature of the hybrids. Even though these clustering stringencies are more strict, they still resulted in [164821](https://github.com/moeglein/phylobio_final_project/blob/master/data/RAxML_info.stringency_95) and [81510](https://github.com/moeglein/phylobio_final_project/blob/master/data/RAxML_info.stringency_98) distinct alignment patterns for RAxML to build trees with for 95% and 98% clustering respectively.

![Figure 3](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.stringency_95.png)

*Figure 3*: 95% clustering

![Figure 4](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.stringency_98.png)

*Figure 4*: 98% clustering

Thoughts on hybrids relative to parents: are some hybrids more like certain parents? Another next step could be to look at the actual genes involved at the different stringency levels. More sequencing is coming and will provide more narratives in the story. I would expect that the heterozygosity that is probably more present in the hybrids would make them more difficult to assemble.



## References

[Baird NA, Etter PD, Atwood TS, Currey MC, Shiver AL, Lewis ZA, et al. Rapid SNP Discovery and Genetic Mapping Using Sequenced RAD Markers. PLoS ONE 2008. 3(10): e3376.](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0003376)

[Eaton. PyRAD: assembly of *de novo* RADseq loci for phylogenetic analyses. Bioinformatics. 2014. 30(13):1844-1849.](http://bioinformatics.oxfordjournals.org/content/30/13/1844)

Donoghue. Systematic studies in the genus *Viburnum*. PhD thesis. Harvard University, Department of Organismal and Evolutionary Biology. 1982.

[Stamatakis. RAxML Version 8: A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies. Bioinformatics. 2014. 30(9): 1312-1313.](http://bioinformatics.oxfordjournals.org/content/early/2014/01/21/bioinformatics.btu033.abstract?keytype=ref&ijkey=VTEqgUJYCDcf0kP)




