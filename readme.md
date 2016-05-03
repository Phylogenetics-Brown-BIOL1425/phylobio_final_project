# Testing ipyrad parameter effects on tree output for a recently diverged group

## Introduction and Goals

RADseq [Baird et al., 2008](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0003376) is a commonly used method for DNA sequencing when the aim is to sequence only a subset of the genome. It involves fragmenting total DNA, sequencing the short reads, and then stitching proximal pieces back together, producing a set of longer sequences, or contigs. These contigs are ideally made up of many overlapping reads contributing to increased coverage and thus increased certainty of the given sequence. Once contigs are assembled for one individual, they can then be compared across individuals for the purpose of comparative study. 

The challenge of building and comparing contigs is nontrivial. Finding overlap between millions of reads, building a consensus sequence, and then comparing these sequences between individuals is computationally intensive and statistically challenging. One program designed to facilitate this type of analysis is ipyrad ([Eaton, 2015](http://bioinformatics.oxfordjournals.org/content/30/13/1844)), the use of which will be the focus of this project.

Ipyrad has many customizable parameters for the assembly and comparison of RADseq data, but these parameters are set to default settings if you do not change them yourself. While the default parameters are generally sufficient, they may not be ideal for all analyses. One possible parameter we may want to change is the stringency of clustering. The default parameter for clustering reads within or between samples is 85%, meaning that two reads or two contigs must have 85% sequence similarity in order to be grouped together. While this may be suitable for most studies comparing species that have diverged a relatively long time ago, it may not be stringent enough for more recently diverged taxa that share more sequence similarity. A clustering threshold that is too low may lump together paralogs that could muddy the evolutionary history of certain genes. A clustering threshold that is too high could lead to a loss of contigs that could have been informative to the comparative analysis. The goal of my project is to answer the question, what is the best clustering stringency for assembling RADseq data when comparing individuals, especially when those individuals are recently diverged.

In this project, I will optimize clustering thresholds for RADseq data obtained from members of the woody shrub genus *Viburnum*. This data was collected from a complex of closely related Mexican species and their hybrids. (Donoghue, 1982) *V. mattii* and *V. oonakatensis* are sister species that are known to hybridize. *V. bonolobum* and *V. neilius* are also sister species that are known to hybridize. The *V. mattii/oonakatensis* and *V. bonolobum/neilius* complexes are closely related (divergence within the last 2 million years), but are not known to hybridize and are geographically separated. Because we have a known phylogenetic topology expected in this group, these sequences present a good data set for testing the affect of recent divergence on clustering parameters. After assembling the data with various clustering parameters in ipyrad, I will check how the parameters change tree topology by building trees in [RAxML](http://bioinformatics.oxfordjournals.org/content/early/2014/01/21/bioinformatics.btu033.abstract?keytype=ref&ijkey=VTEqgUJYCDcf0kP). The trees that most closely resemble the expected relationships of these individuals will indicate the clustering parameter that best fits these recently diverged taxa.

## Methods

To create assemblies at different clustering thresholds, RADseq files in fastq format were assembled into contigs using ipyrad. The first five steps of the assembly (1. start assembly, 2. filter reads, 3. cluster reads within individual/sample, 4. joint estimation of error rate and heterozygosity, 5. consensus base calling within individual/sample) were performed once to produce consensus contigs for each sample. This part of the analysis was run using a [parameters file](https://github.com/moeglein/phylobio_final_project/blob/master/code/params-default.txt) containing default settings and the command: ipyrad -p params-default.txt -s 12345. 

After this step, I created parameter files for [75%]( https://github.com/moeglein/phylobio_final_project/blob/master/code/params-75.txt), [95%]( https://github.com/moeglein/phylobio_final_project/blob/master/code/params-95.txt), and [98%]( https://github.com/moeglein/phylobio_final_project/blob/master/code/params-98.txt) clustering stringency by [branching](https://github.com/moeglein/phylobio_final_project/blob/master/code/ipyrad_code) the earlier analysis and then changing the clust_threshold value to it’s respective percentage. The [default](https://github.com/moeglein/phylobio_final_project/blob/master/code/params-default.txt) parameter file was left as is at a clust_threshold of 85%. I then ran the remaining sixth and seventh step of the ipyrad assembly with the command: ipyrad -p params-X.txt -s 67, where X is 75, default, 95, or 98 respectively. The sixth step clusters the individual sample consensus sequences between samples with a percent similarity specified by clust_threshold. Step 7 does a final filtering step and then outputs various file formats for cluster analysis, including the [.phy](https://github.com/moeglein/phylobio_final_project/tree/master/data) files used here for tree building and ipyrad [stats]( https://github.com/moeglein/phylobio_final_project/tree/master/data) files showing information about total reads and clustering.

After ipyrad assembly at different clustering parameters was finished, I used the .phy file output to create maximum likelihood trees in [RAxML](https://github.com/moeglein/phylobio_final_project/blob/master/code/default_tree.sh) with a GTR+gamma model of evolution and 100 bootstrap replicates. I then used the [bipartitions](https://github.com/moeglein/phylobio_final_project/blob/master/data/RAxML_bipartitions.default) output to view my trees in FigTree.


## Results

Figure one is a tree created from clusters assembled using default parameters. Specifically, the clusters between species had to have a minimum of 85% sequence overlap

![Figure 1](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.default.png)

*Figure 1*: Default settings, 85% clustering

![Figure 2](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.stringency_75.png)

*Figure 2*: 75% clustering

![Figure 3](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.stringency_95.png)

*Figure 3*: 95% clustering

![Figure 4](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.stringency_98.png)

*Figure 4*: 98% clustering


## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References

[Baird NA, Etter PD, Atwood TS, Currey MC, Shiver AL, Lewis ZA, et al. Rapid SNP Discovery and Genetic Mapping Using Sequenced RAD Markers. PLoS ONE 2008. 3(10): e3376.](http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0003376)

[Eaton. PyRAD: assembly of *de novo* RADseq loci for phylogenetic analyses. Bioinformatics. 2014. 30(13):1844-1849.](http://bioinformatics.oxfordjournals.org/content/30/13/1844)

Donoghue. Systematic studies in the genus *Viburnum*. PhD thesis. Harvard University, Department of Organismal and Evolutionary Biology. 1982.

[Stamatakis. RAxML Version 8: A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies. Bioinformatics. 2014. 30(9): 1312-1313.](http://bioinformatics.oxfordjournals.org/content/early/2014/01/21/bioinformatics.btu033.abstract?keytype=ref&ijkey=VTEqgUJYCDcf0kP)




