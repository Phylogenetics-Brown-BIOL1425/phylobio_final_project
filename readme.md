# Phylogenetic Biology - Final Project

## Guidelines - you can delete this section before submission

This repository is a stub for your final project. Fork it, develop your project, and submit it as a pull request. Edit/ delete the text in this readme as needed.

Some guidelines and tips:

- For information on formatting text files with markdown, see https://guides.github.com/features/mastering-markdown/ . You can use markdown to include images in this document by linking to files in the repository, eg `![GitHub Logo](/images/logo.png)`.

- The project must be entirely reproducible. In addition to the results, the repository must include all the data (or links to data) and code needed to reproduce the results.





#Sporangium anatomy and arrangement of Selaginella (Selaginellaceae) in a phylogenetic context: Distribution of spore discharge techniques

## Introduction and Goals

The release and dispersal of seeds has been widely studied (Cain et al. 2000), but the release and dispersal of spores has received much less attention. This imbalance represents a significant gap in our knowledge of plant biology, because thousands of extant plant species do not produce seeds and rely instead on the dispersal of spores (Ingold 1939). These plants, which often grow low to the ground, must move their spores above the boundary layer so that they may be carried by the wind. This problem is further complicated by environmental differences (e.g. forests with barriers to wind versus open deserts) that affect wind flow and accordingly the height a spore must attain to penetrate the boundary layer. Subsequently, this lifestyle presents a suite of problems, which many plants have adapted to by developing mechanisms for violent spore release. For example, *Selaginella martensii* can eject a single spore 65cm (~13 times its own height) using a force 23 times greater than that of a human muscle fiber (Schneller et al. 2008).

The *Selaginella* genus is an excellent study group to investigate the diversity and evolution of spore release mechanisms because they span a wide range of environments and exhibit nearly the full range of spore dispersal strategies (Ingold 1939). *Selaginella* is a member of the lycophytes, or club mosses, and is a diverse clade of ~700 extant species inhabiting ecosystems ranging from deserts to tropical rainforests to temperate forests. Species in Selaginella are heterosporous, meaning that they produce both microspores (small, male) and megaspores (large, female). Heterospory offers the opportunity to examine the mechanisms underlying dehiscence and dispersal of two quite differently sized spores within the same plant. Additionally, there is disagreement in the literature regarding the mechanisms of megaspore dispersal, which have not been adequately documented (Ingold, 1939; Filippini-De Giorgi et al. 1997). *Selaginella* employs a variety of microspore dehiscence mechanisms: some species disperse spores passively, while others actively shoot spores into the air, and still others fling entire spore-filled sporangia as if from a catapult (Koller & Scheckler 1986). 

The goal of my project is to examine the diversity of megaspore and microspore release mechanisms within *Selaginella* in a phylogenetic and ecological context, ultimately to determine whether spore release mechanisms differ between megaspores and microspores, and whether they vary by major biome and/or clade. 
To answer these questions I will construct a phylogeny of *Selaginella* based on rbcL sequences for the species available in GenBank. I view this part of my final project as an exercise to work on my computational skills rather than as essential to the project; molecular phylogenies of Selaginella have been constructed (e.g. Korall & Kenrick 2004; Zhou et al. 2015) and I could (and may, depending on the outcome of the phylogeny I construct) ultimately choose to plot the characters I am interested in onto the most recent published phylogeny. I then will plot sporangial arrangement (of megaspores and microspores within the strobilus) and anatomy (different wall thickenings are associated with different discharge mechanisms) on the tree. Data for these characters will come predominantly from the literature (Horner & Arnott 1963; Somers 1982; Koller & Scheckler 1986; Quansah 1988; Schneller et al. 2008). I will include some of my personal observations and data, should I get the materials to embed and section strobili of the *Selaginella* species that I currently have. However, it is unlikely I will have collected much of my own data by the due date of this project, and accordingly I plan to continually add to the tree I create as I continue to collect data. 

What I described above is the ultimate goal I have for the project. However, I do not currently have the data on these characters that I need to actually run these analyses. Accordingly, for the sake of this class project (which will have to be finshed well before I have the data for the questions I'm actually interested in), I am going to simulate trees and character data. .

My current game plan, which I'm about to try to do today, is this:

1) Simulate a tree with 700 tips (the approximate number of *Selaginella* species)

2) Simulate 5 characters

3) Calculate independent contrasts & get the covariance matrix: I'll ultimately present the covariance matrix for these traits with respect to the 700 tip tree 

4) Ignore phylogeny: Finally, I'll do the same analyses for these simulated characters, but without taking the simulated phylogeny into account in order to determine the strength of the effect of the phylogeny. 

5) I will repeat all of these steps for the same tree, but with tips successively dropped (to 350, 250, 100, 50, 25, and 3 tips), so that I can get an idea of how my real characters (when I have that data) will be affected by my taxon sampling and the taxon sampling of the most recent phylogeny available when it's time for my real analyses. 

6) If I have time, I'll play around with adding more characters and checking the sensitivity of the analyses to changing the variance of the characters, since there isn't enough data in the literature for me to use an estimate of the variance based on real life. 


## Methods

The tools I used were... See analysis files at (links to analysis files).

## Results

![Initial simulated tree with 700 tips to represent the 700 extant species of *Selaginella*](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/700_tips_starting_tree.png)

Initial simulated tree with 700 tips to represent the 700 extant species of *Selaginella*

![Simulated characters mapped onto tree](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/700_tips_characters_1.png)

Simulated characters mapped onto tree

![350tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/350tips.png)

![250tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/250tips.png)

![100tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/100tips.png)

![50tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/50tips.png)

![25tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/25tips.png)

![3tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/3tips.png)

![350tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tree2characters.png)

![250tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tree3characters.png)

![100tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tree4characters.png)

![50tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tree5characters.png)

![25tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tree6characters.png)

![3tips](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tree7characters.png)

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

##Acknowledgements
Mike Rosario

Casey Dunn

Abby Moore

Andrew Leslie 



## References

Cain, M.L., Milligan, B.G., & Strand, A.E. (2000). Long-distance seed dispersal in plant populations. American Journal of Botany, 87, 1217-1227

Filippini-De Giorgi, A., Holderegger, R., & Schneller, J. (1997). Aspects of spore dispersal in Selaginella. American Fern Journal, 87, 93-103

Horner, H.T. & Arnott, H.J. (1963). Sporangial arrangement in North American species of Selaginella. Botanical Gazette, 124, 371-383. 

Ingold, C.T. (1939). Spore discharge in land plants. Oxford: Oxford University Press.

Koller, A.L. & Scheckler, S.E. (1986). Variations in microsporangia and microspore dispersal in Selaginella. American Journal of Botany, 73, 1274-1288

Korall, P. & Kenrick, P. (2004). The phylogenetic history of Selaginellaceae based on DNA sequences from the plastid and nucleus: Extreme substitution rates and rate heterogeneity. Molecular Phylogenetics and Evolution, 31, 852-864. 

Quansah, N. (1988). Sporangial distribution patterns in the strobili of African and Madagascan Selaginella. Annals of Botany, 61, 243-247. 

Schneller, J., Gerber, H., & Zuppiger, A. (2008). Speed and force of spore ejection in Selaginella martensii. Botanica Helvetica, 118, 13-20

Somers, P. (1982). A unique type of microsporangium in Selaginella series articulatae. American Fern Journal, 72, 88-92. 

Zhou, X.M., Rothfels, C.J., Zhang, L., He, Z.R., Le Pechon, T., He, H., Lu, N.T., Knapp, R., Lorence, D., He, X.J., Gao, X.F., & Zhang, L.B. (2015). A large-scale phylogeny of the lycophyte genus Selaginella (Selaginellaceae: Lycopodiopsida) based on plastid and nuclear loci.  Cladistics, 1-30.


