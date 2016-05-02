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

What I described above is the ultimate goal I have for the project. However, I do not currently have the data on these characters that I need to actually run these analyses. Accordingly, for the sake of this class project (which will have to be finshed well before I have the data for the questions I'm actually interested in), I am going to simulate trees and character data.

My current game plan, which I'm about to try to do today, is this:

1) Simulate a tree with 700 tips (the approximate number of *Selaginella* species)

2) Simulate 5 continuous characters

3) Calculate independent contrasts & get the covariance matrix: I'll ultimately present the covariance matrix for these traits with respect to the 700 tip tree 

4) Ignore phylogeny: Finally, I'll do the same analyses for these simulated characters, but without taking the simulated phylogeny into account in order to determine the strength of the effect of the phylogeny. 

5) I will repeat all of these steps for the same tree, but with tips successively dropped (to 350, 250, 100, 50, 25, and 3 tips), so that I can get an idea of how my real characters (when I have that data) will be affected by my taxon sampling and the taxon sampling of the most recent phylogeny available when it's time for my real analyses. 

6) If I have time, I'll play around with adding more characters and checking the sensitivity of the analyses to changing the variance of the characters, since there isn't enough data in the literature for me to use an estimate of the variance based on real life. 


## Methods

In order to learn more about the evolution and behavior of character data on trees with various taxon sampling, I simulated a tree with 700 tips, and then successively dropped tips from each tree such that I created trees with 350, 250, 100, 50, 25, and 3 tips from the original 700 tip topology. These steps, and all of the analyses described here, were done in RStudio using the package ape. See https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/simulations for the exact code that I used in all of these analyses.
 
Next, I created a variance-covariance matrix for five variables. Four of the variables had a variance of 1, and the fifth had a variance of 0.3 to deviate at least slightly from the exercise we did in class. This variable was set to have a covariance of 0 with the others, three of which covaried weakly (0.2), and two of which covaried strongly (0.9).
 
I then simulated the evolution of these characters on each of my trees using the geiger package and the sim.char() function, (see https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/simulations for specifics). I then was able to calculate the independent contrasts for these characters and obtain covariance matrices for the evolution of these characters based on each simulated phylogeny. I also generated covariance matrices for the values at the tips of each simulated phylogeny/character data set, in order to compare how different the results might be if independent contrasts had not been used to take into account the relatedness of each tip to one another.

## Results (Tables and Figures)

![Figure 0](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/figure0.png)

![Figure 1](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/700taxa_characters.png)

![Figure 2](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/Figure2.png)

![Table 1](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tables/table1.png)

![Figure 3](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/350taxa_characters.png)

![Figure 4](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/Figure4.png)

![Table 2](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tables/table2.png)

![Figure 5](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/250taxa_characters.png)

![Figure 6](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/Figure6.png)

![Table 3](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tables/table3.png)

![Figure 7](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/100taxa_characters.png)

![Figure 8](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/Figure8.png)

![Table 4](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tables/table4.png)

![Figure 9](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/50taxa_characters.png)

![Figure 10](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/Figure10.png)

![Table 5](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tables/table5.png)

![Figure 11](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/25taxa_characters.png)

![Figure 12](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/Figure12.png)

![Table 6](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tables/table6.png)

![Figure 13](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/figure13.png)

![Figure 14](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/figures/Figure14.png)

![Table 7](https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/tables/table7.png)

## Results & Discussion

When tips were randomly dropped from each tree, each of the three major clades from the starting tree happened to be maintained throughout (Fig.0 A-G). I found this interesting for the sake of these analyses because the tree maintained its general shape even as tips were dropped. However, if I were to do this project again, I might experiment with intentionally dropping an entire large clade, because though each tree with fewer tips does theoretically represent poorer and poorer taxon sampling, I do not think that poor taxon sampling in reality would necessarily be structured randomly across the entire tree. For example, based on published phylogenies of Selaginella, it is obvious (and not unexpected) that many of the major clades also share similar biogeographical patterns. In collecting these plants for my work, it seems likely that I would over represent the North American clade, and underrepresent clades from Asia, since it will likely be more difficult to get access to those plants. If I were to do this project again, instead of randomly dropping tips from the trees, I would make them representative of the sort of biased sampling I just described.

Looking at the simulated evolution of the character data on the 700-taxon tree revealed some interesting patterns (Fig. 1). Variables 1 and 4 appeared to covary strongly across the entire tree, which was expected given that I set their covariance at 0.9. The other variables seemed mostly unrelated to one another across the entire tree, though some (e.g. 2 and 3 at the top of tree) appeared to be behaving similarly in some sections of the tree. In order to better understand the relationships among variables given the phylogeny, it was necessary to examine the independent contrasts (Fig. 2A; Table 1). The first variable appeared strongly related to variable 4, just as it visually did on the tree. It was weakly related to the other variables, which makes sense given that its covariance with 2 and 5 was set at only 0.2. Variable 3 had the weakest relationships with all of the other variables, which again was expected given that its covariance with everything else was set to 0. This result was interesting to me, though, because examining only the visual representation of the characters on the tree did not obviously lead the viewer to that conclusion. Finally, and perhaps most interestingly, comparing the covariance matrices of the independent contrasts, which take the phylogeny into account, and of the values at the tips, which do not, was telling.  Variable 3 still did not have strong relationships with any of the other variables, and variables 1 and 4 were still the most strongly associated. I found it interesting that the same broad patterns were still observed. However, the actual values in the tables are clearly quite different. For example, variables 1 and 4 have a covariance of ~ 0.95 when using independent contrasts, but only ~0.56 when the phylogeny is ignored. These differences also mean that the magnitude of the differences among the variables is obscured when looking only at the values at the tips. The heat maps of both of the covariance matrices best exemplify this idea. The heat map of the covariance matrix for the independent contrasts (Fig. 2A) is composed mainly of the colors (red and blue) representing opposite poles of the color spectrum used to color-code the tables. The heat map for the covariance matrix of the values at the tips, however, has many more squares colored purple, the intermediate color in this scheme.

Moving to the next tree of 350 taxa, which dropped half of the tips from the starting tree, we again see that, as expected, variables 1 and 4 seem to have very similar behavior across the tree. Unlike the previous tree, it seems like variables 2 and 5 might be behaving similarly in certain sections of the tree. It is important to note here that the character state values are different from tree to tree, because I dropped the tips before simulating the evolution of the characters rather than after. In hindsight, I would not do that again. I should have made the initial tree and simulated the character evolution on it, then successively dropped tips so that the values in each covariance matrix would have been more directly comparable. As it stands now, though, I can still examine whether the same patterns arise on each tree, and how strong they appear to be.

*****describe some general patterns across all instead of walking through every single one*****
 
Overall, if I were to do this project again I would want to find a better way to represent the character evolution on the tree. I spent some time trying to heat-map that as well, because I thought that different colors might be a bit easier to interpret for trees with many tips (instead of the different sized/colored circles) but I could not get the code to work, though I think that would have improved the presentation. I also would have liked to have done models of the evolution of categorical variables in addition to continuous variables, since I will eventually be dealing with data of both types.

##Acknowledgements
Andrew Leslie, for help with heat-mapping. 

Mike Rosario, for patiently helping me with R.

Casey Dunn, for suggesting this simulated version of the project when I didn't have my own data to use.

Abby Moore, for helping me (last semester) build the trees in the *Selaginella* rbcL analysis folder of this repository. They're not technically part of this project, but I thought it would be useful to have all of my *Selaginella* phylogenetics projects in one place so that it's easier to come back to later on. 

Morgan Moeglein, Kim Neil, & Bianca Brown for emotional support. 





## References

Cain, M.L., Milligan, B.G., & Strand, A.E. (2000). Long-distance seed dispersal in plant populations. *American Journal of Botany*, 87, 1217-1227

Filippini-De Giorgi, A., Holderegger, R., & Schneller, J. (1997). Aspects of spore dispersal in *Selaginella*. American Fern Journal, 87, 93-103

Horner, H.T. & Arnott, H.J. (1963). Sporangial arrangement in North American species of *Selaginella*. Botanical Gazette, 124, 371-383. 

Ingold, C.T. (1939). Spore discharge in land plants. Oxford: Oxford University Press.

Koller, A.L. & Scheckler, S.E. (1986). Variations in microsporangia and microspore dispersal in *Selaginella*. *American Journal of Botany*, 73, 1274-1288

Korall, P. & Kenrick, P. (2004). The phylogenetic history of Selaginellaceae based on DNA sequences from the plastid and nucleus: Extreme substitution rates and rate heterogeneity. *Molecular Phylogenetics and Evolution*, 31, 852-864. 

Quansah, N. (1988). Sporangial distribution patterns in the strobili of African and Madagascan *Selaginella*. *Annals of Botany*, 61, 243-247. 

Schneller, J., Gerber, H., & Zuppiger, A. (2008). Speed and force of spore ejection in *Selaginella martensii*. *Botanica Helvetica*, 118, 13-20

Somers, P. (1982). A unique type of microsporangium in *Selaginella* series articulatae. *American Fern Journal*, 72, 88-92. 

Zhou, X.M., Rothfels, C.J., Zhang, L., He, Z.R., Le Pechon, T., He, H., Lu, N.T., Knapp, R., Lorence, D., He, X.J., Gao, X.F., & Zhang, L.B. (2015). A large-scale phylogeny of the lycophyte genus *Selaginella* (Selaginellaceae: Lycopodiopsida) based on plastid and nuclear loci.  *Cladistics*, 1-30.


