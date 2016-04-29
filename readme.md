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

OK, here we go.

# Lamiaceae Phylogeny, An Exploration

## Introduction and Goals

The goal of my project is to answer the question, what are the evolutionary relationships between taxa in the plant family Lamiaceae, and how are the discovered evolutionary relationships affected by the phylogenetic inferences made to analyze them.

The methods I will use to do this are...

The data I will use are sequences available online from different papers on previous Lamiaceae phylogenies.

## Methods

Downloaded fasta files for the genes, trnK, trnL, and ITS as available for each species from GenBank, using the accession numbers in Table 2 of C. Brauchler et al 2010. 
Combined the fasta files for each gene using the commands cat *_trnK.fasta > trnKcombined.raw.fasta cat *_trnL.fasta > trnLcombined.raw.fasta cat *_ITS.fasta > ITScombined.raw.fasta
Changed the fasta header rows to have just the species name using the commands sed -E 's/>.+\| ([a-zA-Z]+) ([a-zA-Z]+)[\. ].+/>\1_\2/g' trnKcombined.raw.fasta > trnKcombined.fasta
sed -E 's/>.+\| ([a-zA-Z]+) ([a-zA-Z]+)[\. ].+/>\1_\2/g' trnLcombined.raw.fasta > trnLcombined.fasta
sed -E 's/>.+\| ([a-zA-Z]+) ([a-zA-Z]+)[\. ].+/>\1_\2/g' ITScombined.raw.fasta > ITScombined.fasta


## Results

The tree in Figure 1...

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References


