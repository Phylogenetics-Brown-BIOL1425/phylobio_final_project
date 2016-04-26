rm(list=ls()) # Clears pre-existing variables
# Loading required packages for session:
library(ape)
library(picante)
library(paleotree)
library(phytools)

# Reading phylogeny of taxa of interest:
raw_phylogeny = read.newick(text = "(((((((((((((((Tyrannosaurus,Tarbosaurus),Daspletosaurus),(Gorgosaurus,Albertosaurus)),Bistahieversor),(Compsognathus,Sinosauropteryx)),(((Giganotosaurus,Acrocanthosaurus),Allosaurus),(Sinraptor,Yangchuanosaurus))),((Suchomimus,Streptospondylus),Piatnitzkysaurus)),Sinosaurus),Ceratosaurus),Dilophosaurus),Liliensternus),(Herrarasaurus,Staurikosaurus)),Eoraptor),(((((((((((((((((((((((((Saurolophus_osborni,Saurolophus_angustirostris),Gryposaurus),(Edmontosaurus_regalis,Edmontosaurus_annectens)),Shantungosaurus),(Brachylophosaurus,Maiasaura)),(((((((Lambeosaurus_lambei,Lambeosaurus_magnicristatus),(Corythosaurus_casuarius,Corythosaurus_intermedius)),Hypacrosaurus_stebingeri),Hypacrosaurus_altispinus),Parasaurolophus),Olorotitan),Tsintaosaurus)),Bactrosaurus),Tethyshadros),Probactrosaurus),(Mantellisaurus,Iguanodon)),Ouranosaurus),Uteodon),Camptosaurus),(Dryosaurus,Dysalotosaurus)),Tenontosaurus),Zalmoxes),Parksosaurus),(Gasparinisaura,Talenkauen)),Thescelosaurus),Hypsilophodon),((((Montanoceratops,Leptoceratops),Protoceratops),(Psittacosaurus_neimongoliensis,Psittacosaurus_mongoliensis)),(Pachycephalosaurus,Prenocephale))),Othnielosaurus),Agilisaurus),Heterodontosaurus)))),Marasuchus);")

# Drawing phylogeny with no specified branch lengths:
phylogeny = collapse.singles(raw_phylogeny)
plot.phylo(phylogeny, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin=T) # These settings are good for displaying this phylogeny - uncluttered text and clear branches. 

# Loading data for the taxa of interest:
data = read.table("occurrence__data.txt", sep = "\t", header = T)
time_data = read.table("time_data.txt", row.names = 1, sep="\t", header = T)

# Storing important variables
taxa = data$TAXON
trochanter_position = data$FTP
body_mass = data$MASS
FAD = data$FAD
LAD = data$LAD

# Function calculates branch lengths for the phylogeny, drawing on geologic occurrence data and randomized values for birth, extinction, and sampling rate. It can do this any number of times, and store each run's data as a separate column in a matrix of 134 rows (the number of edges on the tree)
tree_scaler = function(tree, occurrence, repetitions) {
  all_Lengths = matrix(, nrow = 134, ncol = repetitions)
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

# Testing for phylogenetic signal
Contrast_bodyMass = pic(body_mass, avg_Tree)
Contrast_Trochanter = pic(trochanter_position, avg_Tree)
phylosignal(trochanter_position, avg_Tree)

