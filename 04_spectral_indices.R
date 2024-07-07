# SPECTRAL INDICES

# carico i pacchetti 
library(terra)
library(imageRy)

# List of data avialable in imageRy
im.list()

# im.import(), immagine lensat 5
m1992<-im.import("matogrosso_l5_1992219_lrg.jpg") 

# band 1 = nir(infrarosso) = R
# band 2 = red = G
# band 3 = green = B

#plotting the data
# foresta pluviale nel 1992
im.plotRGB(m1992, r=1, g=2, b=3)

#nir on green
im.plotRGB(m1992, 2, 1, 3)

# nir on blue
# mostra giallo il blue quindi dove l'uomo ha costruito
im.plotRGB(m1992, 2, 3, 1)


# import neew image of matogrosso in 2006 to highlite the difference between the two images
m2006<-im.import( "matogrosso_ast_2006209_lrg.jpg")


# faccio un par multiframe con 1 riga e 2 colonne
par(mfrow=c(1,2))
im.plotRGB(m1992, 1, 2, 3)
im.plotRGB(m2006, 1, 2, 3)

# vegetazione verde e rosa diventa la terra nuda 
# nir ontop of green
im.plotRGB(m2006, 2,1,3)

# nir ontop of blue
im.plotRGB(m2006, 2,3,1)

# facciamo un mega par con tutte e 6 le immagini trovate, su 2 righe e 3 colonne 
# multiframe
par(mfrow=c(2,3))
im.plotRGB(m1992, 1, 2, 3) # nir on R 1992
im.plotRGB(m1992, 2, 1, 3) # nir on G 1992
im.plotRGB(m1992, 2, 3, 1) # nir on B 1992
im.plotRGB(m2006, 1, 2, 3) # nir on R 2006
im.plotRGB(m2006, 2, 1, 3) # nir on G 2006
im.plotRGB(m2006, 2, 3, 1) # nir on B 2006

# ---

# Calculating the DVI _difference vegetation index_

# Se metto uguale (=) in R è perché sto facendo una vera e propria operazione matematica 
# faccio la differenza del pixcel a infra - il pixcel a rosso = pixcel DVI
# valore massimo di DVI=255 ___ valore minimo di DVI=-255
# è in funzione di 2^8 ovvero 256 pixcel --> è DUNQUE STRETTAMENTE LEGATA ALLA RISOLUZIONE IN BIT DELL'IMMAGINE. 
# [[1]] mi serve per richiamare il primo elemento dell'immagine satellitare precedentemente dichiarata, che in questo caso è l'infrarosso (vedi sopra)

dvi1992 = m1992[[1]] - m1992[[2]]

# Plotting the DVI
cl <- colorRampPalette(c("darkblue", "yellow", "red", "black")) (100)

#vado a plottare usando la colore palette che ho appena creato 
plot(dvi1992, col=cl)


# same think with 2006
m2006<-im.import("matogrosso_ast_2006209_lrg.jpg")

# DVI del 2006
dvi2006= m2006[[1]] - m2006[[2]]
plot(dvi2006, col=cl)

# exercice: plot the dvi1992 beside the dvi2006
par(mfrow=c(1,2))
plot(dvi1992, col=cl)
plot(dvi2006, col=cl)


# NDVI -- NORMALIZED VEGETATION INDEX
# prendo il dvi al numeratore e al denominatore ci metto la somma tra la banda niv e red della rispettiva immagine 
# è come scrivere ES: ndvi1992 =  m1992[[1]] - m1992[[2]] / (m1992[[1]] + m1992[[2]])
ndvi1992 = dvi1992 / (m1992[[1]] + m1992[[2]])
ndvi2006 = dvi2006 / (m2006[[1]] + m2006[[2]])

dev.off()

# faccio un par per mostrare affiancati i risultati ottenuti 
par(mfrow=c(1,2))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)


# velocizzare il calcolo. 
#funzione di imaginaRy--> ti permette di fare questo calcolo automatizzando l'NDVI, nome dell'immagine e le bande che rappresentano "nir" e "red"
ndvi2006a <- im.ndvi(m2006, 1, 2)
plot(ndvi2006a, col=cl)
