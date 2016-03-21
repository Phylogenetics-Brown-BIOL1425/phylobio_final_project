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

Hyperiid amphipods (Amphipoda:Peracarida:Eumalacostraca:Crustacea:Arthropoda) are a clade of marine crustaceans which evolved from an ancestral benthic existance, presumably attached to benthic flora and fauna, to a pelagic life style in the ocean midwaters. Several adaptations allowed them to survive in this hostile habitat, including remarkable eye architechture to see in the dim lit deep waters, and body transparency to hide from the myriad of lurking predators. The pelagic realm extends for vast distances in 3 dimensions of liquid medium without physical interfaces such as the seafloor or the surface. An interesting ecological adaptation of hyperiid amphipods is their association with large gelatinous planktonic animals. These hosts serve many functions to hyperiid amphipods. They serve as a substrate for them to latch on, as means of transport, as protection from predators, and as food for themselves or their progeny. Indeed, the gelatinous hosts act a floating habitat and food source. A relatable analogy can be found in Roald Dahl's novel 'James and the Giant Peach'.

The specificity of the interactions varies across families of hyperiid amphipods. Some are specialist parasitoids like <i>Phronima sedentaria</i> on salps. Other are more like generalist hitchhickers like <i>Hyperia medusarum</i>. The gelatinous zooplankton hosts of hyperiid amphipods present an outstanding phylogenetic diversity, including colonial radiolarians, ctenophores, hydromedusae, scyphomedusae, siphonophore colonies, salps, and doliolids. Hosts and amphipods are delicate cretaures, and their association can be easily broken by stress or disturbance, such as a plankton net tow. Consequentially, in studies using traditional plankton collection methods, these relationships are overlooked. However, these interactions have been successfully described in detail by scientists in the last century, after the advent of SCUBA diving techniques, which allow the careful collection of intact specimens using jars (Haddock, 2004).
The follwoing articles comprise a broad compendium of these studies:

[Madin LP, Harbison GR. The associations of Amphipoda Hyperiidea with gelatinous zooplankton—I. Associations with Salpidae. Deep Sea Research. 1977 May 1;24(5):449IN1457-56IN4463.](http://www.sciencedirect.com/science/article/pii/0146629177904830)

[Harbison GR, Biggs DC, Madin LP. The associations of Amphipoda Hyperiidea with gelatinous zooplankton—II. Associations with Cnidaria, Ctenophora and Radiolaria. Deep Sea Research. 1977 May 31;24(5):465-88.](http://www.sciencedirect.com/science/article/pii/0146629177904842)

[Laval PH. Hyperiid amphipods as crustacean parasitoids associated with gelatinous zooplankton. Oceanogr. Mar. Biol. Ann. Rev. 1980;18:11-56.](http://phlaval1.free.fr/ref/Laval-Oceanogr.Mar.Ann.Rev-1980-no18.pdf)

[de Lima MC, Valentin JL. New records of Amphipoda Hyperiidea in associations with gelatinous zooplankton. Hydrobiologia. 2001 Apr 1;448(1-3):229-35.](http://link.springer.com/article/10.1023/A:1017593120143)

[Gasca R, Haddock SH. Associations between gelatinous zooplankton and hyperiid amphipods (Crustacea: Peracarida) in the Gulf of California. InCoelenterate Biology 2003 2004 (pp. 529-535). Springer Netherlands.](https://www.researchgate.net/profile/Rebeca_Gasca/publication/226387403_Associations_between_gelatinous_zooplankton_and_hyperiid_amphipods_Crustacea_Peracarida_in_the_Gulf_of_California/links/53e255270cf216e8321a92e1.pdf)

[Gasca, R., E. Suárez-Morales, and S. H. D. Haddock. Symbiotic Associations between Crustaceans and Gelatinous Zooplankton in Deep and Surface Waters off California. Marine Biology 151 (2006): 233–42](http://download.springer.com/static/pdf/729/art%253A10.1007%252Fs00227-006-0478-y.pdf?originUrl=http%3A%2F%2Flink.springer.com%2Farticle%2F10.1007%2Fs00227-006-0478-y&token2=exp=1454559034~acl=%2Fstatic%2Fpdf%2F729%2Fart%25253A10.1007%25252Fs00227-006-0478-y.pdf%3ForiginUrl%3Dhttp%253A%252F%252Flink.springer.com%252Farticle%252F10.1007%252Fs00227-006-0478-y*~hmac=dcf28826950c657e8db7fbadb4600ea7eb55751be7d830a11ae81cf8543ec993)

[Gasca R, Hoover R, Haddock SH. New symbiotic associations of hyperiid amphipods (Peracarida) with gelatinous zooplankton in deep waters off California. Journal of the Marine Biological Association of the United Kingdom. 2015 May 1;95(03):503-11.](http://journals.cambridge.org/abstract_S0025315414001416)

The goal of this project is to compare the evolutionary histories of hyperiid amphipods and their hosts in the ocean. To do so, I will build an association matrix from the literaure above on interspecific interactions. In order to study the interactions from a phylogenetic perspective I will need a phylogeny for the hyperrid amphipods, and a phylogeny for gelatinous hosts. For the amphipods I will use the lastest molecular phylogeny from [Hurt et al. 2013](http://www.sciencedirect.com/science/article/pii/S1055790313000031). For the host species, I will download the 18S gene sequences from GeneBank for the diversity of host species and build a gene tree to serve as a proxy for the species phylogeny.

From these data sources, I plan to:

1) Test for phylogenetic signal in the association matrix.

2) Carry out a cophylogenetic analysis to measure congruence between the trees and identify host switching patterns or incomplete sorting events during the coevolution of parasitoids and hosts.

## Methods

The tools I used were... See analysis files at (links to analysis files).

I will use RAxML and RevBayes to build 18S gene trees, identifying later a consensus tree between them. I will use non parametric bootstrap values and bayesian posteriors as measures of clade support under each heuristic search method. 
I will use the R packages ape, phytools, and phangorn.

## Results

The tree in Figure 1...

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References

[Hurt C, Haddock SH, Browne WE. Molecular phylogenetic evidence for the reorganization of the Hyperiid amphipods, a diverse group of pelagic crustaceans. Molecular phylogenetics and evolution. 2013 Apr 30;67(1):28-37.](http://www.sciencedirect.com/science/article/pii/S1055790313000031)


