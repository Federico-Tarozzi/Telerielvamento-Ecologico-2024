# Satellite data visualization in R by imageRy

# richaimo i pacchetti che mi interessano, in questo caso library(imageRy) e library(terra)

library(imageRy)
library(terra)

# List of data avaiable in imageRy
im.list()

# Import data
im.import("matogrosso_ast_2006209_lrg.jpg")

# associo la funzione a una variabile che chiamo "mato"
mato<-im.import("matogrosso_ast_2006209_lrg.jpg")




library(imageRy)
library(terra)
# in case you have not terra
# install.packages("terra")

# list the data
im.list()

b2 <- im.import("sentinel.dolomites.b2.tif") 

cl <- colorRampPalette(c("black", "grey", "light grey")) (100)
plot(b2, col=cl)

# import the green band from Sentinel-2 (band 3)
b3 <- im.import("sentinel.dolomites.b3.tif") 
plot(b3, col=cl)

# import the red band from Sentinel-2 (band 4)
b4 <- im.import("sentinel.dolomites.b4.tif") 
plot(b4, col=cl)

# import the NIR band from Sentinel-2 (band 8)
b8 <- im.import("sentinel.dolomites.b8.tif") 
plot(b8, col=cl)

# multiframe
par(mfrow=c(2,2))
plot(b2, col=cl)
plot(b3, col=cl)
plot(b4, col=cl)
plot(b8, col=cl)

# stack images
# mettere insime le bande in un unico stack, questo rappresenta un modo alternativo per creare un multiframe. 
stacksent <- c(b2, b3, b4, b8)
dev.off() # it closes devices
plot(stacksent, col=cl)

# RGB plotting
# vado a richiamare gli elementi dello stack per avere le mie bande: rispettivamente 1-2-3-4, blu, verde, rosso e vicino infrarosso
# band2 blue element b1, stacksent[[1]] 
# band3 green element b2, stacksent[[2]]
# band4 red element b3, stacksent[[3]]
# band8 nir element b8, stacksent[[4]]

#im.plotRGB(stacksent, r=3, g=2, b=1)
# 321 visualizzo a colori naturali 
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 2, 1)
# 432 chiamato anche falso colore, si visualizza il vicino infrarosso come rosso. 
im.plotRGB(stacksent, 4, 3, 2)

# multiframe
# aggiungiamo due 1 righa e 2 colonne per visualizzare le due immagini prodotte, a sinistra colori naturali, a destra con il vicino infrarosso
# a seguire la funzione par aggiungiamo le due immagini che volgiamo visualizzare
par(mfrow=c( 1, 2))
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 3, 1)

# nir on green 342
# ora visualizzo come verde l'infrarosso. vegetazione è verde fluo. 
im.plotRGB(stacksent, 3, 4, 2)

#nir on blue 324
#ora visualizzo come blu l'infrarosso. 
im.plotRGB(stacksent, 3, 2, 4)


#final multiframe, final par
par(mfrow=c(2,2))
im.plotRGB(stacksent, 3, 2, 1)
im.plotRGB(stacksent, 4, 3, 1)
im.plotRGB(stacksent, 3, 4, 2)
im.plotRGB(stacksent, 3, 2, 4)

# mi crea un grafico di correlazione tra le bande
pairs(stacksent)
# le bande del visibile sono ampiamente correlate tra loro, mentre il vicino infrarosso meno

