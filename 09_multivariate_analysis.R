# how to make multivariate analysis in R with remote sensing data

# carico i pacchetti necessari all'analisi
library(terra)
library(imageRy)
library(viridis)

im.list()

# importare le bande
b2 <- im.import("sentinel.dolomites.b2.tif") # blue
b3 <- im.import("sentinel.dolomites.b3.tif") # green
b4 <- im.import("sentinel.dolomites.b4.tif") # red
b8 <- im.import("sentinel.dolomites.b8.tif") # nir 

sentdo <- c(b2, b3, b4, b8)
sentdo

im.plotRGB(sentdo, r=4, g=3, b=2)
im.plotRGB(sentdo, r=3, g=4, b=2)

# vediamo il livello di correlazione tra le bande. misura la correlazione tra i dati (indice di pearsons, matrice di covarianza da -1 a 1)
pairs(sentdo) # c'è molta correlazione tra le 4 bande! o meglio tra 3 di 4 bande

# facciamo il calcolo della PCA su queste variabili.

# Uso la funzione im.pca (Principal Componets Analysis. La funzione im.pca mi permette di compattare i miai dati in una sola dimensione.

pcimage <- im.pca(sentdo)
tot <- sum(1570.12141,  605.95765,   55.87939,   30.32994) # somma dei vari range per ogni asse

# al'inizio prendo un campione per fare l'analisi

1570.12141*100/tot # mi indica la percentuale della variabilità, è la percentuale che ricoprono i Principal component, in questo caso della PC1
605.95765*100/tot # % della PC2 più bassa della PC1
55.87939*100/tot
# correlazione tra i principal components e le bande, es: PC1 è maggiormente correlata al rosso e al nir ( 58% e 53%)

plot(pcimage, col=viridis(100))
plot(pcimage, col=plasma(100))
plot(pcimage, col=magma(100))

# PC1 spiega il 70% del range
# PC2 spiega il 30% circa
# PC3 spiega ancora meno...

# con la funzione focal possaimo andare a caloclare auqlsiasi componente basandoci su un unico elemento
# da portare un sistema da diverse bande a una banda sola ovvero quella della analisi multivariata. 

# da un sistema quadridimensionale a uno monodimensionale contenuto dalla PC1 

