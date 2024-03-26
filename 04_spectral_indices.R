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

