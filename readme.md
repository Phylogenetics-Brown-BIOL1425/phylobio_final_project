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

# Tracking 4th Trochanter Position in Ornithischian Dinosaurs 

## Introduction and Goals

The 4th trochanter is a prominent bony process found on the femur of archosaurs, onto which the *M. caudofemoralis longus* and *M. caudofemoralis brevis* muscles insert. The caudofemoralis longus (CFL, for short) is thought to be the most important of the hindlimb retractors, and the main muscle involved in archosaur hindlimb locomotion. The morphology of the 4th trochanter reveals important information about the structure and dynamics of the CFL, and is therefore vital when trying to reconstruct the locomotor abilities of extinct archosaurs. Ornithischian dinosaurs display distinctive 4th trochanters; specifically, the trochanters tend to be larger and more distally positioned than those of other dinosaurs and archosaurs. The basic principles of muscle dynamics suggest that their CFL musculature would have functioned differently due to their unique morphology, and some researchers have begun to postulate how these differences in function would have affected their ecology. However, any anatomically-based discussion of Ornithischian ecology must take into account the phylogenetic distribution of their characteristic 4th trochanters. So far, no researchers have attempted to track this feature through Ornithischian phylogeny; we hope to do so in this project. 

We plan to demonstrate that the distinctive 4th trochanter morphology in Ornithischian dinosaurs represents a difference in their locomotor strategy relative to other dinosaur clades; the position of their 4th trochanter should be little affected by body size. We will first construct a composite phylogeny of the 68 dinosaur taxa for which we have body mass and 4th trochanter position data. This tree will be derived from published analyses of dinosaur phylogeny. We plan to utilize phylogenetic regression to prove that body size is poorly correlated with 4th trochanter position in dinosaurs, and that phlyogenetic affinity is a far better predictor of its location.

Finally, we will try to investigate two important questions: A) where does the characteristic 4th trochanter morphology first appear in Dinosauria? and B) does the morphology of the 4th trochanter show any sensitivity to body mass, as would be expected in a group of animals with masses ranging 4 orders of magnitude?


## Methods

### Data Collection

Data regarding 4th trochanter position and body mass were collected for 68 taxa: 23 Saurischian dinosaurs, 44 Ornithischian dinosaurs, and one non-dinosaurian Dinosauromorph Marasuchus (included as the outgroup). Because a quadrupedal stance necessarily requires a different muscle architecture, and because many quadrupedal dinosaurs evolved to gargantuan size, phylogenetic patterns in the position of the 4th trochanter quadrupedal taxa and the resultant paleobiological implications would be difficult to rigorously compare to those obtained with bipedal taxa. As this study was prompted by the anatomy of bipedal or facultatively bipedal Ornithopod dinosaurs, all obligate quadrupeds were elected to be excluded from the dataset. 

Data on the 4th trochanter position and body mass were amassed from two sources: Gregory S. Paul’s “The Princeton Field Guide to Dinosaurs”, and Scott Hartman’s website “Scott Hartman’s Skeletal Drawing.com”. Paul’s book was used as the primary resource for body mass. 4th trochanter position was also measured for several of the taxa included here via manual measurement by a ruler; the values were then scaled up as dictated by the scale bar provided for the taxa. Hartman’s website was used solely as a source for the 4th trochanter positions; skeletal diagrams from the website of those taxa not found in Paul’s book were uploaded onto Adobe Illustrator(C), and the ruler tool was used to determine 4th trochanter position. 

After initial data collection, a phylogenetic tree was constructed of only those taxa whose data had been collected. The phylogenetic tree was based on trees published in the literature, with several different papers used to determine the relationships for different clades of the tree. There was minimal disagreement between the trees from the literature. During construction of the relationships, two general rules were used: 1) When a taxon's placement differed between trees, preference was given to the more recently obtained tree; 2) When the phylogenetic resolution between different taxa was greater on one tree than on another, preference was given to the former tree regardless of which tree was more recently obtained. The resulting phylogenetic tree does not contain any polytomies, and given the method of construction of the tree, represents the most up-to-date knowledge of the relationship between these taxa.

### Construction of a Time-Calibrated Phylogenetic Tree

The phylogenetic tree at this stage is not time-calibrated, and shows purely the relationships among the constituent taxa. In order to carry out the analysis of this paper, the branches of the phylogeny must be scaled to time——a time-calibrated phylogenetic tree is needed. Obtaining such a phylogeny is typically difficult for fossil taxa for several reasons: 1) the first and last appearance dates of fossil taxa do not necessarily represent the actual first and last appearance dates for the taxa; 2) the date of divergence of two different taxa is not known with precision, and methods of constraint for estimating internal branch lengths based on the ranges of the terminal taxa have several difficulties based on the method used and the location and number of internal nodes for which dates are well known; 3) molecular phylogenetic analyses cannot be conducted due to the lack of soft tissue preservation and the short life of organic molecules and DNA in fossil taxa, especially those from the Mesozoic; 4) different fossil taxa have been discovered in different abundances, leading to issues of accounting for sampling rate.

Such difficulties have now been addressed by several authors via advanced statistical analyses of the fossil record and of the most optimal constraint methods for internal branch length calculation. The statistical software package R contains a package, paleotree(C), developed by professor David W. Bapst of the South Dakota School of Mines and Technology, that is designed to statistically analyze information on fossil taxa ranges and phylogenetic relationships and provide a time-calibrated phylogeny. The software R was used in this study partly because of the capabilities of this package, and partly because of its ease of use and the nature of the analysis being conducted.

The R code used in order to construct the time-calibrated phylogeny is provided as part of the files uploaded onto this github repository. The R code additionally contains the code used for the analysis conducted in this study. An explanation of the code for both the time-calibrated phylogeny construction and the analysis is provided as comments within the code itself. Packages used in conducting the analyses were “ape”, “picante”, “phytools”, and “paleotree”.

## Results

The tree in Figure 1...

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References

1. “Duckbills on the Run: The Cursorial Abilities of Hadrosaurs and Implications for Tyrannosaur-Avoidance Strategies”. W. Scott Persons IV and Philip J. Currie. *Hadrosaurs* (2014): 449-458.

2. “The Phylogeny of the Ornithischian Dinosaurs”. Richard J. Butler, Paul Upchurch, and David B. Norman. *Journal of Systematic Paleontology* 6 (2008): 1-40. 

3. “Locomotion in Ornithischian Dinosaurs: an assessment using three-dimensional computational modelling”. S. C. R. Maidment et al. *Biological Reviews* 89 (2014): 588-617.

4. “Caudofemoral Musculature and the Evolution of Theropod Locomotion”. Stephen M. Gatesy. *Paleobiology* 16 (1990): 170-186.

5. "The Phylogeny and Evolutionary History of Tyrannosauroid dinosaurs". Stephen L. Brusatte and Thomas D. Carr. *Scientific Reports* 6 (2016).

6. “A Complete Skeleton of a Late Triassic Saurischian and the Early Evolution of Dinosaurs”. Nesbitt et al. *Science* (2009): 1530-1533.

7. “The Phylogeny of Ceratosauria (Dinosauria: Theropoda)”. Matthew T. Carrano and Scott D. Sampson. *Journal of Systematic Paleontology* 6 (2008): 183-236.

8. “A new clade of archaic large-bodied predatory dinosaurs (Theropoda: Allosauroidea) that survived to the latest Mesozoic”. Roger B. J. Benson, Matthew T. Carrano, and Stephen L. Brusatte. *Naturwissenshaften* 97 (2010): 71-78. 

9. “Torvosaurus gurneyi n. sp., the Largest Terrestrial Predator from Europe, and a Proposed Terminology of the Maxilla Anatomy in Nonavian Theropods”. Christophe Hendrickx and Octavio Mateus. *PLoS ONE* 9:3 (2014).

10. “A Basal Dinosaur from the Dawn of the Dinosaur Era in Southwestern Pangaea”. Martinez et al. *Science* 331 (2011):206-210.

11. “New Dromaeosaurids (Dinosauria: Theropoda) from the Lower Cretaceous of Utah, and the Evolution of the Dromaeosaurid Tail”. Senter et al. *PLoS ONE* 7:5 (2012).

12. “New Basal Iguanodonts from the Cedar Mountain Formation of Utah and the Evolution of Thumb-Spiked Dinosaurs”. McDonald et al. *PLoS ONE* 5:11 (2010).

13. “Phylogeny of Basal Iguanodonts (Dinosauria: Ornithischia): An Update”. Andrew T. McDonald. *PLoS ONE* 7:5 (2012).

14. “New data on the diversity and abundance of small-bodied ornithopods (Dinosauria, Ornithischia) from the Belly River Group (Campanian) of Alberta”. Brown et al. *Journal of Vertebrate Paleontology* 33 (2013): 495-520.

15. “A new species of Saurolophine Hadrosaurid dinosaur from the Late Cretaceous of the Pacific coast of North America”. Albert Prieto-Marquez and Jonathan R. Wagner. *Acta Palaeontologica Polonica* 58 (2013): 255-268.

16. "A new ornithopod (Dinosauria, Ornithischia) from the Upper Cretaceous of Antarctica an its palaeobiogeographical implications". Rozadilla et al. *Cretaceous Research* 57 (2015): 311-324.

17. "A New Leptoceratopsid (Ornithischia, Ceratopsia) with a Unique Ischium from the Upper Cretaceous of Shandong Province, China". He et al. *PLoS ONE* 10:12 (2015).

18. “Pelvic and Hindlimb Musculature of Tyrannosaurus rex (Dinosauria:Theropoda)”. Matthew T. Carrano and John R. Hutchinson. *Journal of Morphology* 253 (2002): 207-228.

19. "Dinosaurian Precursors from the Middle Triassic of Argentina: Marasuchus lilloensis, gen. nov.". Paul C. Sereno and Andrea B. Arcucci. *Journal of Vertebrate Paleontology* 14 (1994): 53-73. 

20. “Comparative Osteology and Phylogenetic Relationship of *Edmontosaurus* and *Shantungosaurus* (Dinosauria: Hadrosauridae) from the Upper Cretaceous of North America and East Asia”. Xing et al. *Acta Geologica Sinica* 88 (2014): 1623-1652.

21. “A New Species of Camptosaurs (Ornithopoda: Dinosauria) from the Morrison Formation (Upper Jurassic) of Dinosaur National Monument, Utah, and  Biomechanics Analysis of its Forelimb”. Kenneth Carpenter and Yvonne Wilson. *Annals of Carnegie Museum* 76 (2008): 227-263.

22. “How many dinosaur species were there? Fossil bias and true richness estimated using a Poisson sampling model”. Jostein Starrfelt and Lee Hsiang Liow. *Philosophical Transactions of the Royal Society B* 371:1691 (2016).
