# mesuring spatial variability

library(imageRy)
library(terra)

# vado a installare i pacchetto viridis: permette di fare visualizzazione comprensibili anche a persone affette da daltonismo 
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
# utilizzando il metodo Moving Window

# associamo a una variabile la banda 1 del nir al fine di utilizzarla per i nostri calcoli
nir <- sent[[1]]
plot(nir)

cl <- colorRampPalette(c("red", "orange", "yellow")) (100)
plot(nir, col=cl)

# funzione focal() ci permette di estrapolare i valori focali: statistiche all'interno di un gruppo di valori, nel nostro caso la dev_stand
# usiamo una matrice:definiamo il numero di pixcel della matrice 3X3
# esprimiamo poi la funzione che ci interessa, in questo caso fun=sd - variabilità con la standard deviation
# NB: non chiamare la funzione sd per non fare confusione tra variabili e funzioni
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

# cambiamo la palette di colore della visualizzazione con viridis in modo da utilizzare dei colori visibili anche da persone affette da daltonismo

