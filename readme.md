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

Constructing a Gene Tree for the Protein Responsible for Light Detection in Cephalopod Chromatophores

## Introduction and Goals

After reading a paper on mRNA transcripts found in cephalopod skin, I learned that several ocular proteins are expressed in the skin and muscle. Most of these transcripts
are identical to their counterparts found in the eye of the animal, but in one squid, D. pealeii, the transcript expressed in the skin was different than that in the eye.
I theorized this could be due to a gene duplication event somewhere in the squid's ancestry, so I wanted to build a phylogenetic tree to see if I could trace when
the gene split off from the original, and then check if there is correlation between organisms capable of using pigment cells in their skin to camouflage
by taking into acount ambient light, and organisms in the clade demarcated by this gene duplication.

The methods I will use to do this are...
Multiple sequence alignment on mRNA sequences taken from skin and retina tissues of various cephalopods and related molluscs, as well as maximum likelyhood tree
estimation to attempt to build a phylogeny of the gene in question.
I will then check the tree to see where the particular sequence suspected to correspond to a gene duplication event (from Visual phototransduction components in cephalopod chromatophores suggest dermal photoreception
Alexandra C. N. Kingston, Alan M. Kuzirian, Roger T. Hanlon, Thomas W. Cronin) seems to occur in the tree, and see if organisms outside of the clade demarcated by this gene are capable of the sophisticated color-changing
patterns known in many cephalopod species.

I will be using publically available at NCBI, found via blast search on the transcript found in the mRNA expression study mentioned earlier.
The mRNA sequences I intend to use in particular correspond to the transcript for the alpha subunit of a heterotrimeric G-protein involved in light sensing.

## Methods

I used Mafft for multiple alignment: Started with affine gap: open penalty 1.5, penalty .5
I then used raxml with gamma_gtr to produce a maximum likelyhood phylogeny for the gene in question.
I am currently creating more trees with revbayes to see if they agree.
I looked for papers discussing the cephalopods that fell in parts of the phylogenetic tree which were of interest to the project.
In some cases, when very little research was available, I checked videos and images of the animal to see if I could find any evidence of the
behaviors I was seeking.

## Results

![alt tag](https://github.com/DanielSeidman/phylobio_final_project/blob/master/tree_marked.png)

Unfortunately, very little sequence data is actually available for the gene in question, though in the process of searching for more, it is possible that
I have elucidated some clues into the function of uncharacterized drosophila genes, as many had significant alignment to the squid gene I was searching for.


## Discussion

The duplicated gene does seem to demarcate a small subclade of squid. Frustratingly enough, 3 out of the sequences

## References


