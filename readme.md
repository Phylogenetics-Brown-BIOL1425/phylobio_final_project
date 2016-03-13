# Phylogenetic Biology - Final Project

## Guidelines - you can delete this section before submission

This repository is a stub for your final project. Fork it, develop your project, and submit it as a pull request. Edit/ delete the text in this readme as needed.

Some guidelines and tips:

- Use the stubs below to write up your final project. Alternatively, if you would like the writeup to be an executable document (with [knitr](http://yihui.name/knitr/), [jupytr](http://jupyter.org/), or other tools), you can create it as a separate file and put a link to it here in the readme.

- For information on formatting text files with markdown, see https://guides.github.com/features/mastering-markdown/ . You can use markdown to include images in this document by linking to files in the repository, eg `![GitHub Logo](/images/logo.png)`.

- The project must be entirely reproducible. In addition to the results, the repository must include all the data (or links to data) and code needed to reproduce the results.

- If you are working with unpublished data that you would prefer not to publicly share at this time, please contact me to discuss options. In most cases, the data can be anonymized in a way that putting them in a public repo does not compromise your other goals.

- Paste references (including urls) into the reference section, and cite them with the general format (Smith at al. 2003).

- Commit and push often as you work.

# Cophylogenetic analysis of hyperiid amphipods and their gelatinous planktonic hosts.

## Introduction and Goals

The goal of my project is to compare the evolutionary histories of hyperiid amphipod and their hosts, to test for phylogenetic signal in the associations, to identify congruence, host switching patterns, or incomplete sorting events during the coevolution of parasitoids and hosts.

The specificity of the interactions varies across families of hyperiid amphipods. Their relationship with their gelatinous hosts can integrate both trophic interactions (food source for individuals and/or descendants) and spatial niche (floating habitat, a solid surface to attach to).

I will use the hyperiid amphipod phylogeny published in Hunt & Haddock 2013.
I will use the parasitoid/phoront-host interaction data from Laval 1985, Harbison..., Gasca..., Haddock... to build an association matrix.
I will download the 18S gene sequences from GeneBank for the diversity of host species and build a gene tree to serve as a proxy for the species phylogeny.


## Methods

The tools I used were... See analysis files at (links to analysis files).

I will use RAxML and MrBayes to build 18S gene trees, identifying later a consensus tree between them. I will use non parametric bootstrap values and bayesian posteriors as measures of clade support.
I will use the R packages ape, phytools, and phangorn.

## Results

The tree in Figure 1...

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References


