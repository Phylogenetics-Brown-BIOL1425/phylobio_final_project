# Phylogenetic Biology - Final Project

#Sporangium anatomy and arrangement of Selaginella (Selaginellaceae) in a phylogenetic context: Distribution of spore discharge techniques

## Introduction and Goals

The release and dispersal of seeds has been widely studied (Cain et al. 2000), but the release and dispersal of spores has received much less attention. This imbalance represents a significant gap in our knowledge of plant biology, because thousands of extant plant species do not produce seeds and rely instead on the dispersal of spores (Ingold 1939). These plants, which often grow low to the ground, must move their spores above the boundary layer so that they may be carried by the wind. This problem is further complicated by environmental differences (e.g. forests with barriers to wind versus open deserts) that affect wind flow and accordingly the height a spore must attain to penetrate the boundary layer. Subsequently, this lifestyle presents a suite of problems, which many plants have adapted to by developing mechanisms for violent spore release. For example, *Selaginella martensii* can eject a single spore 65cm (~13 times its own height) using a force 23 times greater than that of a human muscle fiber (Schneller et al. 2008).

The *Selaginella* genus is an excellent study group to investigate the diversity and evolution of spore release mechanisms because they span a wide range of environments and exhibit nearly the full range of spore dispersal strategies (Ingold 1939). *Selaginella* is a member of the lycophytes, or club mosses, and is a diverse clade of ~700 extant species inhabiting ecosystems ranging from deserts to tropical rainforests to temperate forests. Species in Selaginella are heterosporous, meaning that they produce both microspores (small, male) and megaspores (large, female). Heterospory offers the opportunity to examine the mechanisms underlying dehiscence and dispersal of two quite differently sized spores within the same plant. Additionally, there is disagreement in the literature regarding the mechanisms of megaspore dispersal, which have not been adequately documented (Ingold, 1939; Filippini-De Giorgi et al. 1997). *Selaginella* employs a variety of microspore dehiscence mechanisms: some species disperse spores passively, while others actively shoot spores into the air, and still others fling entire spore-filled sporangia as if from a catapult (Koller & Scheckler 1986). 

The goal of my project is to examine the diversity of megaspore and microspore release mechanisms within *Selaginella* in a phylogenetic and ecological context, ultimately to determine whether spore release mechanisms differ between megaspores and microspores, and whether they vary by major biome and/or clade. 
To answer these questions I will construct a phylogeny of *Selaginella* based on rbcL sequences for the species available in GenBank. I view this part of my final project as an exercise to work on my computational skills rather than as essential to the project; molecular phylogenies of Selaginella have been constructed (e.g. Korall & Kenrick 2004; Zhou et al. 2015) and I could (and may, depending on the outcome of the phylogeny I construct) ultimately choose to plot the characters I am interested in onto the most recent published phylogeny. I then will plot sporangial arrangement (of megaspores and microspores within the strobilus) and anatomy (different wall thickenings are associated with different discharge mechanisms) on the tree. Data for these characters will come predominantly from the literature (Horner & Arnott 1963; Somers 1982; Koller & Scheckler 1986; Quansah 1988; Schneller et al. 2008). I will include some of my personal observations and data, should I get the materials to embed and section strobili of the *Selaginella* species that I currently have. However, it is unlikely I will have collected much of my own data by the due date of this project, and accordingly I plan to continually add to the tree I create as I continue to collect data. 

#Simulating phylogenies and character evolution: The importance of taxon sampling and independent contrasts

What I described above is the ultimate goal I have for the project. However, I do not currently have the data on these characters that I need to actually run these analyses. Accordingly, for the sake of this class project (which will have to be finshed well before I have the data for the questions I'm actually interested in), I am going to simulate trees and character data.

Though the problems described in my original introduction require the integration of discrete characters, all of the analyses I worked on for this project only work for continuous characters. In the future I hope to learn how to more specifically deal with the evolution of discrete characters, but learning about the behavior of continuous variables was useful nonetheless, as I also frequently consider them (e.g. strobilus length, width, volume, axis diameter, etc.) in my work.

Accordingly, my ultimate plan for this project became:

1) Simulate a tree with 700 tips (the approximate number of *Selaginella* species)

2) Simulate 5 continuous characters

3) Calculate independent contrasts & get the covariance matrix: I'll ultimately present the covariance matrix for these traits with respect to the 700 tip tree 

4) Ignore phylogeny: Finally, I'll do the same analyses for these simulated characters, but without taking the simulated phylogeny into account in order to determine the strength of the effect of the phylogeny. 

5) I will repeat all of these steps for the same tree, but with tips successively dropped (to 350, 250, 100, 50, 25, and 3 tips), so that I can get an idea of how my real characters (when I have that data) will be affected by my taxon sampling and the taxon sampling of the most recent phylogeny available when it's time for my real analyses. 

6) If I have time, I'll play around with adding more characters and checking the sensitivity of the analyses to changing the variance of the characters, since there isn't enough data in the literature for me to use an estimate of the variance based on real life. 


## Methods

In order to learn more about the evolution and behavior of character data on trees with various taxon sampling, I simulated a tree with 700 tips, and then successively dropped tips from each tree such that I created trees with 350, 250, 100, 50, 25, and 3 tips from the original 700 tip topology. These steps, and all of the analyses described here, were done in RStudio using the package ape. See https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/simulations2 for the exact code that I used in all of these analyses.
 
Next, I created a variance-covariance matrix for five variables. Each variable had a variance of 1. I set the covariance of variable 1 with variables 2, 3, 4, and 5 at 0.00, 0.25, 0.5, and 0.5 respectively. All of the other variables had a covariance of 0.00 with one another.
 
I then simulated the evolution of these characters on each of my trees using the geiger package and the sim.char() function, (see https://github.com/nikolebonacorsi/phylobio_final_project/blob/master/simulations2 for specifics). I then was able to calculate the independent contrasts for these characters and obtain correlation coefficient matrices for the evolution of these characters based on each simulated phylogeny. I also generated correlation coefficient matrices for the values at the tips of each simulated phylogeny/character data set, in order to compare how different the results might be if independent contrasts had not been used to take into account the relatedness of each tip to one another.

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

When tips were randomly dropped from each tree, each of the three major clades from the starting tree happened to be maintained throughout (Fig. 0 A-G). This result was interesting for the sake of these analyses because the tree maintained its general shape even as tips were dropped. This result also meant that, in the theoretical scenarios I was working with, my final three-tip tree was actually representative of more distantly related individuals than might be expected simply from looking at the topology of the tree.

Superficially examining the first tree with character data mapped onto it (Fig. 1) it was difficult to distinguish any obvious trends, mainly because the sheer number of tips (700) caused a high degree of overlap in the circles representing the character states. Examining the correlation coefficient matrix for the independent contrasts based on this tree, however (Fig. 2A, Table 1) suggested that the lack of a discernable pattern may not have been entirely due to the presentation of the data. The only traits that appeared to be strongly related to one another in this case were traits 1 and 2, and traits 2 and 4. All of the other traits were weakly correlated with the others. This finding is in contrast to examining the character states by only considering the values and the tips and ignoring how they are related on the phylogeny (Fig 2B). In that case, 1 and 4 were strongly related to one another (as were  3 and 4), and 2 and 4 no longer showed a strong relationship. Other relationships (e.g. 3 and 1, 1 and 2 – any purple square on the heat map) are now recovered as moderately strong rather than as unrelated. This example illustrates the problem with not taking phylogeny into account when examining trait evolution, as the results for the independent contrasts and merely looking at the non-independent values at the tips would lead an investigator to quite different conclusions about how these traits behave.

The same problem arose across my intermediate trees (Fig. 3, 5, 7, 9, & 11) as well. The independent contrasts for the characters on the 350-taxon tree (Fig. 4A, Table 2) suggested that only variables 3 and 5 were strongly related, while the correlation coefficient matrix (Fig. 4B) for the values at the tips showed all variables except 2 and 3 and 2 and 4 were strongly associated with one another. The 250-taxon results (Fig. 6, Table 3) showed a similar pattern, with more variables that were moderately or strongly related to one another when phylogeny was ignored (Fig. 6B) than when it was taken into account (Fig. 6A).

When characters were mapped onto the 100-taxon tree (Fig. 7) the correlation coefficient matrices were more similar than for the other trees (Figure 8, Table 4) in terms of magnitude, with both matrices showing only more extreme color values, and no intermediate values. This relationship was likely recovered merely by chance, and the variables that correlate strongly differed in each case. The results from the independent contrasts showed that 5 was strongly associated with 1 and 2 (Fig. 8A), while the values at the tips indicated that 5 was strongly related to 4, as was 1, though they were not related to each other (Fig. 8B). Even the case (in my simulations) that seemed to achieve realistic taxon sampling and the most congruence (at least in magnitude of relationships) between the independent contrasts and the values at the tips, comparative biologists would still draw erroneous conclusions about their data without considering phylogeny.

The 50 and 25-taxon trees (Fig. 9 & 11) provided the most intuitive look at the behavior of the characters, since with fewer taxa the symbols representing the character states did not obscure one another as much. Again, in both cases, the results from the independent contrasts (Fig. 10A & 12A) were markedly different from the results that did not account for the phylogeny (Fig 10B & 12B), which illustrates that it is essential to consider the phylogeny when asking comparative questions about trait evolution for any legitimate sample of taxa, even when the same characters are simulated to evolove in seven different ways. 
 
Finally, I found the results of the 3-taxon tree (Fig. 13) to be particularly interesting. Of course, this example was dramatic and unlikely to reflect a real life scenario, but for the sake of these simulations it illustrated a point. When I compared the independent contrasts (Fig. 14A) to the values at the tips (Fig 14. B), almost all of the boxes were colored red. This finding indicated that with only three taxa, essentially all of the characters came out as either strongly positively, or strongly negatively correlated with one another. In this case, the three tips left on the tree represented one member from each of the three large clades initially present on the 700-tip tree. This result underscores the importance of strong taxon sampling – one representative from a clade is not often going to be very informative.

#Problems and Future Directions
 
It is important to note that the trees I used each had the simulated character evolution mapped onto them separately. This caveat means that the trait values at particular tips are not consistent from tree to tree. I attempted to redo the analyses by first mapping characters onto the 700-tip tree and then successively dropping tips (instead of the other way around as was presented here), but I could not accomplish getting the tree to preserve the character states across analyses. Nonetheless, this project could be improved by using that method, which would allow more direct comparisons to the changes in the correlation matrices to be observed across the different tipped trees.
 
Aesthetically, to improve my project, I would want to find a better way to represent the character evolution on the tree. I spent some time trying to heat-map that as well, because I thought that different colors might be easier to interpret for trees with many tips (instead of the different sized/colored circles) but I could not get the code to work, though I think that would have improved the presentation of these data. I also would have liked to have modeled the evolution of categorical variables in addition to continuous variables, since I will eventually be dealing with data of both types.
 
Additionally, I will need to have finer control over my heat-maps in the future. Each matrix was mapped such that values farther from 0 in either direction (positive or negative) were both red, making only the strength and not the direction of the relationship clear on the heat maps. Additionally, when all values were low, correlation coefficients that I described above as indicating a “more strong” relationship based on the heat maps, statistically may have been moderate or even weak relationships among particular variables. These problems would need to be corrected in the future, particularly if real, biologically relevant data were being depicted.
 
I had hoped to test the sensitivity of these analyses to changing the variance of each variable; however, I did not have time to play around with that component of the analysis, though future, improved versions of the project may attempt to do so. Experimenting with different models of evolution (other than Brownian Motion) and other phylogenetic comparative methods (other than independent contrasts) would also have been interesting, with unlimited time to devote to the project.
 
Finally, if I were to do this project again, I might experiment with intentionally dropping an entire large clade, because though each tree with fewer tips does theoretically represent poorer and poorer taxon sampling, I do not think that poor taxon sampling in reality would necessarily be structured randomly across the entire tree. For example, based on published phylogenies of *Selaginella*, it is obvious (and not unexpected) that many of the major clades also share similar biogeographical patterns. In collecting these plants for my work, it seems likely that I would over represent the North American clade, and underrepresent clades from Asia, since it will likely be more difficult to get access to those plants. If I were to do this project again, instead of randomly dropping tips from the trees, I would make them representative of the sort of biased sampling I just described.

Overall, though my inexperience with computational methods led to the bulk of my time and effort in this project going towards getting code that actually worked (and that I actually understood) rather than towards doing analyses beyond what I ended up having time to present here, this project was valuable to me as someone very new to these topics. It was helpful to interact first hand with an idea we had read a paper about, and now I have the foundation to play around with more advanced ideas based on this simple foundation.

##Acknowledgements
Andrew Leslie, for help with heat-mapping. 

Mike Rosario, for patiently helping me with R.

Casey Dunn, for suggesting this simulated version of the project when I didn't have my own data to use, and for his general guidance throughout the project. 

Abby Moore, for helping me (last semester) build the trees in the *Selaginella* rbcL analysis folder of this repository. They're not technically part of this project, but I thought it would be useful to have all of my *Selaginella* phylogenetics projects in one place so that it's easier to come back to later on. 

Morgan Moeglein, Kim Neil, Bianca Brown, & Haley Carter for emotional support. 





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


