### Tracking Fourth Trochanter Position in Dinosauria
### James Napoli and Avinash Subramanian, Phylogenetic Biology Final Project R Code

rm(list=ls()) # Clear pre-existing variables
# Load required packages for session
library(ape)
library(picante)
library(paleotree)
library(phytools)

## DATA COLLECTION

# Reading phylogeny of taxa of interest
raw_phylogeny = read.newick(text = "(((((((((((((((Tyrannosaurus,Tarbosaurus),Daspletosaurus),(Gorgosaurus,Albertosaurus)),Bistahieversor),(Compsognathus,Sinosauropteryx)),(((Giganotosaurus,Acrocanthosaurus),Allosaurus),(Sinraptor,Yangchuanosaurus))),((Suchomimus,Streptospondylus),Piatnitzkysaurus)),Sinosaurus),Ceratosaurus),Dilophosaurus),Liliensternus),(Herrarasaurus,Staurikosaurus)),Eoraptor),(((((((((((((((((((((((((Saurolophus_osborni,Saurolophus_angustirostris),Gryposaurus),(Edmontosaurus_regalis,Edmontosaurus_annectens)),Shantungosaurus),(Brachylophosaurus,Maiasaura)),(((((((Lambeosaurus_lambei,Lambeosaurus_magnicristatus),(Corythosaurus_casuarius,Corythosaurus_intermedius)),Hypacrosaurus_stebingeri),Hypacrosaurus_altispinus),Parasaurolophus),Olorotitan),Tsintaosaurus)),Bactrosaurus),Tethyshadros),Probactrosaurus),(Mantellisaurus,Iguanodon)),Ouranosaurus),Uteodon),Camptosaurus),(Dryosaurus,Dysalotosaurus)),Tenontosaurus),Zalmoxes),Parksosaurus),(Gasparinisaura,Talenkauen)),Thescelosaurus),Hypsilophodon),((((Montanoceratops,Leptoceratops),Protoceratops),(Psittacosaurus_neimongoliensis,Psittacosaurus_mongoliensis)),(Pachycephalosaurus,Prenocephale))),Othnielosaurus),Agilisaurus),Heterodontosaurus)))),Marasuchus);")

# Drawing phylogeny with no specified branch lengths:
phylogeny = collapse.singles(raw_phylogeny)
plot.phylo(phylogeny, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin=T) # These settings are good for displaying this phylogeny - uncluttered text and clear branches. 

# Loading data for the taxa of interest:
data = read.table("occurrence__data.txt", sep = "\t", row.names = 1, header = T)
time_data = read.table("time_data.txt", row.names = 1, sep="\t", header = T)

# Storing important variables
taxa = data$TAXON
trochanter_position = as.matrix(data)[,3]
body_mass = as.matrix(data)[,4]
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

# Running tree_scaler 100 times
tree_scaler(phylogeny, time_data, 100)
avg_Lengths = rowMeans(all_Lengths, na.rm=FALSE, dims=1) #Takes mean of each row to obtain "average" branch lengths for the phylogeny

# Plotting "average" tree
avg_Tree = cal3TimePaleoPhy(tree = phylogeny, timeData = time_data, sampRate = runif(1, min = 0.146, max = 0.262), brRate = runif(1, min = 0.001, max = 0.15), extRate = runif(1, min = 0.001, max = 0.15), dateTreatment = "minMax", ntrees = 1)
avg_Tree$edge.length = avg_Lengths
plot(avg_Tree, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin = T)

## ANALYSIS

# Testing for Phylogenetic Signal
phylosignal(trochanter_position, avg_Tree)
phylosignal(body_mass, avg_Tree)
## K for 4th trochanter position is 1.267668, indicating that related species resemble each other more than would be expected under a random walk through morphospace. In contrast, K for body mass is 0.3015823, indicating that closely related species resemble each other less than would be expected by chance. The p-values for both are less than 0.05, suggesting that the phylogenetic signal is non random - that is, that the results reflect something biologically "real". 

# Simulating character data
ntips = length(avg_Tree$tip.label)
x = rnorm(ntips, mean=0, sd=1)
phylosignal(x, avg_Tree)
## Yields K = 0.1121477 and p-value of 0.545. 

# Testing for Correlation with Body Mass
# Simple Regression
regressPosition = lm(trochanter_position~log10(body_mass))
summary.lm(regressPosition)
## Correlation significant (p = 0.0482)

# Independant Contrasts
Contrast_bodyMass = pic(body_mass, avg_Tree)
Contrast_Trochanter = pic(trochanter_position, avg_Tree)
regressContrastPosition = lm(Contrast_Trochanter-1~Contrast_bodyMass)
summary.lm(regressContrastPosition)
## Correlation significant (p = 0.0381)

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
plot(Contrast_Trochanter, Contrast_bodyMass, main = "Independent Contrast Plot of Fourth Trochanter Position Against Body Mass", xlab = "4th Trochanter Position Contrast", ylab = "Body Mass Position Contrast")
abline(regressContrastPosition$coefficients, lwd = 2, col = "blue", lty = 3)
summary.lm(regressContrastPosition)
## Correlation significant (0.0341)

# Ancestral State Reconstructuon
fit = fastAnc(avg_Tree, trochanter_position, vars = TRUE, CI = TRUE)
# old.par = par (mfrow=c(1,2))
# Plotting Phenogram
phenogram(avg_Tree, trochanter_position, fize = 0.6, spread.costs=c(1,0),link=0.2,offset=0)
# Plotting Contour Map
obj = contMap(avg_Tree, trochanter_position, type = "phylogram", legend = 0.7*max(nodeHeights(avg_Tree)), plot = TRUE)
obj = setMap(obj,colors=c("blue","cyan","green","yellow","red"))
plot(obj)
# Plotting Side-by-Side
# par(old.par)
## Trait of a distinctive fourth trochanter first appears on the branch leading up to Heterodontosaurus among the Ornithischians, and independently in Herrerasaurus and the branch leading up to Neotheropoda (Dilophosaurus) in the Saurischians
