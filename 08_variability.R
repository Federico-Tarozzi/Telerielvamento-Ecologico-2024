
# mesuring spatial variability

library(imageRy)
library(terra)

install.packages("viridis")
library(viridis)


im.list()
sent <- im.import("sentinel.png")
im.plotRGB(sent, r=1, g=2, b=3) # suolo nudo è diventato celeste e vegetazione è rossa

# nir è banda 1 perchè abbiamo visto che riflette la vegetazione

#nir = band 1
#red = band 2
#green = band 3

im.plotRGB(sent, r=2, g=1, b=3)

# ne vogliamo calcolare la variabilità

# associamo a una variabile la banda 1 del nir al fine di utilizzarla per i nostri calcoli
nir <- sent[[1]]
plot(nir)

cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(nir, col=cl)
