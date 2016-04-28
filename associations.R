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
library(ade4)
library(bipartite)

setwd("~/Documents/0BIOL_Phylogenetics/phylobio_final_project")
ass = unique(read.table("Associations.csv", sep = '\t', header = T)[,c(1,2)])
amphipods = sort(as.vector(unique(ass$amphipod)))
hosts = sort(as.vector(unique(ass$host)))

assmatrix = dcast(ass, amphipod~host, length)
rownames(assmatrix) = assmatrix[,1]
heatmap(as.matrix(assmatrix[,2:94]), col=c("white", "orange"), Rowv=NA, Colv=NA)

#Load amphipod tree Maximum Likelihood, Hyperietta species constrained
amphipodML = read.tree("Amphipods/Interesting\ amphipods/RAxML/OI_constrained/RAxML_bipartitions.datamphipodOI18S_ML_constrained")
plot(amphipodML)
amphipodML$tip.label[which(amphipodML$tip.label == "Phronima_species")] = "Phronima_sedentaria"
amphipodML$tip.label[which(amphipodML$tip.label == "Paraphronima_species")] = "Paraphronima_gracilis"
amphipodML = drop.tip(amphipodML, which(amphipodML$tip.label == "Lestrigonus_bengalensis"))
plot(amphipodML)
nodelabels()
amphipodML=reroot(amphipodML, 76)
plot(amphipodML)

#Load amphipod tree Bayesian
# amphipodB = read.nexus("Amphipods/Interesting\ amphipods/output/OI/datamphipodOI18S_MSA_bayesian_run_1.tree")
# plot(amphipodB)
# amphipodB$tip.label[which(amphipodB$tip.label == "Phronima_species")] = "Phronima_sedentaria"
# amphipodB$tip.label[which(amphipodB$tip.label == "Paraphronima_species")] = "Paraphronima_gracilis"
# amphipodB = drop.tip(amphipodB, which(amphipodB$tip.label == "Lestrigonus_bengalensis"))
# plot(amphipodB)
# nodelabels()
# amphipodB=reroot(amphipodB, 62)
# plot(amphipodB)

#Bayesian GTR+Gamma tree
# extreeBAYES = read.nexus("ExtendedHosts/output/host_ext_MSA_bayesian_run_1.tree")
# badtips = which(!(extreeBAYES$tip.label %in% hostree$tip.label))
# hostBayes = drop.tip(extreeBAYES, badtips)
# plot(hostBayes)
# nodelabels()
# hostBayes = reroot(hostBayes, 80)
# plot(hostBayes)
# TREE = hostBayes

#GTR+Gamma Maximum Likelihood tree for gelatinous hosts
MLext = read.tree("ExtendedHosts/RAxML/RAxML_bipartitions.host_ext2_ML_boot100")
plot(MLext)
nodelabels()
MLext = reroot(MLext, 80)
plot(MLext)
MLext$tip.label[which(MLext$tip.label == "Bolinopsis_sp.")] = "Bolinopsis_vitrea"
MLext$tip.label[which(MLext$tip.label == "Cavolinia_sp.")] = "Cavolinia_longirostris"
MLext$tip.label[which(MLext$tip.label == "Solmissus sp.")] = "Solmissus_incissa"
TREE = MLext
plot(TREE)

#replace _ with spaces in tipnames of both trees
TREE$tip.label = str_replace_all(TREE$tip.label,'_',' ')
#amphipodML$tip.label = str_replace_all(amphipodML$tip.label,'_',' ')
amphipodML$tip.label = str_replace_all(amphipodML$tip.label,'_',' ')
TREE$tip.label
amphipodML$tip.label

#prune the matrix according to amphipod spp available in phylogeny
amphispp = amphipodML$tip.label
prunedmatrix = assmatrix[which(assmatrix$amphipod %in% amphispp),]
prunedass = as.matrix(ass[which(ass$amphipod %in% amphispp),])
prunedass[,2] = as.matrix(str_replace_all(prunedass[,2],'conica','sp.'))
heatmap(as.matrix(prunedmatrix[,2:ncol(prunedmatrix)]), col=c("white", "orange"), Rowv=NA, Colv=NA)

#Get species shared with the hosts
sharedspp = as.vector(prunedass[,2][which(prunedass[,2] %in% TREE$tip.label)])

#prune the host tree with the shared species in association data and amphipod tree
nodatatipnames = TREE$tip.label[which(!(TREE$tip.label %in% unique(sharedspp)))]
nodatatips = which(TREE$tip.label %in% nodatatipnames)
prunedtree = drop.tip(TREE, nodatatips)
prunedtree$tip.label
plot(prunedtree)
ultram = chronos(prunedtree)
plot(ultram)

#reprune the matrix
reprunedass = as.matrix(prunedass[which(prunedass[,2] %in% ultram$tip.label),])
#reprunedass = reprunedass[match(ultram$tip.label, reprunedass[,2]),]
reprunedassmatrix = as.matrix(dcast(as.data.frame(reprunedass), amphipod~host, length))
reprunedassmatrix = reprunedassmatrix[,2:ncol(reprunedassmatrix)]
#write.table(reprunedassmatrix, "reprunedassmatrix.txt", sep='\t')
class(reprunedassmatrix) <- "numeric"
rownames(reprunedassmatrix) = dcast(as.data.frame(reprunedass), amphipod~host, length)[,1]
heatmap(reprunedassmatrix[,2:ncol(reprunedassmatrix)], col=c("white", "orange"), Rowv=NA, Colv=NA)

#prune the amphipod tree to match the species in reprunedmatrix
prunedamphipodML = drop.tip(amphipodML, which(!(amphipodML$tip.label %in% rownames(reprunedassmatrix))))
ultramphipod = chronos(prunedamphipodML)
plot(ultramphipod)
reprunedassmatrix = reprunedassmatrix[match(ultramphipod$tip.label, rownames(reprunedassmatrix)),]

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

#Try picante tools
prunedmatrix_nosppcol = prunedmatrix[,-1]
comm = t(prunedmatrix_nosppcol)
comm = comm[rowSums(comm)!=0,] 
#write.table(comm, "comm.txt", sep='\t')
par(mar=rep(5,4))
heatmap(as.matrix(comm), Rowv=NA, Colv=NA, col = c("white","grey"))
amphi_dist=species.dist(comm)
heatmap(as.matrix(amphi_dist), Rowv=NA, Colv=NA, col=rev(heat.colors(5)))
plot(hclust(amphi_dist))
AD_MDS = cmdscale(amphi_dist)
plot(AD_MDS[,1], AD_MDS[,2])
text(AD_MDS[,1], AD_MDS[,2], labels = row.names(AD_MDS), cex=.7)
Comdist = comdist(comm,amphi_dist)
heatmap(as.matrix(Comdist), Rowv=NA, Colv=NA, col=rev(heat.colors(8)))
par(mar=rep(1,4))
plot(hclust(Comdist))
C_MDS = cmdscale(Comdist)
plot(C_MDS[,1], C_MDS[,2], xlim = c(-0.25,0.2))
text(C_MDS[,1], C_MDS[,2], labels = row.names(C_MDS), cex=0.5, pos = 1)

CPC = comm.phylo.cor(comm,ultramphipod)
MPC = match.phylo.comm(ultramphipod, comm)
#phyloDiversity = pd(comm,ultramphipod)

##Phylogenetic clustering
#prune the comm matrix
#prunecomm = prune.sample(comm,ultramphipod)
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
mean(PSClustering$PSCs[which(!is.na(PSClustering$PSCs[1:(nrow(PSClustering)-2)]))])
par(mar=rep(5,4))
barplot(PSClustering$PSCs[which(!is.na(PSClustering$PSCs[1:(nrow(PSClustering)-2)]))], names.arg = rownames(PSClustering)[which(!is.na(PSClustering$PSCs[1:(nrow(PSClustering)-2)]))], col='magenta', las=3)
phylostruct(prunecomm, cophenetic(ultramphipod))

#Cophylogenies
reprunedass = as.data.frame(reprunedass)
#write.table(reprunedass, "reprunedass.txt", sep='\t')
rownames(reprunedass) = 1:nrow(reprunedass)
cophyloplot(ultramphipod, ultram, assoc = reprunedass, type="phylogram", space=110, gap=0,show.tip.label=T, use.edge.length=F, col="orange")
#cophyloplot(ultramphipod, ultram, assoc = reprunedass, type="phylogram", space=110, gap=0,show.tip.label=T, use.edge.length=F, col="orange", rotate = T)
#cophy = cophylo(ultramphipod, ultram, assoc = reprunedass, rotate = F)
#plot(cophy)

#Popularity of hosts, generalist/specialist amphipods
table(reprunedass[,2])
specificity = as.vector(table(reprunedass[,1]))
names(specificity) = names(table(reprunedass[,1]))
contMap(ultramphipod, specificity)
Kcalc(specificity, ultramphipod)

popularity = as.vector(table(reprunedass[,2]))
names(popularity) = names(table(reprunedass[,2]))
contMap(ultram, popularity)
Kcalc(popularity, ultram)

#sensitivity test with equal branchlengths
flatamphipod = ultramphipod
flatamphipod$edge.length = rep(1,length(flatamphipod$edge.length))
plot(flatamphipod)
contMap(flatamphipod, specificity)
Kcalc(specificity, flatamphipod)

flatam = ultram
flatam$edge.length = rep(1,length(flatam$edge.length))
contMap(flatam, popularity)
Kcalc(popularity, flatam)

Parafit = parafit(as.matrix(cophenetic(ultram)),as.matrix(cophenetic(ultramphipod)), t(reprunedassmatrix), correction = 'cailliez')
D = prepare_paco_data(cophenetic(ultram), cophenetic(ultramphipod), t(reprunedassmatrix))
D = add_pcoord(D)
D = PACo(D, nperm=100, seed=42, method="r0", correction='cailliez')
print(D$gof)
D
#that with flat branch lengths
parafit(as.matrix(cophenetic(flatam)),as.matrix(cophenetic(flatamphipod)), t(reprunedassmatrix), correction = 'cailliez')
D = prepare_paco_data(cophenetic(flatam), cophenetic(flatamphipod), t(reprunedassmatrix))
D = add_pcoord(D)
D = PACo(D, nperm=100, seed=42, method="r0", correction='cailliez')
print(D$gof)
D

#Which phylogeny has a stronger signal?
pdist_amphipods = as.dist(cophenetic(ultramphipod))
pdist_hosts = as.dist(cophenetic(ultram))

adist_amphipods = species.dist(t(reprunedassmatrix))
adist_hosts = species.dist(reprunedassmatrix)
mantel_amphi = mantel.rtest(pdist_amphipods, adist_amphipods, nrepet = 9999)
mantel_host = mantel.rtest(pdist_hosts, adist_hosts, nrepet = 9999)

mean(multiPhylosignal(t(reprunedassmatrix), ultram)[,1])
sd(multiPhylosignal(t(reprunedassmatrix), ultram)[,1])
mean(multiPhylosignal(reprunedassmatrix, ultramphipod)[,1])
sd(multiPhylosignal(reprunedassmatrix, ultramphipod)[,1])

mean(multiPhylosignal(t(reprunedassmatrix), flatam)[,1])
sd(multiPhylosignal(t(reprunedassmatrix), flatam)[,1])
mean(multiPhylosignal(reprunedassmatrix, flatamphipod)[,1])
sd(multiPhylosignal(reprunedassmatrix, flatamphipod)[,1])

hosthc = hclust(adist_hosts)
amphihc = hclust(adist_amphipods)

Bk_plot(as.dendrogram(ultram), hosthc)
Bk_plot(as.dendrogram(ultramphipod), amphihc)

#Network analysis
assnet = as.network(as.matrix(ass))
plot(assnet)
amphinet = as.network(melt(as.matrix(adist_amphipods))[which(melt(as.matrix(adist_amphipods))[,3] > 0.2),-3])
hostnet = as.network(melt(as.matrix(adist_hosts))[which(melt(as.matrix(adist_hosts))[,3] > 0.2),-3])
plot(amphinet)
plot(hostnet)
amphiALL = as.network(melt(as.matrix(adist_amphipods))[,-3])
hostALL = as.network(melt(as.matrix(adist_hosts))[,-3])

web = t(assmatrix[,-1])
discrepancy(web)
pdi = PDI(web) #paired differences index
pac = PAC(web) #potential for apparent competition
visweb(web)
togetherness(web) #T-score, level of similarity between species
grouplevel(web)
robustness(second.extinct(web))
C.score(web)
