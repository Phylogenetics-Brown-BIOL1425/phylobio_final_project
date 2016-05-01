# The Evolution of the Dinosaurian 4th Trochanter

## Introduction and Goals

The 4th trochanter is a prominent bony process found on the femur of archosaurs, onto which the *M. caudofemoralis longus* and *M. caudofemoralis brevis* muscles insert. The caudofemoralis longus (CFL, for short) is the primary driver of hindlimb locomotion in modern crocodylians (Gatesy, 1990) and is thought to have played the same role in non-avian dinosaurs (Persons and Currie, 2014). The morphology of the 4th trochanter can reveal important information about the structure and dynamics of the CFL, and thus must be considered when trying to reconstruct the locomotor abilities of extinct archosaurs. The 4th trochanters of ornithischian dinosaurs are distinctive from those of other dinosaurs; specifically, their 4th trochanters tend to be larger and more distally positioned than those of related species. 

The basic principles of muscle dynamics suggest that their CFL musculature would have functioned differently due to their unique morphology; by positioning the insertion point of the CFL further from the axis of femoral rotation, they would have lengthened the muscle's in-lever arm and increased its mechanical advantage (at the expense of maximum speed). Some researchers have begun to postulate how this would have impacted their ecology (Persons and Currie, 2014); however, any anatomically-based discussion of ornithischian ecology must take into account the phylogenetic distribution of their characteristic 4th trochanters. So far, no researchers have attempted to track this feature through ornithischian phylogeny.

The most recently-proposed behavioral hypothesis regarding 4th trochanter anatomy is that proposed by Persons and Currie (2014), who suggest that the increased mechanical advantage of ornithischian CFLs was an adaptation to predatory pressure from tyrannosaurid dinosaurs. They argue that the increased mechanical advantage of ornithischian CFLs enabled them to sustain locomotion at a (low) top speed for a long time - in contrast with tyrannosaurs, which they interpret as being fast sprinters who would quickly tire in a protracted pursuit. The Persons and Currie (2014) model is predicated on two assumptions, neither of which they test: A) that the 4th trochanter position in ornithischian dinosaurs was statistically distinct from that found in tyrannosaurs (that is, that the pattern they notice in 3 taxa is representative of persistant differences in the locomotor strategy of two clades), and B) that ornithischians acquired their peculiar morphology in response to the evolution of tyrannosaurs, which are (based on multiple lines of evidence) interpreted as generally faster runners than most other theropod dinosaurs (Hutchinson and Garcia, 2001; Hutchinson et al. 2011; Persons and Currie, 2014).

Persons and Currie (2014) also fail to account for the potential influence of body mass on 4th trochanter position. Animals of greater body mass necessarily require more force per unit time to move than their smaller relatives; thus, it stands to reason that larger dinosaurs would try to increase the mechanical advantage of their muscles. The ornithischian taxon examined by Persons and Currie (2014) belonged to a very large genus (*Lambeosaurus*), which was potentially larger than both of the tyrannosaurid species examined in the same study. Thus, the conclusion of their paper is potentially a chance result due to differences in scale, not different evolutionary strategies. In summary, the conclusions reached by Persons and Currie (2014) are weakened by their failure to track the phylogenetic history of the characteristic ornithischian 4th trochanter, their lack of a rigorous statistical comparison between ornithischians and other dinosaurs, and their consideration of only very large taxa. 

In this project, we attempt to examine this problem in more detail, and validate or disprove the assumptions raised in Persons and Currie (2014). We first track the phylogenetic history of ornithischian 4th trochanters, to test the hypothesis that their distinctive morphology arose in response to the evolution of tyrannosaurids. We then test for a phylogenetic signal in the data, to see if 4th trochanter position is more associated with particular clades than would be expected by chance. Finally, we examine 4th trochanter position with respect to body mass to see if they show any association.

## Methods

### Data Collection

The data for this project were mostly collected from Gregory S. Paul's *The Princeton Field Guide to Dinosaurs* (Paul, 2010), which contains skeletal illustrations and body mass estimates for many well-known dinosaur taxa. Some skeletal measurements were taken from the website "Skeletal Drawing" (Hartman) when Paul (2010) lacked an appropriate figure. We collected data for 68 taxa: 23 saurischian dinosaurs, 44 ornithischian dinosaurs, and the non-dinosaurian dinosauromorph *Marasuchus* (included as the outgroup). Data were only collected for bipedal or facultatively bipedal animals, because of the potential biases that would be introduced if we included taxa with a fundamentally different style of locomotion (many of which were also extremely large). As a result of excluding quadrupedal forms, the saurischians in our dataset are predominantly theropods, and the ornithischians are predominantly ornithopods. Since theropods likely preyed on ornithopods extensively, this analysis may hold relevance to examining the ecological interactions of the two clades.

To compare the position of the 4th trochanter among the taxa, we took two measurements - one to determine the figured length of the whole femur, and of the distance from the head of the femur to the apex of the 4th trochanter. The latter measurement was divided by the former to yield "4th Trochanter Position", which describes percentage down femur's length at which the 4th trochanter's apex (and the insertion of the CFL tendon) occur. These measurements were taken directly with a ruler for figures found in Paul (2010); images from (Hartman) were imported into Adobe Photoshop and measured using its inbuilt ruler tool.

After initial data collection, a phylogenetic tree was assembled in Newick format, comprising of all taxa for which we had collected data. The phylogeny was based on published trees; we referenced many papers in order to cross-check our composite tree and ensure accuracy. There was minimal disagreement between the published trees. We used two general rules while assembling the composite tree: 1) when a taxon's placement differed between papers, preference was given to the more recently published tree and 2) when the phylogenetic resolution between different taxa was greater on one tree than on another, preference was given to the finer-resolved tree regardless of which tree was more recently obtained. The resulting composite phylogenetic tree does not contain any polytomies, and given the method of construction of the tree, represents the most up-to-date knowledge of the relationships between these taxa.

The composite tree was imported into R using the **read.tree()** function from the package **ape**. After this, we constructed two sub-trees; one representing Ornithischia and the other Saurischia. This allowed us to analyze the two clades of interest in detail and see if any results were the result of intra- or inter-clade differences.


### Construction of a Time-Calibrated Phylogenetic Tree

At this stage, the composite tree was not scaled to time, and showed only the interrelationships of the constituent taxa. However, the statistical techniques we hoped to use required that the branches of the phylogeny must be scaled to time. Obtaining such a phylogeny is typically difficult for fossil taxa for several reasons: 1) the first and last appearance dates of fossil taxa do not necessarily represent the actual first and last appearance dates for the taxa; 2) the date of divergence of two different taxa is not known with precision, and methods of constraint for estimating internal branch lengths based on the ranges of the terminal taxa have several difficulties based on the method used and the location and number of internal nodes for which dates are well known; 3) molecular phylogenetic analyses cannot be conducted due to the lack of soft tissue preservation and the short life of organic molecules and DNA in fossil taxa, especially those from the Mesozoic; 4) different fossil taxa have been discovered in different abundances, leading to issues of accounting for sampling rate.

Such difficulties have now been addressed by several authors via advanced statistical analyses of the fossil record and of the most optimal constraint methods for internal branch length calculation. David W. Bapst of the South Dakota School of Mines and Technology developed an R package, **paleotree**, that contains functions designed to statistically analyze information on fossil taxa ranges and phylogenetic relationships and assign lengths to branches.

We wrote a function, **tree_scaler()**, to assign branch lengths to the three composite phylogenies. It uses the inbuilt **paleotree** function **cal3timePaleoPhy** to calculate branch lengths for each tree, using geologic occurrence data for the taxa in the data set and randomized values for the birth, extinction and sampling rates. These values were drawn from uniform distributions with bounds taken from Starrfelt and Liow (2016). The birth and extinction rates were chosen from within a range of 0.001 to 0.15, and the sampling rate from a range of 0.104 to 0.243 for our Saurischia tree, from a range of 0.172 to 0.355 for our Ornithischia tree, and from a range of 0.146 to 0.262 for all of our taxa for our Dinosauria tree. **tree_scaler()** would repeat this calculation for a set number of repetitions, storing the branch lengths from each run in a matrix; we generated 100 time-calibrated trees for each of the three composite phylogenies. After this, we averaged each row in the three data matrices to generate a vector of average edge lengths for each composite tree, which was then assigned to its respective tree's edge length vector. This resulted in three calibrated composite trees, which we could then use as the basis for subsequent analyses.

### Ancestral State Reconstruction

### Testing for Phylogenetic Signal

We used the **phylosignal()** function in the R package **picante** to assess whether closely related species in our sample had 4th trochanter positions more or less similar than would be expected under a Brownian motion model of character evolution. First we tested for a phylogenetic signal in 4th trochanter position and body mass across the entire phylogeny. We repeated these analyses within Saurischia and Ornithischia. Output from **phylosignal** includes p-values, which enabled us to assess whether or not our results were statistically significant.

### Independant Contrasts

We used phylogenetic independant contrast to assess whether 4th trochanter position is correlated with body mass, utilizing the function **pic()** in the package **ape**. We first calculated independant contrasts for 4th trochanter position and body mass for all taxa; these contrasts were then subjected to linear regression. This procedure was repeated for Saurischia and Ornithischia seperately.

## Results

Figure 1 shows the composite Dinosauria tree before time calibration. It shows a deep divergence between Ornithischia and Saurischia, reflecting paleontological evidence that the two clades diverged shortly after the evolution of Dinosauria in the mid-Triassic period.

SHOW FIGURE 1 HERE

Figure 2 shows the time-calibrated composite Dinosauria tree. The deep divergence between Saurischia and Ornithischia is preserved, and reconstructed as occurring just prior to the evolution of the earliest known dinosaurs (the Saurischians *Eoraptor*, *Staurikosaurus*, and *Herrarasaurus*). Notably, the Ornithischian half of the tree shows two sections of very short branch lengths, which make the tree seem to have two large polytomies. The first occurs between *Hypsilophodon* and *Dryosaurus*, and the second between *Bactrosaurus* and *Shantungosaurus*. These regions seem to indicate bursts of diversification among Ornithischia, but are more likely to be artifacts of incomplete taxon sampling or of the methods used to time-calibrate the phylogeny. They represent interesting areas of potential future research.

SHOW FIGURE 2 HERE

Figures 3 and 4 show the non-time-calibrated and time-calibrated composite Saurischia phylogenies, permitting a more detailed analysis of the relationships between the taxa. Branch lengths appear similar to those in the composite Dinosauria phylogeny, indicating that the methods used to scale the branches to time are insensitive to the size of the tree. Figures 5 and 6 show non-time-calibrated and time-calibrated composite Ornithischia phylogenies. The two "comb”-like regions from the calibrated Dinosauria tree are visible on the latter, again validating our earlier phylogeny.

SHOW FIGURES 3-6 HERE





### Phylogenetic Signal Testing

Phylogenetic signal testing of our trees with regards to both trochanter position and body mass was conducted to determine the effect phylogeny had on the patterns observed. The function utilized was phylosignal(), provided by the package “picante”. 

### Ancestral State Reconstruction

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References

1. W. Scott Persons IV and Philip J. Currie. “Duckbills on the Run: The Cursorial Abilities of Hadrosaurs and Implications for Tyrannosaur-Avoidance Strategies”. *Hadrosaurs* (2014): 449-458.

2. Richard J. Butler, Paul Upchurch, and David B. Norman. “The Phylogeny of the Ornithischian Dinosaurs”. *Journal of Systematic Paleontology* 6 (2008): 1-40. 

3. Maidment et al. “Locomotion in Ornithischian Dinosaurs: an assessment using three-dimensional computational modelling”. *Biological Reviews* 89 (2014): 588-617.

4. Stephen M. Gatesy. “Caudofemoral Musculature and the Evolution of Theropod Locomotion”. *Paleobiology* 16 (1990): 170-186.

5. Stephen L. Brusatte and Thomas D. Carr. "The Phylogeny and Evolutionary History of Tyrannosauroid dinosaurs". *Scientific Reports* 6 (2016).

6. Nesbitt et al. “A Complete Skeleton of a Late Triassic Saurischian and the Early Evolution of Dinosaurs”. *Science* (2009): 1530-1533.

7. Matthew T. Carrano and Scott D. Sampson. “The Phylogeny of Ceratosauria (Dinosauria: Theropoda)”. *Journal of Systematic Paleontology* 6 (2008): 183-236.

8. Roger B. J. Benson, Matthew T. Carrano, and Stephen L. Brusatte. “A new clade of archaic large-bodied predatory dinosaurs (Theropoda: Allosauroidea) that survived to the latest Mesozoic”. *Naturwissenshaften* 97 (2010): 71-78. 

9. Christophe Hendrickx and Octavio Mateus. “Torvosaurus gurneyi n. sp., the Largest Terrestrial Predator from Europe, and a Proposed Terminology of the Maxilla Anatomy in Nonavian Theropods”. *PLoS ONE* 9:3 (2014).

10. Martinez et al. “A Basal Dinosaur from the Dawn of the Dinosaur Era in Southwestern Pangaea”. *Science* 331 (2011):206-210.

11. Senter et al. “New Dromaeosaurids (Dinosauria: Theropoda) from the Lower Cretaceous of Utah, and the Evolution of the Dromaeosaurid Tail”. *PLoS ONE* 7:5 (2012).

12. McDonald et al. “New Basal Iguanodonts from the Cedar Mountain Formation of Utah and the Evolution of Thumb-Spiked Dinosaurs”. *PLoS ONE* 5:11 (2010).

13. Andrew T. McDonald. “Phylogeny of Basal Iguanodonts (Dinosauria: Ornithischia): An Update”. *PLoS ONE* 7:5 (2012).

14. Brown et al. “New data on the diversity and abundance of small-bodied ornithopods (Dinosauria, Ornithischia) from the Belly River Group (Campanian) of Alberta”. *Journal of Vertebrate Paleontology* 33 (2013): 495-520.

15. Albert Prieto-Marquez and Jonathan R. Wagner. “A new species of Saurolophine Hadrosaurid dinosaur from the Late Cretaceous of the Pacific coast of North America”. *Acta Palaeontologica Polonica* 58 (2013): 255-268.

16. Rozadilla et al. "A new ornithopod (Dinosauria, Ornithischia) from the Upper Cretaceous of Antarctica an its palaeobiogeographical implications". *Cretaceous Research* 57 (2015): 311-324.

17. He et al. "A New Leptoceratopsid (Ornithischia, Ceratopsia) with a Unique Ischium from the Upper Cretaceous of Shandong Province, China". *PLoS ONE* 10:12 (2015).

18. Matthew T. Carrano and John R. Hutchinson. “Pelvic and Hindlimb Musculature of Tyrannosaurus rex (Dinosauria:Theropoda)”. *Journal of Morphology* 253 (2002): 207-228.

19. Paul C. Sereno and Andrea B. Arcucci. "Dinosaurian Precursors from the Middle Triassic of Argentina: Marasuchus lilloensis, gen. nov.". *Journal of Vertebrate Paleontology* 14 (1994): 53-73. 

20. Xing et al. “Comparative Osteology and Phylogenetic Relationship of *Edmontosaurus* and *Shantungosaurus* (Dinosauria: Hadrosauridae) from the Upper Cretaceous of North America and East Asia”. *Acta Geologica Sinica* 88 (2014): 1623-1652.

21. Kenneth Carpenter and Yvonne Wilson. “A New Species of Camptosaurs (Ornithopoda: Dinosauria) from the Morrison Formation (Upper Jurassic) of Dinosaur National Monument, Utah, and  Biomechanics Analysis of its Forelimb”. *Annals of Carnegie Museum* 76 (2008): 227-263.

22. Jostein Starrfelt and Lee Hsiang Liow. “How many dinosaur species were there? Fossil bias and true richness estimated using a Poisson sampling model”. *Philosophical Transactions of the Royal Society B* 371:1691 (2016).

23. John R. Hutchinson and Mariano Garcia. "*Tyrannosaurus* was not a fast runner". *Nature* 415: 1018-1021 (2001). 

24. Hutchinson et al. "A Computational Analysis of Limb and Body Dimensions in *Tyrannosaurus rex* with Implications for Locomotion, Ontogeny, and Growth". *PLOS ONE* (2011).
