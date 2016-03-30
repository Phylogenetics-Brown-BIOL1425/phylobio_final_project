##Hyperiid-Host Associations
setwd("~/Documents/0BIOL_Phylogenetics/phylobio_final_project")
ass = unique(read.table("Associations.csv", sep = '\t', header = T)[,c(1,2)])
amphipods = sort(as.vector(unique(ass$amphipod)))
hosts = sort(as.vector(unique(ass$host)))
library(reshape2)
assmatrix = dcast(ass, amphipod~host, length)
rownames(assmatrix) = assmatrix[,1]
heatmap(as.matrix(assmatrix[,2:94]), col=c("white", "orange"), Rowv=NA, Colv=NA)
#matplot(assmatrix[,2:94], type="c", lty=1, lwd=1, pch=c(16,19))
library(igraph)


treespp2013 = as.vector(read.table("Hurt2013spp.txt", sep = ",")[,1])
prunedmatrix = assmatrix[which(assmatrix$amphipod %in% treespp2013),]
prunedass = as.matrix(ass[which(ass$amphipod %in% treespp2013),])
heatmap(as.matrix(prunedmatrix[,2:94]), col=c("white", "orange"), Rowv=NA, Colv=NA)

g <- graph_from_edgelist(prunedass)
g <- graph_from_edgelist(as.matrix(ass))
V(g)$color <- ifelse(V(g)$name %in% hosts, "lightblue", "red")
V(g)$label.color <- ifelse(V(g)$name %in% hosts, "blue", "darkred")
V(g)$types <- ifelse(V(g)$name %in% hosts, T, F)
Lo = layout_as_bipartite(g, types = V(g)$types, hgap = 10, vgap = 600)
Lc = layout_in_circle(g, order = c(V(g)[which(V(g)$name %in% amphipods)], V(g)[which(V(g)$name %in% hosts)]))
tkplot(g, canvas.width = 400, canvas.height = 400, vertex.size = 2.8, layout=Lc, vertex.label.dist = 1)

a = tkplot(g, canvas.width = 1200, canvas.height = 900, vertex.size = 2.8, layout=Lo, vertex.label.dist = 1)
tkplot.rotate(a, degree = 90)
tkplot.fit.to.screen(a, height = 500, width = 500)
tkplot.center(a)



