##### Tracking Fourth Trochanter Position in Dinosauria #####
### James Napoli and Avinash Subramanian, Phylogenetic Biology Final Project R Code ####

rm(list=ls()) # Clear pre-existing variables
# Load required packages for session
library(ape)
library(picante)
library(paleotree)
library(phytools)

#### DATA COLLECTION ####

# Reading phylogeny of taxa of interest
raw_phylogeny = read.newick(text = "(((((((((((((((Tyrannosaurus,Tarbosaurus),Daspletosaurus),(Gorgosaurus,Albertosaurus)),Bistahieversor),(Compsognathus,Sinosauropteryx)),(((Giganotosaurus,Acrocanthosaurus),Allosaurus),(Sinraptor,Yangchuanosaurus))),((Suchomimus,Streptospondylus),Piatnitzkysaurus)),Sinosaurus),Ceratosaurus),Dilophosaurus),Liliensternus),(Herrarasaurus,Staurikosaurus)),Eoraptor),(((((((((((((((((((((((((Saurolophus_osborni,Saurolophus_angustirostris),Gryposaurus),(Edmontosaurus_regalis,Edmontosaurus_annectens)),Shantungosaurus),(Brachylophosaurus,Maiasaura)),(((((((Lambeosaurus_lambei,Lambeosaurus_magnicristatus),(Corythosaurus_casuarius,Corythosaurus_intermedius)),Hypacrosaurus_stebingeri),Hypacrosaurus_altispinus),Parasaurolophus),Olorotitan),Tsintaosaurus)),Bactrosaurus),Tethyshadros),Probactrosaurus),(Mantellisaurus,Iguanodon)),Ouranosaurus),Uteodon),Camptosaurus),(Dryosaurus,Dysalotosaurus)),Tenontosaurus),Zalmoxes),Parksosaurus),(Gasparinisaura,Talenkauen)),Thescelosaurus),Hypsilophodon),((((Montanoceratops,Leptoceratops),Protoceratops),(Psittacosaurus_neimongoliensis,Psittacosaurus_mongoliensis)),(Pachycephalosaurus,Prenocephale))),Othnielosaurus),Agilisaurus),Heterodontosaurus)))),Marasuchus);")

raw_phylogeny_saurischia = read.newick(text = "(((((((((((((Tyrannosaurus,Tarbosaurus),Daspletosaurus),(Gorgosaurus,Albertosaurus)),Bistahieversor),(Compsognathus,Sinosauropteryx)),(((Giganotosaurus,Acrocanthosaurus),Allosaurus),(Sinraptor,Yangchuanosaurus))),((Suchomimus,Streptospondylus),Piatnitzkysaurus)),Sinosaurus),Ceratosaurus),Dilophosaurus),Liliensternus),(Herrarasaurus,Staurikosaurus)),Eoraptor);")

raw_phylogeny_ornithischia = read.newick(text = "(((((((((((((((((((((((((Saurolophus_osborni,Saurolophus_angustirostris),Gryposaurus),(Edmontosaurus_regalis,Edmontosaurus_annectens)),Shantungosaurus),(Brachylophosaurus,Maiasaura)),(((((((Lambeosaurus_lambei,Lambeosaurus_magnicristatus),(Corythosaurus_casuarius,Corythosaurus_intermedius)),Hypacrosaurus_stebingeri),Hypacrosaurus_altispinus),Parasaurolophus),Olorotitan),Tsintaosaurus)),Bactrosaurus),Tethyshadros),Probactrosaurus),(Mantellisaurus,Iguanodon)),Ouranosaurus),Uteodon),Camptosaurus),(Dryosaurus,Dysalotosaurus)),Tenontosaurus),Zalmoxes),Parksosaurus),(Gasparinisaura,Talenkauen)),Thescelosaurus),Hypsilophodon),((((Montanoceratops,Leptoceratops),Protoceratops),(Psittacosaurus_neimongoliensis,Psittacosaurus_mongoliensis)),(Pachycephalosaurus,Prenocephale))),Othnielosaurus),Agilisaurus),Heterodontosaurus));")

# Drawing phylogeny with no specified branch lengths:
phylogeny = collapse.singles(raw_phylogeny)
plot.phylo(phylogeny, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin=T) # These settings are good for displaying this phylogeny - uncluttered text and clear branches. 

phylogeny_saurischia = collapse.singles(raw_phylogeny_saurischia)
plot.phylo(phylogeny_saurischia, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin=T)

phylogeny_ornithischia = collapse.singles(raw_phylogeny_ornithischia)
plot.phylo(phylogeny_ornithischia, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin=T)

# Loading data for the taxa of interest:
data = read.table("occurrence__data.txt", sep = "\t", row.names = 1, header = T)
time_data = read.table("time_data.txt", row.names = 1, sep="\t", header = T)
time_data_saurischia = time_data[1:23,]
time_data_ornithischia = time_data[24:67,]

# Storing important variables
taxa = data$TAXON
trochanter_position = as.matrix(data)[,3]
trochanter_position_saurischia = trochanter_position[1:23]
trochanter_position_ornithischia = trochanter_position[24:67]
body_mass = as.matrix(data)[,4]
body_mass_saurischia = body_mass[1:23]
body_mass_ornithischia = body_mass[24:67]
FAD = as.matrix(data)[,1]
LAD = as.matrix(data)[,2]

# Function calculates branch lengths for the phylogeny, drawing on geologic occurrence data and randomized values for birth, extinction, and sampling rate. It can do this any number of times, and store each run's data as a separate column in a matrix of 134 rows (the number of edges on the tree)
tree_scaler = function(tree, occurrence, repetitions) {
  all_Lengths = matrix(nrow = 134, ncol = repetitions)
  for (i in 1:repetitions) {
    birthRate = runif(1, min = 0.001, max = 0.15)
    extRate = runif(1, min = 0.001, max = 0.15)
    samplRate = runif(1, min = 0.146, max = 0.262)
    scaledTree = cal3TimePaleoPhy(tree = tree, timeData = occurrence, sampRate = samplRate, brRate = birthRate, extRate = extRate, dateTreatment = "minMax", ntrees = 1)
    branchLength = scaledTree$edge.length
    all_Lengths[,i] = branchLength
  }
  assign("all_Lengths", all_Lengths,.GlobalEnv)
  return(all_Lengths)
}

tree_scaler_saurischia = function(tree, occurrence, repetitions) {
  all_Lengths_saurischia = matrix(nrow = 44, ncol = repetitions)
  for (i in 1:repetitions) {
    birthRate = runif(1, min = 0.001, max = 0.15)
    extRate = runif(1, min = 0.001, max = 0.15)
    samplRate = runif(1, min = 0.146, max = 0.262)
    scaledTree = cal3TimePaleoPhy(tree = tree, timeData = occurrence, sampRate = samplRate, brRate = birthRate, extRate = extRate, dateTreatment = "minMax", ntrees = 1)
    branchLength = scaledTree$edge.length
    all_Lengths_saurischia[,i] = branchLength
  }
  assign("all_Lengths_saurischia", all_Lengths_saurischia,.GlobalEnv)
  return(all_Lengths_saurischia)
}

tree_scaler_ornithischia = function(tree, occurrence, repetitions) {
  all_Lengths_ornithischia = matrix(nrow = 86, ncol = repetitions)
  for (i in 1:repetitions) {
    birthRate = runif(1, min = 0.001, max = 0.15)
    extRate = runif(1, min = 0.001, max = 0.15)
    samplRate = runif(1, min = 0.146, max = 0.262)
    scaledTree = cal3TimePaleoPhy(tree = tree, timeData = occurrence, sampRate = samplRate, brRate = birthRate, extRate = extRate, dateTreatment = "minMax", ntrees = 1)
    branchLength = scaledTree$edge.length
    all_Lengths_ornithischia[,i] = branchLength
  }
  assign("all_Lengths_ornithischia", all_Lengths_ornithischia,.GlobalEnv)
  return(all_Lengths_ornithischia)
}

# Running tree_scaler 100 times
tree_scaler(phylogeny, time_data, 100)
avg_Lengths = rowMeans(all_Lengths, na.rm=FALSE, dims=1) #Takes mean of each row to obtain "average" branch lengths for the phylogeny

tree_scaler_saurischia(phylogeny_saurischia, time_data_saurischia, 100)
avg_Lengths_saurischia = rowMeans(all_Lengths_saurischia, na.rm=FALSE, dims=1)

tree_scaler_ornithischia(phylogeny_ornithischia, time_data_ornithischia, 100)
avg_Lengths_ornithishia = rowMeans(all_Lengths_ornithischia, na.rm=FALSE, dims=1)

# Plotting "average" trees
avg_Tree = cal3TimePaleoPhy(tree = phylogeny, timeData = time_data, sampRate = runif(1, min = 0.146, max = 0.262), brRate = runif(1, min = 0.001, max = 0.15), extRate = runif(1, min = 0.001, max = 0.15), dateTreatment = "minMax", ntrees = 1)
avg_Tree$edge.length = avg_Lengths
plot(avg_Tree, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin = T)

avg_Tree_saurischia = cal3TimePaleoPhy(tree = phylogeny_saurischia, timeData = time_data_saurischia, sampRate = runif(1, min = 0.104, max = 0.243), brRate = runif(1, min = 0.001, max = 0.15), extRate = runif(1, min = 0.001, max = 0.15), dateTreatment = "minMax", ntrees = 1)
avg_Tree_saurischia$edge.length = avg_Lengths_saurischia
plot(avg_Tree_saurischia, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin = T)

avg_Tree_ornithischia = cal3TimePaleoPhy(tree = phylogeny_ornithischia, timeData = time_data_ornithischia, sampRate = runif(1, min = 0.172, max = 0.355), brRate = runif(1, min = 0.001, max = 0.15), extRate = runif(1, min = 0.001, max = 0.15), dateTreatment = "minMax", ntrees = 1)
avg_Tree_ornithischia$edge.length = avg_Lengths_ornithishia
plot(avg_Tree_ornithischia, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin = T)


#### ANALYSIS ####

# Testing for Phylogenetic Signal in Whole Dataset
phylosignal(trochanter_position, avg_Tree)
phylosignal(body_mass, avg_Tree)
## K for 4th trochanter position is 1.267668, indicating that related species resemble each other more than would be expected under a random walk through morphospace. In contrast, K for body mass is 0.3015823, indicating that closely related species resemble each other less than would be expected by chance. The p-values for both are less than 0.05, suggesting that the phylogenetic signal is non random - that is, that the results reflect something biologically "real". 

# Simulating character data
ntips = length(avg_Tree$tip.label)
x = rnorm(ntips, mean=0, sd=1)
phylosignal(x, avg_Tree)
## Yields K = 0.1121477 and p-value of 0.545. 

# Testing for Phylogenetic Signal in Saurischia
phylosignal(trochanter_position_saurischia, avg_Tree_saurischia)
phylosignal(body_mass_saurischia, avg_Tree_saurischia)
## Yields K = 0.1641471 for trochanter position, indicating that related species resemble each other less than would be expected. The p-value however is 0.871, indicating that the results are not statistically significant. Yields K = 0.7972952 for body mass, indicating that related species resemble each other less than would be expected. The p-value is 0.001, much below 0.05, making the result statistically significant.

# Testing for Phylogenetic Signal in Ornithischia
phylosignal(trochanter_position_ornithischia, avg_Tree_ornithischia)
phylosignal(body_mass_ornithischia, avg_Tree_ornithischia)
## Yields K = 0.257648 for trochanter position, indicating that related species resemble each other less than would be expected. Yields K = 0.3091013 for body mass, indicating related species resemble each other less than expected. The p-value for both, however, is above 0.05, indicating that the two results are not statistically significant.

# Testing for Correlation with Body Mass

# Independant Contrasts
Contrast_bodyMass = pic(body_mass, avg_Tree)
Contrast_Trochanter = pic(trochanter_position, avg_Tree)
regressContrastPosition = lm(Contrast_Trochanter-1~Contrast_bodyMass)
summary.lm(regressContrastPosition)
## Correlation significant (p = 0.0355)

Contrast_bodyMass_saurischia = pic(body_mass_saurischia, avg_Tree_saurischia)
Contrast_Trochanter_saurischia = pic(trochanter_position_saurischia, avg_Tree_saurischia)
regress_cont_Saurischia = lm(Contrast_Trochanter_saurischia-1~Contrast_bodyMass_saurischia)
summary.lm(regress_cont_Saurischia)
## Correlation insignificant (p = 0.0808)

Contrast_bodyMass_ornithischia = pic(body_mass_ornithischia, avg_Tree_ornithischia)
Contrast_Trochanter_ornithischia = pic(trochanter_position_ornithischia, avg_Tree_ornithischia)
regress_cont_Ornithischia = lm(Contrast_Trochanter_ornithischia-1~Contrast_bodyMass_ornithischia)
summary.lm(regress_cont_Ornithischia)
## Correlation insignificant (p = 0.1490)

# Creation of Data Frame for Regressions, by Order
Saurischia = data.frame(body_mass[1:23], trochanter_position[1:23])
names(Saurischia) = c("body_mass", "trochanter_position")
Ornithischia = data.frame(body_mass[24:67], trochanter_position[24:67])
names(Ornithischia) = c("body_mass", "trochanter_position")
Marasuchus = data.frame(body_mass[68], trochanter_position[68])
names(Marasuchus) = c("body_mass", "trochanter_position")

regressSaurischia = lm(Saurischia$trochanter_position~log10(Saurischia$body_mass))
summary.lm(regressSaurischia)
## Correlation significant (0.004157)
regressOrnithischia = lm(Ornithischia$trochanter_position~log10(Ornithischia$body_mass))
summary.lm(regressOrnithischia)
## Correlation insignificant (0.0673)

# Plot of fourth trochanter position against body mass 
plot(log10(body_mass), trochanter_position, type = "n", main = "Fourth Trochanter Position vs Body Mass", xlab = "Log10 Body Mass (kg)", ylab = "4th Trochanter Position (% downshaft)")
points(log10(body_mass[1:23]), trochanter_position[1:23], pch = 17, cex = 1.2, col="red")
points(log10(body_mass[24:67]), trochanter_position[24:67], pch = 19, cex = 1.1, col="forest green")
points(log10(body_mass[68]), trochanter_position[68], pch = "*", cex = 2, col="cadetblue")
# Regression lines for Dinosauria as a whole, and for Saurischia and Ornithischia
abline(regressPosition$coefficients, lwd = 2, lty = 5)
abline(regressSaurischia$coefficients, lwd = 2, col = "red", lty = 3)
abline(regressOrnithischia$coefficients, lwd = 2, col = "forest green", lty = 3)
legend(0.27, 0.63, legend = c("Saurischia", "Ornithischia"), col=c("red", "forest green"), lty = 3)

# Contrast in fourth trochanter position regressed with contrast in body mass
plot(Contrast_bodyMass, Contrast_Trochanter, main = "Contrasts of 4th Trochanter Position and Body Mass", xlab = "Body Mass", ylab = "4th Trochanter Position")
regress2 = lm(Contrast_bodyMass~Contrast_Trochanter)
abline(regress2)
## Correlation significant (0.0341)

# Ancestral State Reconstructuon
# fit = fastAnc(avg_Tree, trochanter_position, vars = TRUE, CI = TRUE)
# Plotting Phenogram
##phenogram = phenogram(avg_Tree, trochanter_position, fize = 0.6, spread.labels=TRUE, spread.cost=c(2,2), link=50, offset=0.2, xlab = "Time (millions of years)", ylab = "Position of 4th Trochanter (% downshaft)")
# Plotting Contour Map
obj = contMap(avg_Tree, trochanter_position, type = "phylogram", legend = 0.7*max(nodeHeights(avg_Tree)), plot = TRUE)
obj = setMap(obj, colors = c("blue", "cyan", "green", "yellow", "red"))
plot(obj, lwd=2.4, fsize = 0.6)
# Plotting Side-by-Side
## Trait of a distinctive fourth trochanter first appears on the branch leading up to Heterodontosaurus among the Ornithischians, and independently in Herrerasaurus and the branch leading up to Neotheropoda (Dilophosaurus) in the Saurischians