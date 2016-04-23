rm(list=ls())
raw_phylogeny = read.newick(text = "(((((((((((((((Tyrannosaurus,Tarbosaurus),Daspletosaurus),(Gorgosaurus,Albertosaurus)),Bistahieversor),(Compsognathus,Sinosauropteryx)),(((Giganotosaurus,Acrocanthosaurus),Allosaurus),(Sinraptor,Yangchuanosaurus))),((Suchomimus,Streptospondylus),Piatnitzkysaurus)),Sinosaurus),Ceratosaurus),Dilophosaurus),Liliensternus),(Herrarasaurus,Staurikosaurus)),Eoraptor),(((((((((((((((((((((((((Saurolophus_osborni,Saurolophus_angustirostris),Gryposaurus),(Edmontosaurus_regalis,Edmontosaurus_annectens)),Shantungosaurus),(Brachylophosaurus,Maiasaura)),(((((((Lambeosaurus_lambei,Lambeosaurus_magnicristatus),(Corythosaurus_casuarius,Corythosaurus_intermedius)),Hypacrosaurus_stebingeri),Hypacrosaurus_altispinus),Parasaurolophus),Olorotitan),Tsintaosaurus)),Bactrosaurus),Tethyshadros),Probactrosaurus),(Mantellisaurus,Iguanodon)),Ouranosaurus),Uteodon),Camptosaurus),(Dryosaurus,Dysalotosaurus)),Tenontosaurus),Zalmoxes),Parksosaurus),(Gasparinisaura,Talenkauen)),Thescelosaurus),Hypsilophodon),((((Montanoceratops,Leptoceratops),Protoceratops),(Psittacosaurus_neimongoliensis,Psittacosaurus_mongoliensis)),(Pachycephalosaurus,Prenocephale))),Othnielosaurus),Agilisaurus),Heterodontosaurus)))),Marasuchus);")
phylogeny = collapse.singles(raw_phylogeny)
plot.phylo(phylogeny, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin=T) # These settings are good for displaying this phylogeny - uncluttered text and clear, discernible branches. 
phylogeny$tip.label
data = read.table("occurrence__data.txt", sep = "\t", header = T)
taxa = data$TAXON
trochanter_position = data$FTP
body_mass = data$MASS
FAD = data$FAD
LAD = data$LAD
time_data = read.table("time_data.txt", row.names = 1, sep="\t", header = T)

scale_Tree = cal3TimePaleoPhy(phylogeny, time_data, sampRate = 0.192, brRate = 0.0755, extRate = 0.0755, dateTreatment = "minMax", ntrees=1) # sampling rate = 0.192, and birth and extinction rates calculated as average of 0.001 and 0.15 = 0.0755. Based on Starrfelt and Liow paper.
plot(scale_Tree, edge.width = 2, font = 4, cex = 0.53, label.offset = 0.5, no.margin = T)
