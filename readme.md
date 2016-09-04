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


Determining the Presence and Significance of a Gene Duplication Event of the Alpha Subunit of a Heterotrimeric G-protein in the Evolutionary History of Cephalopod Camouflage.

## Introduction and Goals

After reading a paper on mRNA transcripts found in cephalopod skin (Kingston et al. 2015), I learned that several ocular proteins are expressed in the skin and muscle. Most of these transcripts
are identical to their counterparts found in the eye of the animal, but in one squid, _D. pealei_, the transcript expressed in the skin was different than that in the eye.
I theorized this could be due to a gene duplication event somewhere in the squid's ancestry, so I wanted to build a phylogenetic tree to see if I could trace when
the gene split off from the original, and then check if there is correlation between organisms capable of using pigment cells in their skin to camouflage
by taking into account ambient light, and organisms in the clade demarcated by this gene duplication.


I will be utilizing multiple sequence alignment on mRNA sequences taken from skin and retina tissues of various cephalopods and related molluscs, as well as maximum likelihood tree
estimation and bayesian inference to attempt to build a phylogeny of the gene in question.
I will then check the tree to see where the particular sequence suspected to correspond to a gene duplication event seems to occur in the tree,
and see if organisms outside of the clade demarcated by this gene are capable of the sophisticated color-changing patterns known in many cephalopod
species.

I will be using publically available at NCBI, found via blast search on the transcript found in the mRNA expression study mentioned earlier.
The mRNA sequences I intend to use in particular correspond to the transcript for the alpha subunit of a heterotrimeric G-protein involved in light sensing.

## Methods

I used Mafft for multiple alignment: Started with affine gap: open penalty 1.5, penalty .5
I then used raxml with gamma_gtr to produce a maximum likelihood phylogeny for the gene in question.
I have also tested the tree with revbayes under the GTR model and jukes cantor model twice each.
While parts of the overall tree do sometimes differ, every single tree built supports the characteristics I will be discussing.
I looked for papers discussing the cephalopods that fell in parts of the phylogenetic tree which were of interest to the project.
In some cases, when very little research was available, I checked videos and images of the animal to see if I could find any evidence of the
behaviors I was seeking.

Further, I will be using the following full cephalopod phylogeny to compare with my results:
![alt tag](https://github.com/DanielSeidman/phylobio_final_project/blob/master/full_cephalopod_phylogeny.jpg)
(Lindgren AR Pankey MS Hochberg FG Oakley TH 2012)

raxml trees were done with 1000 bootstraps,
and revBayes trees were run with a burn in of 1000 trees, and two successive trials of 20000 trees total.


## Results

![alt tag](https://github.com/DanielSeidman/phylobio_final_project/blob/master/tree_marked.png)
This image comes from raxml with the GTR_gamma model, on all the sequences I found with meaningful alignment with the given gene.
![alt tag](https://github.com/DanielSeidman/phylobio_final_project/blob/master/Reasonable_tree_image.png)

Unfortunately, very little sequence data is actually available for the gene in question, though in the process of searching for more, it is possible that
I have elucidated some clues into the function of some uncharacterized drosophila genes, as many had significant alignment to the squid gene I was searching for.

I ran with multiple different tree-building programs, alignment parameters, and models. The table below summarizes some of the key features of the trees
that I use in my analysis of the gene duplication event.

![alt tag](https://github.com/DanielSeidman/phylobio_final_project/blob/master/table_results.png)

For reference, with regards to the alignment parameters: 
non-affine penalties were 1 for extension and 0 for opening.
Harsh penalties were 5 for extension and 10 for opening.
Default penalties were 0.123 for extension and 1.53 for opening.
Custom penalties were .5 for extension and 1.5 for opening. I thought it might be reasonable to be harsher on extensions than the default, since we
were dealing with mRNA sequences which were likely post-splicing.


The placement of the clade _Sepia_ within the tree, and the organisms within the clade I am attempting to characterize are relatively consistent throughout
the trees I have created.

I elected to favor revBayes, as the boostrap values coming from raxml were extremely low, possibly due to how small the fraction of the aligned sequences
which actually contained data was compared to the total number of aligned sites.

## Discussion

The sequence from the theoretically duplicated gene (KR107042.1) does seem to demarcate a small subclade of squid. Frustratingly enough, 2 of the three sequences shown inside of that clade are the 
same animal (_D. pealei_ and _L. pealei_ are both the same species). _L. forbesi_ is a different, though related squid. As discussed by the study on which this project is 
based, we know that D. pealei and L. pealei have the capacity to alter their chromatophore states in response to differing light levels in order to better camouflage.
This data was not available for L. forbesi, which appears to be little studied, though a study has shown that the squid has extraocular photoreceptors in vescicles behind
its eyes(Cobb and Williamson, 1998). It is possible that it may have some form of light-adapting camouflage behavior, or is at least partially equipped for it.

On the other hand, outside of this clade, we see 2 sequences for the squid Euprymna scolopes (one derived from the eye, the other from the squid's light emitting organ). This squid is also known to react to light, but it does not use light information
for regulating its chromatophores. Rather, it uses this capacity to regulate the output of light-emitting organs to break up its silhouette, while actually concealing
itself when on the sea bed by covering itself in sediment(Jones and Nishiguchi 2004). It therefore does not demonstrate the chromatophore regulation we are seeking. 

Finally, an unusual result
shows up in the gene tree: _Sepia officinalis_ shows up as a sister taxa to Euprymna scolopes. The other animals I have discussed so far are all squid, while Sepia officinalis
is a cuttlefish. The gene tree, as one would expect, disagrees with the general phylogeny for cephalopods in general. It is very interesting to note, however, that
Sepia officinalis is known to possess transcripts for other ocular proteins in its skin, much like _D. pealei_ (M�thger et al, 2010). It is not known whether this
animal responds to light in similar ways to squid above, but it is hypothesized that _Sepia officinalis_ could use the extra-ocular light information to help supplement
its information about light-gradients around it, as the animal is known to be color blind, but still produces complex and effective patterns to camouflage in a variety
of different substrates. While this is clearly supposition, and also rather unlikely, it is an interesting thought that the unusual similarity between these two mRNA sequences may suggest
convergent evolution. Alternatively, it might be a sign of deep coalescence, or possibly this is just do to the fragmented nature of the sequences used in this study.
We need more and better sequence data to resolve this issue.

It is worthy of note that _Octopus bimaculoides_ is also hypothesized to possess the ability to regulate its chromatophores via light information obtained 
through the skin (Ramirez and Oakley 2015), which might be indicative of an independent evolution of the same capacity, or a sign that we have attributed too much significance
to the gene duplication event. 

All in all, we need more sequences of this mRNA in squid to be able to confirm or deny the significance of this protein duplication event in the evolutionary history
of squid camouflage techniques, especially transcripts found in skin, of which there are very few. Until that happens, these theories will just have to remain
speculation.

However, I recently learned that _Doryteuthis pealei_ is known for having a very high rate of post-transcriptional RNA site editing (Rosenthal 2015), which could very easily
invalidate the results found in this project. As such, the null hypothesis is not rejected, and without more data, we are forced to assume that there is no
real connection between what may or may not even be a gene duplication event.


## References



Cobb CS, Williamson R. 1998. Electrophysiology of Extraocular Photoreceptors in the squid Loligo forbesi (CEPHALOPODA: LOLIGINIDAE). Journal of Molluscan Studies. 64,111-11
http://mollus.oxfordjournals.org/content/64/1/111.short

Jones BW, Nishiguchi MK. 2004 Counterillumination in the Hawaiian bobtail squid, Euprymna scolopes Berry (Mollusca: Cephalopoda). Marine Biology, 144(6), pp 1151-1155
http://link.springer.com/article/10.1007/s00227-003-1285-3

Kingston ACN, Kuzirian AM, Hanlon RT, Cronin TW. 2015. Visual phototransduction components in cephalopod chromatophores suggest dermal photoreception. The Journal of Experimental Biology. 218, 1596-1602. doi:10.1242/jeb.117945
http://jeb.biologists.org/content/218/10/1596

Lindgren AR, Pankey MS, Hochberg FG, Oakley TH. 2012. A multi-gene phylogeny of Cephalopoda supports convergent morphological evolution in association with multiple habitat shifts in the marine environment. BMC Evolutionary Biology 2012. 12, 129 
http://bmcevolbiol.biomedcentral.com/articles/10.1186/1471-2148-12-129

M�thger LM, Roberts SB, Hanlon RT. 2010. Evicence for distributed light sensing in the skin of cuttlefish, Sepia officinalis. Biology Letters. 
http://www.ncbi.nlm.nih.gov/pubmed/20392722

Ramirez MD, Oakley TH. 2015. Eye-independent, light-activated chromatophore expansion (LACE) and expression of phototransduction genes in the skin of Octopus bimaculoides. Journal of Experimental Biology. 218: 1513-1520; doi: 10.1242/jeb.110908
http://jeb.biologists.org/content/218/10/1513

Rosenthall JJC. 2015. The emerging role of RNA editing in plasticity. The Journal of Experimental Biology. 218, 1812-1821 doi:10.1242/jeb.119065
http://jeb.biologists.org/content/jexbio/218/12/1812.full.pdf