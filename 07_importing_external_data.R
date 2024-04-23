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

# si possono fare cose...
dif <- eclissi[[1]] - eclissi[[2]] # in questo caso non ha molto senso perchè non ci sono bande particolarmente interessanti ma è per mostrare cosa si può fare
plot(dif)

# METODO PER SALVARE UNA QUALSIASI IMMAGINE E IMPORTARLA TRAMITE LA FUNZIONE RAST PER ANDARE A LAVORARCI

# importiamo un'altra immagine da https://earthobservatory.nasa.gov/
# mostro la cartella dalla quale prendo l'immagine attraverso setwd
# NB: ANCORA UN VOLTA QUANDO USO serwd PER RICHIAMARE LA CARTELLA DENTRO CUI è CONTENUTA L'IMMAGINE, DEVO INVERTIRE \ IN /

setwd("C:/Users/chicc/OneDrive/Desktop/Università/MAGISTRALE - GEOGRAFIA E PROCESSI TERRITORIALI/SECONDO SEMESTRE/TELERILEVAMENTO ECOLOGICO/SCARICARE DATI PROVA")

# assegno un nome alla funzione e utilizzo la funzione "rast" per importare l'immagine con il nome con la quale l'ho salvata

flood <- rast("prima floods.jpg")
# plotto il risultato
im.plotRGB(flood, 1, 2, 3)
#carico un'altra immagine 
flood2 <- rast("uralriver_flood_oli2_20240413_lrg.jpg")
# visualizzo entrambe le immagini con un par
par(mfrow=c(1,2))
plot(flood)
plot(flood2)

