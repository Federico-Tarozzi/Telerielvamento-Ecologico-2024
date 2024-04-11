# second method to quantify changes in time
# the first method we use was classification 

library(imageRy)
library(terra)

im.list()

# import the data
EN01 <- im.import("EN_01.png") # importiamo quello di gennaio
EN13 <- im.import("EN_13.png") # importimao quello di marzo

par(mfrow=c(2,1) )
im.plotRGB.auto(EN01) # con auto plotta le prime 3 bande in automatico dell'immagine RGB
im.plotRGB.auto(EN13)

# da febbraio a marzo decade la presenza di azoto sull'europa

# fare una differenza tra due layer di due bande diverse 
# ci indica dove c'è stato un cambiamento più inteso in termini di presenza di azoto tra la prima e la seconda immagine 

difEN = EN01[[1]] - EN13[[1]] # faccio la differenza, metto = perchè è una operazione, metto tra parentesi quadre la banda che volgio andare a sottrarre per ogni immagine

cl <- colorRampPalette(c("blue", "white", "red")) (100)
plot(difEN, col=cl)

# partendo da una immagine a 8 bit abbiamo una fascia da -255 a 255 e possiamo quantificare 

#-----------------------------------------------------------------------------------------------------------------------

# ice melt in greenland
# lavoriamo con un proxy del programma copernicus

# import images 16 bit oltre 65'000 pixcel 
# dati di temperatura della groenlandia 
# esistono formule online per andare a convertire i dati in bit in dati di temperatura in gradi. 
g2000 <- im.import("greenland.2000.tif")
g2005 <- im.import("greenland.2005.tif")
g2010 <- im.import("greenland.2010.tif")
g2015 <- im.import("greenland.2015.tif")

# create a colour palette
clg <- colorRampPalette(c("black", "blue", "white", "red")) (100)
plot(g2000, col=clg)

par(mfrow=c(1,2))
plot(g2000, col=clg)
plot(g2015, col=clg)

par(mfrow=c(2,2))
plot(g2000, col=clg)
plot(g2005, col=clg)
plot(g2010, col=clg)
plot(g2015, col=clg)

# stack 4 bande di una immagine 
greenland <- c(g2000, g2005, g2010, g2015)
plot(greenland, col=clg)

# differenza tra immagine 2000 e immagine 2015

difg= greenland[[1]] - greenland[[4]] # preso la prima e la quarta banda dello stack che ho precedentemente chiamato greenland. 
clinvert <- colorRampPalette(c("red", "white", "blue")) (100)
plot(difg, col=clinvert) # nell'entroterra i valori negativi indicano che la temperatura è aumentata



im.plotRGB(greenland, r=1, g=2, b=4) #g200o on red, g2005 on green, g2010 on blue







