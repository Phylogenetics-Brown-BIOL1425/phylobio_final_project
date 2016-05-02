# Testing ipyrad parameter effects on tree output for a recently diverged group

## Introduction and Goals

RADseq is a good method for sequencing parts of the genome. Once reads are sequenced, they have to be stitched together and aligned. One program for doing this, ipyrad ([Eaton, 2015](http://bioinformatics.oxfordjournals.org/content/30/13/1844)) has default parameters for stringency of alignment. Though the default parameters may work well in general, I do not know how well they work for recently diverged taxa that may have more sequence homology. In this study, I will run multiple assemblies with different levels of stringency in percent sequence/cluster overlap. I will then create trees with the different output files to see if we still reconstitute our expected trees.

To run this analysis, we will use sequence data from species and hybrids from previously identified populations of *Viburnum*. (Donoghue, 1982) The structure of this data will allow us to see how changes in clustering stringeny change our ability to resolve tree topology for closely related parent species and their recent hybrids. Given the close relations of the these plants, I hypothesize that they will have relatively similar sequence data, allowing us to use a higher clustering stringency than the default.

## Methods
We sequenced fifteen individuals from parent and hybrid populations using RADseq. Reads were assembled using ipyrad on default settings for the first five steps (clustering within samples.) The remaining steps (clustering between samples) were performed with a variety of clustering parameters. The results presented here represent between sample clustering at 75, 85 (default), 95 and 98% similarity. Sample clustering at lower percentages of similarity crashed. I took the .phy outputs from ipyrad and used RAxML ([Stamatakis, 2014](http://bioinformatics.oxfordjournals.org/content/early/2014/01/21/bioinformatics.btu033.abstract?keytype=ref&ijkey=VTEqgUJYCDcf0kP)) to make trees using a GTR+gamma model of evolution and 100 bootstrap replicates. 

## Results

![Figure 1](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.default.png)
*Figure 1* Default settings, 85% clustering

![Figure 2](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.stringency_75.png)
*Figure 2* 75% clustering

![Figure 3](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.stringency_95.png)
*Figure 3* 95% clustering

![Figure 4](https://github.com/moeglein/phylobio_final_project/blob/master/figures/RAxML_bipartitions.stringency_98.png)
*Figure 4* 98% clustering


## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References

Donoghue. Systematic studies in the genus *Viburnum*. PhD thesis. Harvard University, Department of Organismal and Evolutionary Biology. 1982.

[Eaton. PyRAD: assembly of *de novo* RADseq loci for phylogenetic analyses. Bioinformatics. 2014. 30(13):1844-1849.](http://bioinformatics.oxfordjournals.org/content/30/13/1844)

[Stamatakis. RAxML Version 8: A tool for Phylogenetic Analysis and Post-Analysis of Large Phylogenies. Bioinformatics. 2014. 30(9): 1312-1313.](http://bioinformatics.oxfordjournals.org/content/early/2014/01/21/bioinformatics.btu033.abstract?keytype=ref&ijkey=VTEqgUJYCDcf0kP)



