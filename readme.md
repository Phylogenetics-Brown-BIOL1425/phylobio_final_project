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

# Title of my project
  Phylogeny of major histocompatibility complex class II DQA variation in leporids

# Introduction and Goals

One goal of my project is to answer the question, What is the evolutionary history of the
major histocompatibility complex (MHC) class II gene DQA in leporids (leporidae), a
mammalian family that includes over 60 species of rabbits and hares. MHC play a crucial 
role in initiating the vertebrate immune response, and they are exceptionally polymorphic. 
There is typically considerable variation in sequence diversity and/or copy number of MHC 
genes both within and across species. This high diversity is thought to be maintained by
several non-exclusive mechanisms, including pathogen-driven selection for advantageous
rare allelic variants and/or MHC heterozygotes, and MHC-dependent sexual selection. 

I am focusing on the MHC class II gene DQA for two reasons: one, I am sequencing this gene
for my own research purposes, and two, it is the only MHC class II gene available in
public databases for a wide variety of leporid species. Surridge et al. (2008) sequenced
exon 2 of the MHC class II gene DQA in 16 different genera of lagomorphs; for DQA gene
studies, the functional part referred to as the "antigen-binding site" or "peptide-binding
site" is typically sequenced, as this is the part of the protein that binds antigens and
is encoded by exon 2. The authors constructed a neighbor-joining tree, and while this
yielded novel insight into lagomorph MHC evolution, I am interested in applying
maximum-likelihood and Bayesian phylogeny constructions to this dataset.

Because European hare (Lepus europaeus) MHC DQA genes are well characterized across 
different areas of Europe (de Bellocq et al. 2009; Koutsogiannouli et al. 2009), I am 
also interesting in delving deeper into the phylogeography of DQA in this species by 
compiling a dataset that encompasses both of these papers and also applies
maximum-likelihood and Bayesian approaches to constructing gene trees.

A second goal is to learn methods that I will directly apply to my dissertation research.
I want to gain experience using RAXML and RevBayes for gene tree constructions for single
MHC genes across species and populations.

## Methods

Instructions for analyses including code can be found in Instructions_LeporidsAnalysis.txt
and Instructions_LepusAnalysis.txt, and scripts can be found in the folder scripts.

To obtain DQA sequences for leporids, I downloaded the Surridge et al. 2008 sequences
from GenBank in a fasta file. To obtain DQA sequences for Lepus europaeus across Europe,
I downloaded sequences from de Bellocq et al. 2009 and Koutsogiannouli et al. 2009 from
Genbank.

I used the alignment program Mafft to align separately align DQA leporid and
L. europaeus sequences. Alignments were inspected using Mesquite and exported as .nex and
.phy files. ModelGenerator v851 (Keane et al. 2006) was used to compare across 56 nucleotide substitution
models to select the best fit for the leporid and L. europaeus datasets. For leporids, 
AIC1, AIC2, and BIC all converged on the K80+G model as the best fit. For the L. europaeus
dataset, AIC1, AIC2, and BIC selected either TrNef+I+G or TrNef+G as the best fit.
However, since I was unsure how to implement these models in RevBayes and RAXML, I used
the next best fit model, which was K80+G.

RAXML runs were conducted on OSCAR using RAXMLv8.2.0, which allows for the K80 model to be
specified. For both the leporid and the L. europaeus datasets, the K80 model and the
GTR+G model were run; although GTR+G ranked low for the model fit, I was unable to
incorporate gamma-distributed rate variation with the K80 model and thus the GTR+G run
was a purely exploratory run to incorporate this parameter. All RAXML runs used 100
bootstrap replicates.

RevBayes analyses were conducted using a K80 model with gamma-distributed rate 
variation (alpha=0.5). Several preliminary RevBayes runs were conducted to explore 
changing the alpha value and altering generation time, and scripts and data for these
analyses are including in this repo. The generation times for the trees presented are
100,000 (leporids) and 40,000 (lepus). Two RevBayes runs were conducted for each dataset
to compare topologies and posterior probabilities.

Tree logs were inspected using Tracer v1.6.0 and trees were generated using 
FigTree v1.4.2.

## Results

Figure 1 shows phylogenetic relationships of leporid DQA exon 2 sequences using a
maximum-likelihood analysis and the the K80 model of evolution. Bootstrap values are
indicated. Tree is rooted using human and sheep DQA sequences.

Figure 2 shows phylogenetic relationships of leporid DQA exon 2 sequences using a
maximum-likelihood analysis and the the GTR+G model of evolution. Bootstrap values are 
indicated. Tree is rooted using human and sheep DQA sequences.

Figure 3 shows phylogenetic relationships of leporid DQA exon 2 sequences using bayesian 
analysis of leporid DQA exon 2 sequence under the K80+G model of evolution. Bayesian
posterior probabilities are shown. Tree is rooted using human and sheep DQA sequences.

Figure 4 shows phylogenetic relationships of leporid DQA exon 2 sequences using bayesian 
analysis of leporid DQA exon 2 sequence under the K80+G model of evolution. Bayesian
posterior probabilities are shown. Tree is rooted using human and sheep DQA sequences.
This tree displays a different topology than that generated in run 1 (Figure 3).

Figure 5 shows phylogenetic relationships of leporid DQA exon 2 sequences using topology
generated from a Bayesian analysis and displayed in Figure 3. Support values above 50 are
displayed in the format of ML-GTRG/ML-K80/B1/B2 for clades that were generated across all
four analyses. ML-GTRG = Maximum-likelihood under GTR+G bootstrap values (Figure 2),
ML-K80 = Maximum-likelihood under K80 bootstrap values (Figure 1), B1 = RevBayes run 1 
posterior probability (Figure 3), B2 = RevBayes run 2 posterior probability (Figure 4).
Tips are colored according to species identity.

Figure 6 shows phylogenetic relationships of Lepus europaeus DQA exon 2 sequences using a
maximum-likelihood analysis and the the K80 model of evolution. Bootstrap values are
indicated. Tree is unrooted.

Figure 7 shows phylogenetic relationships of Lepus europaeus DQA exon 2 sequences using a
maximum-likelihood analysis and the the GTR+G model of evolution. Bootstrap values are 
indicated. Tree is unrooted.

Figure 8 shows phylogenetic relationships of Lepus europaeus exon 2 sequences using
bayesian analysis of leporid DQA exon 2 sequence under the K80+G model of evolution. 
Bayesian posterior probabilities are shown. Tree is unrooted.

Figure 9 shows phylogenetic relationships of Lepus europaeus exon 2 sequences using
bayesian analysis of leporid DQA exon 2 sequence under the K80+G model of evolution.
Bayesian posterior probabilities are shown. Tree is unrooted. This tree displays a 
different topology than that generated in run 1 (Figure 8).

Figure 10 shows phylogenetic relationships of Lepus europaeus exon 2 sequences using
topology generated from a Bayesian analysis and displayed in Figure 8.
Support values above 50 are displayed in the format of ML-GTRG/ML-K80/B1/B2 for clades
that were generated across all four analyses. ML-GTRG = Maximum-likelihood under 
GTR+G bootstrap values (Figure 7), ML-K80 = Maximum-likelihood under K80 bootstrap values
(Figure 6), B1 = RevBayes run 1 posterior probability (Figure 8), B2 = RevBayes run 2 
posterior probability (Figure 9). Population locations indicated below species name
and are from Koutsogiannouli et al. 2009. and Gouy de Bellocq et al. 2009: GR=Greece,
BG=Bulgaria, TR=Turkey, IL=Israel, A=Austria, F=France, D=Germany, NL=Netherlands,
GB=Great Britain, PL=Poland, and CH=Switzerland.

## Discussion

The four leporid DQA analyses each displayed different topologies with low branch support,
indicating poor resolution of the phylogenetic relationships of known DQA sequences among
leporids (Figures 1-4). This is not surprising, as only one exon of one gene was
considered, and MHC sequences are typically highly variable. Similarly poor resolution of 
MHC gene phylogenies have been reported for other species (e.g. Radwan et al. 2007; 
Xu et al. 2009). Some clades were consistent across the maximum-likelihood and Bayesian
analyses (Figure 5), and with those reported by Surridge et al. 2008. Due to the low
support and variable topology, it was difficult to assess trans-species polymorphism,
which is a common hallmark of MHC evolution. However there are several well-supported
instances of similar sequences between species, and DQA variants do not generally cluster
together by species, as indicated in Figure 5.

The four Lepus europaeus analyses also displayed different topologies with low branch
support, also indicating poor resolution of the phylogeography of DQA variants in this
species (Figures 6-9). Some variants were recovered across multiple populations, whereas 
others were only identified in one population (Figure 10).

There were numerous difficulties in implementing these analyses. The greatest barrier
was the computational learning curve of running analyses through terminal and navigating
github. The second largest difficulty was understanding how to optimize the parameters for
my particular analyses (such as choosing bootstrap replicate number, and particular the
Bayesian run parameters).

If I did these analyses again, I would focus on optimizing my parameters for the Bayesian
runs. I attempted to begin this process by using ModelGenerator, but my understanding of
how AIC1, AIC2, and BIC are computed could be improved. I also would want to explore
modifications beyond what I incorporated for this project. For example, some of the MHC
gene phylogenies I've read have used heated MCMC chains, and I would like to familiarize 
myself with this methodology and how to do this in RevBayes. For these analyses in 
particular, I would like to increase my generation run time to see if this would improve
reported ESS scores. I would also like to learn how to use programs that allow for 
visualizing phylogenies in useful ways. I would like to learn how to use Ape or ggtree, 
for example.


## References

1. Gouy de Bellocq, J et al. 2009. Evolutionary history of an MHC gene in two leporid species: characterisation of MHC-DQA in the European brown hare and comparison with the European rabbit. Immunogenetics 61:131-144. http://link.springer.com/article/10.1007%2Fs00251-008-0349-4
3. Keane TM et al. 2006. assessment of methods for amino acid matrix selection and their use on empirical data shows that ad hoc assumptions for choice of matrix are not justified. BMC Evolutionary Biology 6-29.
4. Koutsogiannouli et al. 2009. Major histocompatibility complex variation at class II DQA locus in the brown hare (Lepus europaeus). Molecular Ecology 18:1431-4649. http://onlinelibrary.wiley.com/doi/10.1111/j.1365-294X.2009.04394.x/full
5. Surridge, AK et al. 2008. Diversity and evolutionary history of the MHC DQA gene in leporids. Immunogenetics 60:515-525. http://link.springer.com/article/10.1007%2Fs00251-008-0309-z

Revised May 3, 2016




