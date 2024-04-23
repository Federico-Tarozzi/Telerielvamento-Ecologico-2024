# importing data from external sources 

# usare libreria di rifeimento 
library(terra)
library(imageRy)

# usiamo la funzione per caricare i dati dalla nostra cartella del computer
# FUNZ: set warking directory
# andare a vedere percorso file: proprietà copio perscorso tra virgolette 
# NB: bisogna girare le slash cambiando da \ a / perchè windows da di base il percorso con backslash

setwd("C:/Users/chicc/OneDrive/Desktop/Università/MAGISTRALE - GEOGRAFIA E PROCESSI TERRITORIALI/SECONDO SEMESTRE/TELERILEVAMENTO ECOLOGICO/SCARICARE DATI PROVA")

# usiamo la funzione "rast" di terra (il pacchetto precedentemente richiamato) per creare degli Oggetti raster. 
# rast serve per caricare i dati 
# selezioniamo le proprietà dell'immagine -- copiamo il nome e lo inseriamo tra virgolette assegnadolo a una variabile che nominamo eclissi
# NB: le immagini non sono georeferenziate 

eclissi <- rast("eclissi.png")

eclissi # visualizzo le informazoni relative all'immagine

#plottiamo l'immagine con la funzione im.plotRGB()

im.plotRGB(eclissi, 1, 2, 3)
im.plotRGB(eclissi, 2, 3, 1) # possimao giocare con le visualizzazioni cambiando le bande
