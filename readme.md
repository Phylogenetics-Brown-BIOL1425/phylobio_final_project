# Phylogenetic Biology - Final Project

## Guidelines - you can delete this section before submission

This repository is a stub for your final project. Fork it, develop your project, and submit it as a pull request. Edit/ delete the text in this readme as needed.

Some guidelines and tips:

- For information on formatting text files with markdown, see https://guides.github.com/features/mastering-markdown/ . You can use markdown to include images in this document by linking to files in the repository, eg `![GitHub Logo](/images/logo.png)`.

- The project must be entirely reproducible. In addition to the results, the repository must include all the data (or links to data) and code needed to reproduce the results.

- Paste references (including urls) into the reference section, and cite them with the general format (Smith at al. 2003).

OK, here we go.

```r
setwd("~/Dropbox/Brown University/BIOL1425/phylobio_final_project/")
```

# Title of my project

Sensitivity Analysis of input GE on EDGE Values

## Introduction and Goals

It seems inevitable that climate change, along with other anthropogenic factors, will continue to drive the endangerment and extinction of taxa for the immediate future. Each species is by definition a unique parcel of genetic information, which means that an extinction is the loss of a unique genome. With the number of endgangered taxa mounting, it is important to understand the ways in which species will go extinct, and what that means for the loss of phylogenetic diversity. EDGE values (Isaac et al 2007) are a proposed method of combining a species' probability of extinction (GE, global endangerment) with a measure of its unique evolutionary history (ED, evolutionary distinctiveness). Calculation of the evolutionary distinctiveness (ED) value is based on tree topology, where a species' score is  the total branch length from the root node to its tip, where internal branches' weight is scaled by the number of tip taxa that share that branch.

![Isaac2007_fig1](Isaac_fig1.png)


__**The methods I will use to do this are...**__

My goal is to construct the phylogeny for Salamandridae and map EDGE values (evolutionarily distinct, globally endangered) onto the tips.  


__**The data I will use are (my own data/ data publicly available at YYY/ simulations)**__

I am drawing my data entirely from the supplementary table of accession numbers provided in Pyron 2011.

____________

## Methods

I started by downloading the accession numbers for 12 genes published Pyron 2011, used in the construction of a comprehensive Amphibia phylogeny, storing them in a data frame called accessions.  


```r
accessions=read.csv("Pyrondata.csv",header = TRUE)
# data is from Pyron 2011
row.names(accessions)=accessions[,1]
specieslist=accessions[,1]
accessions=accessions[-2873,]
accessions=accessions[,-1]
dim(accessions)
```

```
## [1] 2872   12
```

```r
accessions[1,]
```

```
##                     X12S     X16S cytb CXCR4  H3A NCX1 POMC RAG1 RHOD  SIA
## Acanthixalus_sonjae <NA> AF465437 <NA>  <NA> <NA> <NA> <NA> <NA> <NA> <NA>
##                     SLC8A3  TYR
## Acanthixalus_sonjae   <NA> <NA>
```
I then downloaded a list of all the IUCN designations for species within Salamandridae from the IUCN Red List database (http://www.iucnredlist.org/), storing it locally as a .csv and within the R environment as IUCN_salamandridae.

```r
IUCN_salamandridae=read.csv("IUCN_salamandridae.csv", header = TRUE)
dim(IUCN_salamandridae)
```

```
## [1] 76 13
```

```r
#76 species of salamanders in IUCN database
names(IUCN_salamandridae)
```

```
##  [1] "Species.ID"                "Genus"                    
##  [3] "Species"                   "genus_species"            
##  [5] "Authority"                 "Synonyms"                 
##  [7] "Common.names..Eng."        "Red.List.status"          
##  [9] "Red.List.criteria"         "Red.List.criteria.version"
## [11] "Year.assessed"             "Population.trend"         
## [13] "Petitioned"
```

```r
row.names(IUCN_salamandridae)=IUCN_salamandridae[,4]
IUCN_salamandridae=IUCN_salamandridae[,-4]
```
By searching the row names of each dataframe, I pared down the rows in accessions so that I only look at species with designations in the IUCN database. This left me with 65 salamandridae species for phylogenetic analysis.

```r
accessions=accessions[rownames(accessions)%in%rownames(IUCN_salamandridae),]
dim(accessions)
```

```
## [1] 65 12
```

```r
accessions[1,]
```

```
##                        X12S     X16S     cytb CXCR4  H3A NCX1 POMC RAG1
## Calotriton_arnoldi DQ092300 DQ092282 DQ092240  <NA> <NA> <NA> <NA> <NA>
##                    RHOD  SIA SLC8A3  TYR
## Calotriton_arnoldi <NA> <NA>   <NA> <NA>
```
After looking at the accessions for each listed species, it became clear that the salamanders are data deficient for all genes except x12s, x16s, and cytb. For that reason, I dropped the other 9 genes from my analysis.

```r
accessions=accessions[,-c(4:12)]
```
I then created an IUCN_salamandridae_matched dataframe, which listed only those rows which are in accessions, effectively creating two dataframes with identical rows.

```r
IUCN_salamandridae_matched=IUCN_salamandridae[rownames(IUCN_salamandridae)%in%rownames(accessions),]
dim(IUCN_salamandridae_matched)
```

```
## [1] 65 12
```

```r
names(IUCN_salamandridae_matched)
```

```
##  [1] "Species.ID"                "Genus"                    
##  [3] "Species"                   "Authority"                
##  [5] "Synonyms"                  "Common.names..Eng."       
##  [7] "Red.List.status"           "Red.List.criteria"        
##  [9] "Red.List.criteria.version" "Year.assessed"            
## [11] "Population.trend"          "Petitioned"
```
I then went into the matched IUCN dataframe and extracted the Red_list_status and Red_list_criteria columns and appended them to my accessions dataframe. 

```r
accessions[,4]=IUCN_salamandridae_matched[,7]
accessions[,5]=IUCN_salamandridae_matched[,8]
accessions[,6]=IUCN_salamandridae_matched[,11]
names(accessions)[4]="Red_list_status"
names(accessions)[5]="Red_list_criteria"
names(accessions)[6]="population_trend"
names(accessions)
```

```
## [1] "X12S"              "X16S"              "cytb"             
## [4] "Red_list_status"   "Red_list_criteria" "population_trend"
```
I then exported my accessions dataframe to a .csv file

```r
write.csv(accessions,file = "accessions_salamandridae.csv")
```
I removed T.vittatus sequence from x12s.fasta because it would not align (tried inputting the reverse complement without success).


The tools I used were... See analysis files at (links to analysis files).

Accession numbers for sequences were gathered from Pyron 2011
mafft alignment
raxml (starting from hydroid)
  justification in Pyron for ml method



## Results

The tree in Figure 1...

## Discussion

These results indicate...

The biggest difficulty in implementing these analyses was...

If I did these analyses again, I would...

## References

Davies, T. Jonathan, Gideon F. Smith, Dirk U. Bellstedt, James S. Boatwright, Benny Bytebier, Richard M. Cowling, Félix Forest, Luke J. Harmon, A. Muthama Muasya, Brian D. Schrire, Yolande Steenkamp, Michelle Van Der Bank, and Vincent Savolainen. "Extinction Risk and Diversification Are Linked in a Plant Biodiversity Hotspot." PLoS Biology PLoS Biol 9.5 (2011): n. pag. Web. <http://journals.plos.org/plosbiology/article?id=10.1371/journal.pbio.1000620>.

Isaac, Nick J.b., Samuel T. Turvey, Ben Collen, Carly Waterman, and Jonathan E.m. Baillie. "Mammals on the EDGE: Conservation Priorities Based on Threat and Phylogeny." PLoS ONE 2.3 (2007): n. pag. Web. 28 Apr. 2016. <http://journals.plos.org/plosone/article/asset?id=10.1371/journal.pone.0000296.PDF>.

Purvis, A. "Nonrandom Extinction and the Loss of Evolutionary History." Science 288.5464 (2000): 328-30. Web. <http://science.sciencemag.org/content/288/5464/328>.

Pyron, R. Alexander, and John J. Wiens. "A Large-scale Phylogeny of Amphibia including over 2800 Species, and a Revised Classification of Extant Frogs, Salamanders, and Caecilians." Molecular Phylogenetics and Evolution 61.2 (2011): 543-83. Web. 28 Apr. 2016. <http://www.sciencedirect.com/science/article/pii/S105579031100279X>.

Rolland, J., M. W. Cadotte, J. Davies, V. Devictor, S. Lavergne, N. Mouquet, S. Pavoine, A. Rodrigues, W. Thuiller, L. Turcati, M. Winter, L. Zupan, F. Jabot, and H. Morlon. "Using Phylogenies in Conservation: New Perspectives." Biology Letters 8.5 (2011): 692-94. Web. <http://rsbl.royalsocietypublishing.org/content/early/2011/11/21/rsbl.2011.1024>.

Thuiller, Wilfried, Sébastien Lavergne, Cristina Roquet, Isabelle Boulangeat, Bruno Lafourcade, and Miguel. B. Araujo. "Consequences of Climate Change on the Tree of Life in Europe." Nature 470.7335 (2011): 531-34. Web. <http://www.nature.com/nature/journal/v470/n7335/full/nature09705.html>.


