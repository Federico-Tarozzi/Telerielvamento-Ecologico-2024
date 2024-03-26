# SPECTRAL INDICES

library(terra)
library(imageRy)

# List of data avialable in imageRy
im.list()

# im.import(), immagine lensat 5
im.import("matogrosso_l5_1992219_lrg.jpg") 

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
