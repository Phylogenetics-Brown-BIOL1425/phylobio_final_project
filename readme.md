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

Data regarding 4th trochanter position and body mass were collected for 68 taxa; 23 Saurischian dinosaurs, 44 Ornithischian dinosaurs, and 1 non-dinosaur Dinosauromorph (included as the outgroup). Because a quadrupedal stance necessarily requires different muscle architecture, and because many quadrupedal dinosaurs evolved to gargantuan size, we worried that quadrupedal taxa would be difficult to rigorously compare to bipedal taxa. Since this study was prompted by the anatomy of bipedal or facultatively bipedal Ornithopod dinosaurs, we elected to exclude all obligate quadrupeds from the dataset. 

After initial data collection, we compiled a phylogenetic tree of only the taxa for which we had collected data. We based our tree on published trees, which were mostly in agreement. When a taxon's placement differed between trees, we gave preference to the more recently obtained tree. 

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

5. "The Phylogeny and Evolutionary History of Tyrannosauroid dinosaurs". Stephen L. Brusatte and Thomas D. Carr. *Scientific Reports* (2016)

6. “A Complete Skeleton of a Late Triassic Saurischian and the Early Evolution of Dinosaurs”. Nesbitt et al. (2009). 

7. “The Phylogeny of Ceratosauria (Dinosauria: Theropoda)”. Carrano and Sampson (2008).

8. “A new clade of archaic large-bodied predatory dinosaurs (Theropoda: Allosauroidea) that survived to the latest Mesozoic”. Benson, Carrano, and Brusatte (2010). 

9. “Torvosaurus gurneyi n. sp., the Largest Terrestrial Predator from Europe, and a Proposed Terminology of the Maxilla Anatomy in Nonavian Theropods”. Hendrickx and Mateus (2014).

10. “A Basal Dinosaur from the Dawn of the Dinosaur Era in Southwestern Pangaea”. Martinez et al. (2011).

11. “New Dromaeosaurids (Dinosauria: Theropoda) from the Lower Cretaceous of Utah, and the Evolution of the Dromaeosaurid Tail”. Senter et al. (2012).

12. “New Basal Iguanodonts from the Cedar Mountain Formation of Utah and the Evolution of Thumb-Spiked Dinosaurs”. McDonald et al. (2010).

13. “Phylogeny of Basal Iguanodonts (Dinosauria: Ornithischia): An Update”. McDonald et al. (2012).

14. “New data on the diversity and abundance of small-bodied ornithopods (Dinosauria, Ornithischia) from the Belly River Group (Campanian) of Alberta”. Brown et al. (2013).

15. “A new species of Saurolophine Hadrosaurid dinosaur from the Late Cretaceous of the Pacific coast of North America”. Marquez and Wagner (2013).

16. "A new ornithopod (Dinosauria, Ornithischia) from the Upper Cretaceous of Antarctica an its palaeobiogeographical implications". Rozadilla et al. (2015).

17. "A New Leptoceratopsid (Ornithischia, Ceratopsia) with a Unique Ischium from the Upper Cretaceous of Shandong Province, China". He et al. (2015)

18. “Pelvic and Hindlimb Musculature of Tyrannosaurus rex (Dinosauria:Theropoda)”. Carrano and Hutchinson (2002).

19. "Dinosaurian Precursors from the Middle Triassic of Argentina: Marasuchus lilloensis, gen. nov.". Sereno and Arcucci (1994). 
