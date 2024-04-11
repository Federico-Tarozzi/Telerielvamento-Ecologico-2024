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
