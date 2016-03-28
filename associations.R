##Hyperiid-Host Associations
setwd("Documents/0BIOL_Phylogenetics/phylobio_final_project")
ass = unique(read.table("Associations.csv", sep = '\t', header = T)[,c(1,2)])
amphipods = sort(as.vector(unique(ass$amphipod)))
hosts = sort(as.vector(unique(ass$host)))
library(reshape2)
assmatrix = dcast(ass, amphipod~host, length)
rownames(assmatrix) = assmatrix[,1]

treespp2013 = as.vector(read.table("Hurt2013spp.txt", sep = ",")[,1])
prunedmatrix = assmatrix[which(assmatrix$amphipod %in% treespp2013),]
