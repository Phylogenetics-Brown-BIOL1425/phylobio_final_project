# Phylogenetic Biology - Final Project

# Lamiaceae Phylogeny, An Exploration

## Introduction and Goals

The original goal of my project was to answer the question, what are the evolutionary relationships between taxa in the plant family Lamiaceae, and how are the discovered evolutionary relationships affected by the phylogenetic inferences made to analyze them.

The methods I planned to use to do that were downloading gene sequences from Genbank, aligning and formatting them, generating trees using RevBayes, and comparing the different trees generated using different models of evolution, different genes, and different parameters.

The data I used are sequences available online from Genbank, whose accession numbers are published in Table 2 of C. Brauchler et al 2010.

After working through the project, I was only able to run trees with the Jukes and Cantor model of evolution, and GTR + gamma model of distribution for each single gene for taxa in the genus Clinopodium. This lead to the comparison between the trees produced by these different models of evolution and those produced by the different genes.

I discovered consistent clades within the genus Clinopodium, reguardless of the gene or model of evolution used to make the phylogenies and I compared these clades described to the geographical distribution of these species. I also discovered the species nested within different individuals of a different species and I compared their geographic distribution to assess the plausibility of these actually being the same species.

## Methods

Downloaded fasta files for the genes, trnK, trnL, and ITS as available for each species from GenBank, using the accession numbers in Table 2 of C. Brauchler et al 2010. I only used the first  

Combined the fasta files for each gene using the commands cat *_trnK.fasta > trnKcombined.raw.fasta cat *_trnL.fasta > trnLcombined.raw.fasta cat *_ITS.fasta > ITScombined.raw.fasta

Changed the fasta header rows to have just the species name using the commands 

sed -E 's/>.+\| ([a-zA-Z]+) ([a-zA-Z]+)[\. ].+/>\1_\2/g' trnKcombined.raw.fasta > trnKcombined.fasta

sed -E 's/>.+\| ([a-zA-Z]+) ([a-zA-Z]+)[\. ].+/>\1_\2/g' trnLcombined.raw.fasta > trnLcombined.fasta

sed -E 's/>.+\| ([a-zA-Z]+) ([a-zA-Z]+)[\. ].+/>\1_\2/g' ITScombined.raw.fasta > ITScombined.fasta

Used mafft to align sequences with the commands 

mafft trnKcombined.fasta > trnKcombined.aligned.fasta

mafft trnLcombined.fasta > trnLcombined.aligned.fasta

mafft ITScombined.fasta > ITScombined.aligned.fasta

Used mesquite to change things into nexus files, exporting the files trnKcombined.aligned.nex, trnLcombined.aligned.nex, ITScombined.aligned.nex. Then these files didn't work because there were taxa with duplicated names and it wasn't the correct NEXUS format. So I reopened the fasta filse in mesquite and added _1 _2 etc to the end of duplicate taxa names and saved them as trnKcombined.correct.nex trnLcombined.correct.nex ITScombined.correct.nex but these still weren't the correct format for revbayes to read so I opened them all in mesquite again and exported them as files compatible with revbayes by exporting them as mrbayesTRNK.nex mrbayesTRNL.nex and mrbayesITS.nex after choosing the NEXUS for mrbayes analysis option.

Changed the JukesCantor code from the bayes_intro assignment to use these nexus files. And downloaded and changed the GTRGamma code from the example script in the revbayes tutorials.

Used the command rb GTRGammaTRNK.Rev to create a tree of the gene trnK under GTR gamma model. It took way too long to run so then I decided to just look at the clinopodium genus to reduce the number of taxa in my tree and therefore hopefully reduce the computational time. I combined the clinopodium genes using the commands cat clinopodium_*_trnK.fasta > trnKclinopodium.raw.fasta cat clinopodium_*_trnL.fasta > trnLclinopodium.raw.fasta cat clinopodium_*_ITS.fasta > ITSclinopodium.raw.fasta 

I changed the fasta header rows to have just the species names using the commands

sed -E 's/>.+\| ([a-zA-Z]+) ([a-zA-Z]+)[\. ].+/>\1_\2/g' trnKclinopodium.raw.fasta > trnKclinopodium.fasta

sed -E 's/>.+\| ([a-zA-Z]+) ([a-zA-Z]+)[\. ].+/>\1_\2/g' trnLclinopodium.raw.fasta > trnLclinopodium.fasta

sed -E 's/>.+\| ([a-zA-Z]+) ([a-zA-Z]+)[\. ].+/>\1_\2/g' ITSclinopodium.raw.fasta > ITSclinopodium.fasta

And I aligned them using mafft

mafft trnKclinopodium.fasta > trnKclinopodium.aligned.fasta

mafft trnLclinopodium.fasta > trnLclinopodium.aligned.fasta

mafft ITSclinopodium.fasta > ITSclinopodium.aligned.fasta

Used mesquite to change things into nexus files compatible with revbayes by opening the aligned fasta files and exporting them as clinopodiumTRNK.nex clinopodiumTRNL.nex and clinopodiumITS.nex I also had to suffix the duplicate names with numbers again.

I changed the JukesCantor and GTRGamma code again, this time to use the clinopodium files, and I saved them as new files. To generate the trees I ran

rb clinopodiumJukesCantorTRNK.Rev

rb clinopodiumJukesCantorTRNL.Rev

rb clinopodiumJukesCantorITS.Rev

rb clinopodiumGTRGammaTRNK.Rev

rb clinopodiumGTRGammaTRNL.Rev

rb clinopodiumGTRGammaITS.Rev


## Results

When comparing the trees from the two runs for the ITS gene of Clinopodium under a Jukes and Cantor model, the only different is where the tree is rooted. All the other relationships remain the same. This indicates that the relationships between the ITS genes in different clinopodium taxa are well supported. The issue of the root location might have been fixed if I had included an outgroup in my sequences.

Comparing the trees from the two runs of the Jukes and Cantor models for the gene trnK in Clinopodium it's clear that the root placement is a major different between the trees of these two runs, just like it was for the ITS gene runs. However, the rest of the topology had some small differences as well. To compare to the GTR+gamma topology I used the tree from run 1.

Comparing the trees from the two runs of the Jukes and Cantor models for the gene trnL in Clinopodium tells the same story as comparing the two runs of the other two genes. There are clearly specific clades in Clinopodium, however this gene gives the most variable relationships within those clades. Again, there is a difference in where the trees are rooted because I neglected to include an outgroup.

Comparing the trees for the ITS gene under Jukes and Cantor and GTR+gamma models of evolution shows a consistant clade of C. fasciculatum, C. tomentosum, and C. cylindrostachys, a clade of C. axillare, C. bolivianum, C. gilliesii, and C. vanum, a clade of C. ashei, C. coccineum, C. dentatum, and C. carolinianum, sister to C. douglasii, a clade of C. barosmum, C. wardii, C. piperitum, and C. hydaspidis, which is sister to C. nepalense, and a clade of C. uhligii, C. vulgare, and C. simense which is sister to the clade of Acinos alpinus, C. acinos, and C. nanum under both models of evolution. C. abyssinicum and C. paradoxum were sister under both models of evolution, as were C. nubigenum and C. speciosum. Between the two models, the biggest differences were the root location, the location of the taxa C. brownei, and the relationships between some of the clades. Most of the sister speceis and quite a few of the clades were retained reguardless of the model suggesting that those relationships are well supported.

Comparing the trees for the trnK gene under Jukes and Cantor and GTR+gamma models of evolution gives similar results to the comparison of the models for the ITS gene in that many of the clades are supported under both models, but there are a few problem taxa, and a couple inconsistent relationships between clades. Specifically, the well supported clades are C. nepalensis, C. piperitum, C. hydaspidis, C. wardii, and C. barosmum, and the clade of C. chinensis, C. micranthum, C. megalanthum, C. polycephalum, and C. discolor. Other clades, such as C. abyssinicum, C. paradoxum, C. robustum, and C. myrianthum are supported by both models, but the relationships of the indivdual taxa within the clades are different. Again, this suggests that the genus Clinopodium consists of supported clades, but the relationships between and within them are less well defined.

In the same vein, comparing the trees for the trnL gene under Jukes and Cantor and GTR_gamma models of evolution give the same finding of major clades, but this gene shows the most differences between the relationships within those clades. 

Based on all the trees generated, I feel I can say pretty definitively that C. atlanticum is sister to the clade of C. menthifolium, C. nepeta, C. creticum, Micromeria thymifolia, C. vulgare, C. betulifolium, C. umbrosum, C. serpyllifolium, and Micromeria fruticosa (Clade 1). There are also sister clades of C. robustum, and C. myrianthum, (Clade 2) and then C. abyssinicum, and C. paradoxum (Clade 3). C. nepalense, C. barosmum, C. hydaspidis, C. wardii, and C. piperitum also make up a clade that is present in all the trees (Clade 4). As do, C. graveolens, C. troodii, C. suaveolens, and C. nanum (Clade 5). And that clade is almost always sister to the clade of C. acinos, and C. alpinum (Clade 6). C. uhlgii, C. kilimandschari, and C. simense also consistently form a clade (Clade 7). As do C. bolivianum, C. flabellifolium, C. nubigenum, C. revolutum, C. sericeum, and C. cylindrostachys (Clade 8).

All of these clades make geographic sense. Clade 1 inhabits Southern Europe and the Near Middle East. Clades 2 and 3 are African. Clade 4 is found in South Central China, Nepal, Tibet, and the Himalayas. Clade 5 is found in Southern Europe around the Mediterranean Sea and into the Middle East. Clade 6 is found throughout Europe. Clade 7 is African. And Clade 8 is found in Peru, Bolivia, and Ecuador.

The most problematic taxa accross the trees was C. brownei, which is commonly called Browne's savory. This taxa hopped around the tree and it's evolutionary relationship to the rest of the genus is therefore relatively unknown. 

Some interesting results came out of the fact that I included sequences from different individuals of the same species. The relationships between the individuals of the species were not stable from one tree to the next, but even more interestingly, there were some other species nestled within the individuals of one supposed species. C. acinos was always more related to C. alpinum than the other individual of its species. C. kilimandschari was always placed within the individuals of C. uhligii. One of the individuals of C. abyssinicum was always more related to C. paradoxum than the rest of its species. And the individuals of C. robustum were always mixed with those of C. myrianthum. These results indicate that the boundaries between these "species" maybe less defined than we think, and these species may not actually be different. The geographic distributions of these species back up the idea that these might be the same species. C. abyssinicum and C. paradoxum are both African, specifically they are found in Ethopia. C. robustum and C. myrianthum are African species as well, with wider distributions. Clade 7 with its intermixed uhlgii and kilimandschari species, might actually be all one species, as all three species names as listed as synonyms in the paper Ryding 2006. 

## Discussion

These results indicate that there are clear clades within the genus Clinopodium, most with specific geographic distributions, but some of the species we currently think of as distinct, may actually be the same. This result is interesting as it brings up the daunting question, how do we define species in the first place? I think this is a place for future phylogenetic analyses to take us. I would like to see more trees that incoporate multiple individuals from different species, to see if the individuals of one species are more related to each other than they are to the individuals of closely related species.

My results also show that for this genus in particular, all three genes, and the two different models of evolution allow you to parse out the same overall clades. This shows a great deal of support for those clades, however further analysis is needed to get more support for the relationships between the clades.

The biggest difficulty in implementing these analyses was just running revbayes. I kept getting back a criptic error that said I was using a non-model object when I tried to assign my character matrix to my data. Eventually I figured out it was because my nexus file wasn't the right format to be read by revbayes and then I went back into mesquite and exported my files using their NEXUS files that are specifically for mrbayes. I also had to change some of the language used in the .Rev files because they keep updating the Rev language and making changes like names instead of taxa.

Another difficulty was not realizing how long it would take to run these analyses with such a large number of taxa. Though I would eventually like to go back and make trees with all the taxa included, it was not time feasible for this project, which is why I switched to just the genus clinopodium.

If I did these analyses again, I would probably have a much easier time because now I know what I'm looking for in cleaning up the code for RevBayes, and I know what type of files are compatible. As I said before I would also like to make trees of all the taxa instead of just this genus. I would also like to run trees based off the combined genes because that would probably give the most accurate result of how these taxa are related to each other. I meant to do that with this project, but hardly even made it through the single gene trees. 

Overall, even though I didn't complete the task I set out to do I think I gained a lot from doing this project. Before starting this project I had an almost exclusively theoretical understanding of running these sorts of analysis, as we only did a couple computational projects in class and we were mostly just copying and pasting. By working through this on my own I had to do a lot more problem solving and get more intimately aqquanted with the codes. I would like to keep learning how to manipulate the models in RevBayes to see how they affect the end result. But after this project I can say that I at least know how to get to the point where I can start to do that.

## References

Brauchler, Christian, Meimberg, Harold, and Heubl, Gunther. "Molecular phylogeny of Menthinae (Lamiaceae, Nepetoideae, Mentheae) - Taxonomy, biogeography and conflicts". Molecular Phylogenetics and Evolution 55 (2010): 501-523. Web. http://www.ncbi.nlm.nih.gov/pubmed/20152913

Catalogue of Life. Naturalis ICT, 2015. Web. http://www.catalogueoflife.org/

Global Biodiversity Information Facility. Unversitetsparken 15 DK-2100 Copenhagen O Denmark, 2016. Web. http://www.gbif.org/

Menitsky Y.L., 1988; Red Data Book of Armenia SSR, 1989

Ryding, Olof. “Revision of the Clinopodium Simense Group (labiatae)”. Kew Bulletin 61.3 (2006): 419–432. Web. http://www.jstor.org/stable/20443286?seq=1#page_scan_tab_contents

Tropicos.org. Missouri Botanical Garden. 03 May 2016. Web. http://www.tropicos.org

Wildscreen Arkive. Wildscreen initiative, UK charity no. 299450 | USA 501(c)(3) nonprofit organization. Web. http://www.arkive.org/

