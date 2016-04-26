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

The goal of my project is to answer the question, What is...?
Point at which cephalopods (or mollusks if outside of cephalopoda) make a significant move towards having functioning light detection capacitites in their skin cells.

The methods I will use to do this are...
Multiple sequence alignment on large numbers or mRNA sequences taken from skin and retina tissues of various cephalopods and related molluscs, as well as bayesian inference
(revbayes) to produce consensus trees for the mRNA in question.
I will then check the tree to see where the particular sequence suspected to correspond to a gene duplication event (from Visual phototransduction components in cephalopod chromatophores suggest dermal photoreception
Alexandra C. N. Kingston, Alan M. Kuzirian, Roger T. Hanlon, Thomas W. Cronin) seems to occur in the tree, and see if organisms outside of the clade demarcated by this gene are capable of the sophisticated color-changing
patterns known in many cephalopod species.

The data I will use are (my own data/ data publicly available at YYY/ simulations)
Publically available at NCBI, searched via blast by comparison to a variant of the mRNA sequence in question.
The mRNA sequences I intend to use in particular correspond to the transcript for the alpha subunit of a heterotrimeric G-protein involved in light sensing.

## Methods

The tools I used were... See analysis files at (links to analysis files).
Mafft: Started with affine gap: open penalty 1.5, penalty .5
Since data is all mRNA sequences, I had figured that gaps should probably be penalized somewhat harshly, but I underestimated the amount of missing data from each
sequence, and I may have to realign with the fact in mind that very little of the sequences actually matches any of the other sequence due to holes in the data.

## Results

It looks like the duplication event I was interested in may have occured IN the organism in question, or at least in a very recent ancestor, and may not actually
be useful for the purposes of my project. I may try again with another gene (rhodopsin?) to see if I can resolve a clade for the sophisiticated control of chromatophores
even without a specific gene duplication event.

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References


