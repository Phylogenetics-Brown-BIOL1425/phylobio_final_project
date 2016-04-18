##Hyperiid-Host Associations
library(stringr)
library(ape)
library(phytools)
library(ggtree)
library(reshape2)
library(igraph)
library(network)
library(dendextend)
library(picante)
library(paco)

setwd("~/Documents/0BIOL_Phylogenetics/phylobio_final_project")
ass = unique(read.table("Associations.csv", sep = '\t', header = T)[,c(1,2)])
amphipods = sort(as.vector(unique(ass$amphipod)))
hosts = sort(as.vector(unique(ass$host)))

assmatrix = dcast(ass, amphipod~host, length)
rownames(assmatrix) = assmatrix[,1]
heatmap(as.matrix(assmatrix[,2:94]), col=c("white", "orange"), Rowv=NA, Colv=NA)

#Load amphipod tree Maximum Likelihood
amphipodML = read.tree("Amphipods/RAxML/RAxML_bipartitions.amphipodsCOI_MSAML_boot100")
amphipodML = drop.tip(amphipodML, which(amphipodML$tip.label == "Cyathura_sp." | amphipodML$tip.label == "Idotea_sp."))
plot(amphipodML)
nodelabels()
amphipodML=reroot(amphipodML, 52)
plot(amphipodML)

#HOST TREE
hostree = read.nexus("FirstHostRound/output/host18S_bayesian2_run_1.tree")
hostree$tip.label

#Bayesian GTR+Gamma tree
# extreeBAYES = read.nexus("ExtendedHosts/output/host_ext_MSA_bayesian_run_1.tree")
# badtips = which(!(extreeBAYES$tip.label %in% hostree$tip.label))
# hostBayes = drop.tip(extreeBAYES, badtips)
# plot(hostBayes)
# nodelabels()
# hostBayes = reroot(hostBayes, 80)
# plot(hostBayes)
# TREE = hostBayes

#GTR+Gamma Maximum Likelihood
MLext = read.tree("ExtendedHosts/RAxML/RAxML_bipartitions.EXThostML_boot100")
badtips = which(!(MLext$tip.label %in% hostree$tip.label))
hostML = drop.tip(MLext, badtips)
plot(hostML)
nodelabels()
hostML = reroot(hostML, 85)
plot(hostML)
TREE = hostML

#replace _ with spaces in tipnames of both trees
TREE$tip.label = str_replace_all(TREE$tip.label,'_',' ')
amphipodML$tip.label = str_replace_all(amphipodML$tip.label,'_',' ')

#prune the matrix according to amphipod spp available in 2013 phylogeny
treespp2013 = amphipodML$tip.label
prunedmatrix = assmatrix[which(assmatrix$amphipod %in% treespp2013),]
prunedass = as.matrix(ass[which(ass$amphipod %in% treespp2013),])
prunedass[,2] = as.matrix(str_replace_all(prunedass[,2],'conica','sp.'))
heatmap(as.matrix(prunedmatrix[,2:94]), col=c("white", "orange"), Rowv=NA, Colv=NA)

#Get species shared with the hosts
sharedspp = as.vector(prunedass[,2][which(prunedass[,2] %in% TREE$tip.label)])

#prune the host tree with the shared species in association data and amphipod tree
nodatatipnames = TREE$tip.label[which(!(TREE$tip.label %in% sharedspp))]
nodatatips = c(1:length(TREE$tip.label))[which(TREE$tip.label %in% nodatatipnames)]
prunedtree = drop.tip(TREE, nodatatips)
prunedtree$tip.label
plot(prunedtree)
ultram = chronos(prunedtree)
plot(ultram)

#reprune the matrix
reprunedass = as.matrix(prunedass[which(prunedass[,2] %in% ultram$tip.label),])
reprunedass = reprunedass[match(ultram$tip.label, reprunedass[,2]),]
reprunedassmatrix = as.matrix(dcast(as.data.frame(reprunedass), amphipod~host, length))
reprunedassmatrix = reprunedassmatrix[,2:16]
class(reprunedassmatrix) <- "numeric"
rownames(reprunedassmatrix) = dcast(as.data.frame(reprunedass), amphipod~host, length)[,1]
heatmap(reprunedassmatrix[,2:9], col=c("white", "orange"), Rowv=NA, Colv=NA)

#prune the amphipod tree to match the species in reprunedmatrix
amphipodML = drop.tip(amphipodML, which(!(amphipodML$tip.label %in% rownames(reprunedassmatrix))))
ultramphipod = chronos(amphipodML)
plot(ultramphipod)

#define association network
g <- graph_from_edgelist(as.matrix(ass))
#g <- graph_from_edgelist(prunedass)
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

map = t(reprunedassmatrix)
#class(map) <- "string"
yx = ggtree(labeled) + geom_tiplab(color='black', size = 3) + geom_treescale(x=2008, y=1)
gheatmap(yx, map[,3:5], low="white", high="black", offset = 2, width=0.5)

#Try picante tools
prunedmatrix = prunedmatrix[,-1]
comm = t(prunedmatrix)
comm = comm[rowSums(comm)!=0,] 
heatmap(as.matrix(comm), Rowv=NA, Colv=NA, col = c("white","grey"))
amphi_dist=species.dist(comm)
heatmap(as.matrix(amphi_dist), Rowv=NA, Colv=NA, col=rev(heat.colors(5)))
plot(hclust(amphi_dist))
AD_MDS = cmdscale(amphi_dist)
par(mar=rep(4,4))
plot(AD_MDS[,1], AD_MDS[,2])
text(AD_MDS[,1], AD_MDS[,2], labels = row.names(AD_MDS), cex=.7)
Comdist = comdist(comm,amphi_dist)
heatmap(as.matrix(Comdist), Rowv=NA, Colv=NA, col=rev(heat.colors(20)))
par(mar=rep(1,4))
plot(hclust(Comdist))
C_MDS = cmdscale(Comdist)
plot(C_MDS[,1], C_MDS[,2], xlim = c(-0.25,0.2))
text(C_MDS[,1], C_MDS[,2], labels = row.names(C_MDS), cex=0.5, pos = 1)

CPC = comm.phylo.cor(comm,ultramphipod)
MPC = match.phylo.comm(ultramphipod, comm)
ultram = drop.tip(ultram, which(!(ultram$tip.label %in% rownames(comm))))
plot(ultram)
phyloDiversity = pd(comm,ultramphipod)

##Phylogenetic clustering
#prune the comm matrix
prunecomm = prune.sample(comm,ultramphipod)
prunecomm = comm[,which(colnames(comm) %in% ultramphipod$tip.label)]
#add the phylocom even and random rows
even = rep(0.5,ncol(prunecomm))
random = runif(ncol(prunecomm), 0,1)
prunecomm = rbind(rbind(prunecomm, even), random)
#Test for community phylogenetic clustering/overdispersion
mntd(prunecomm, cophenetic(ultramphipod))
mpd(prunecomm, cophenetic(ultramphipod))
ses.mntd(prunecomm, cophenetic(ultramphipod))
ses.mpd(prunecomm, cophenetic(ultramphipod))
PSClustering = psc(prunecomm, cophenetic(ultramphipod))
mean(PSClustering$PSCs[which(!is.na(PSClustering$PSCs))])
phylostruct(prunecomm, cophenetic(ultramphipod))

#Cophylogenies
reprunedass = as.data.frame(reprunedass)
rownames(reprunedass) = 1:nrow(reprunedass)
par(mfrow=c(1,1))
cophyloplot(ultramphipod, ultram, assoc = reprunedass, type="cladogram", space=90, gap=0,show.tip.label=T, use.edge.length=F)
cophy = cophylo(ultramphipod, ultram, assoc = reprunedass, rotate = F)
plot(cophy)
Parafit = parafit(as.matrix(cophenetic(ultram)),as.matrix(cophenetic(ultramphipod)), comm[which(rownames(comm) %in% ultram$tip.label),which(colnames(comm) %in% ultramphipod$tip.label)])
D = prepare_paco_data(cophenetic(ultram), cophenetic(ultramphipod), comm[which(rownames(comm) %in% ultram$tip.label),which(colnames(comm) %in% ultramphipod$tip.label)])
D = add_pcoord(D)
D = PACo(D, nperm=10, seed=42, method="r0", correction='cailliez')
print(D$gof)
