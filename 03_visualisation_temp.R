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

