##Hyperiid-Host Associations
setwd("~/Documents/0BIOL_Phylogenetics/phylobio_final_project")
ass = unique(read.table("Associations.csv", sep = '\t', header = T)[,c(1,2)])
amphipods = sort(as.vector(unique(ass$amphipod)))
hosts = sort(as.vector(unique(ass$host)))
library(reshape2)
assmatrix = dcast(ass, amphipod~host, length)
rownames(assmatrix) = assmatrix[,1]
heatmap(as.matrix(assmatrix[,2:94]), col=c("white", "orange"), Rowv=NA, Colv=NA)
library(igraph)

#prune the matrix according to amphipod spp available in 2013 phylogeny
treespp2013 = as.vector(read.table("Hurt2013spp.txt", sep = ",")[,1])
prunedmatrix = assmatrix[which(assmatrix$amphipod %in% treespp2013),]
prunedass = as.matrix(ass[which(ass$amphipod %in% treespp2013),])
heatmap(as.matrix(prunedmatrix[,2:94]), col=c("white", "orange"), Rowv=NA, Colv=NA)

#load the tree
library(ape)
library(phytools)
library(ggtree)
JC = read.nexus(file="output/host18S_bayesian1_run_1.tree")
plot(JC)
nodelabels()
JC = reroot(JC, 78)
plot(JC)
JC$tip.label = str_replace_all(JC$tip.label,'_',' ')
sharedspp = as.vector(prunedass[,2][which(prunedass[,2] %in% JC$tip.label)])

#prune the tree
nodatatipnames = JC$tip.label[which(!(JC$tip.label %in% sharedspp))]
nodatatips = c(1:length(JC$tip.label))[which(JC$tip.label %in% nodatatipnames)]
prunedtree = drop.tip(JC, nodatatips)
prunedtree$tip.label
plot(prunedtree)
ultram = chronos(prunedtree)
plot(ultram)

#reprune the matrix
library(stringr)
prunedass[,2] = as.matrix(str_replace_all(prunedass[,2],'conica','sp.'))
reprunedass = as.matrix(prunedass[which(prunedass[,2] %in% ultram$tip.label),])
reprunedass = reprunedass[match(ultram$tip.label, reprunedass[,2]),]
reprunedassmatrix = as.matrix(dcast(as.data.frame(reprunedass), amphipod~host, length))
xy = reprunedassmatrix
reprunedassmatrix = reprunedassmatrix[,2:16]
class(reprunedassmatrix) <- "numeric"
rownames(reprunedassmatrix) = dcast(as.data.frame(reprunedass), amphipod~host, length)[,1]
heatmap(reprunedassmatrix[,2:9], col=c("white", "orange"), Rowv=NA, Colv=NA)

#define association network
g <- graph_from_edgelist(as.matrix(ass))
g <- graph_from_edgelist(prunedass)
g <- graph_from_edgelist(as.matrix(reprunedass))

#group vertex color, label color, and vertex location by type
V(g)$color <- ifelse(V(g)$name %in% hosts, "lightblue", "red")
V(g)$label.color <- ifelse(V(g)$name %in% hosts, "blue", "darkred")
V(g)$types <- ifelse(V(g)$name %in% hosts, F, T)

#define layouts
Lo = layout_as_bipartite(g, types = V(g)$types, hgap = 15, vgap = 600)
Lc = layout_in_circle(g, order = c(V(g)[which(V(g)$name %in% amphipods)], V(g)[which(V(g)$name %in% hosts)]))

#Circle layout
c= tkplot(g, canvas.width = 700, canvas.height = 700, vertex.size = 2.8, layout=Lc, vertex.label.dist = 0.3, vertex.label.cex = 0.5)
tkplot.fit.to.screen(c, height = 500, width = 500)
tkplot.center(c)
#Bipartite layout
a = tkplot(g, canvas.width = 700, canvas.height = 700, vertex.size = 2.8, layout=Lo, vertex.label.dist = 0.3, vertex.label.cex = 0.5)
tkplot.rotate(a, degree = 90)
tkplot.fit.to.screen(a, height = 500, width = 500)
tkplot.center(a)

#plot phylogentic displays
ggtree(ultram, layout="circular") + geom_tiplab(aes(angle=angle), color='blue')
labeled = ultram
labeled$edge.length = labeled$edge.length * 10
dd = data.frame(taxa  = labeled$tip.label, amphipod = reprunedass[,1])
p = ggtree(labeled, layout="rectangular") + xlim(NA, 23)
p = p %<+% dd + geom_tiplab(aes(color=amphipod), show_guide = FALSE, size = 3.5) + geom_tippoint(aes(color=amphipod), alpha=0.25)
p+theme(legend.position="right") + guides(color=guide_legend(title="Amphipod", reverse=T)) 

yx = ggtree(ultram) + geom_tiplab(color='blue')
gheatmap(yx, reprunedassmatrix)
