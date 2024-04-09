# parto da immagine satellitare
# classificare l'immagine
# estrapolare grafici statistici univariati per vedere la variazione di queste classi 

# quantifying land cover variability
# installare ggplot2
intsall.packages("ggplot2")

library(ggplot2)
library(terra)
library(imageRy)

# listing images
im.list()
# importing data

sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# classifichiamo sulla base dei 3 livelli energetici dell'immagine del sole. 
sunc <- im.classify(sun, num_clusters=3)

# importing data matogrosso
m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

# classifying images
# nel caso del matogross facciamo 2 classi, 1 per la foresta e 1 per il suolo nudo e acqua
# attenzione nominare le variavili aggiungendo una "c" per fare in modo che si capisca che sono le classificazioni
# richio, quello di sovrasrivere sulla precedente variabile già definita!

m1992c <- im.classify(m1992, num_clusters=2)
# class 1 = human
# class 2 = forest

m2006c <- im.classify(m2006, num_clusters=2)
# class 1 = human
# class 2 = forest


# ora che abbiamo classificato le immagini, volgiamo calcolare il numero di pixcel (frequenza) delle diverse classi 1: foresta ; 2:human 
# prima plottiamo le immagini con le classi per assicurarci che le classi corrispondano in entrambe le immagini

plot(m1992c)
plot(m2006c)

# calculating frequencies
# calcolo pixcel per ogni classe
f1992 <- freq(m1992c)
f1992
# count rappresenta il numero di pixcel per la classe 1 e 2
# calcolare pixcel totali dell'immagine
tot1992 <- ncell(m1992c)
# calcolare la proporzione: numero di pixcel di una classe / il totale dei pixcel
prop1992 = f1992 / tot1992
# percentuale
perc1992 <- prop1992 * 100

# percentages: forest = 83%, human =17%


# faccio lo stesso procedimento anche per l'immagine del mato 2006
f2006 <- freq(m2006c)
f2006
# count rappresenta il numero di pixcel per la classe 1 e 2
# calcolare pixcel totali dell'immagine
tot2006 <- ncell(m2006c)
# calcolare la proporzione: numero di pixcel di una classe / il totale dei pixcel
prop2006 = f2006 / tot2006
# percentuale
perc2006 <- prop2006 * 100

# percentages: forest = 45%, human =55%


# Bulding a dataframe
# ovvero una tabella con i valori relativi ai diversi anni rispettivamente di forest e human
class <- c("forest","human")      # uso le virgolette perchè è testo!
y1992 <- c(83,17)
y2006 <- c(45,55)
tabout <- data.frame(class, y1992, y2006)
tabout

# plot with ggplo2 for y1992
ggplot(tabout, aes(x=class, y=y1992, colour=class)) + geom_bar(stat="identity", fill="white")

# mettiamo sulla x le calssi
# sulla y la percentuale dell'anno 1992
# "identity" per dire che volgiamo grafficare il dato come l'abbiamo 

# plot with ggplo2 for y2006
ggplot(tabout, aes(x=class, y=y2006, colour=class)) + geom_bar(stat="identity", fill="white")

p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white")
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white")

p1 + p2


# correcting for axes 
p1 <- ggplot(tabout, aes(x=class, y=y1992, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))
p2 <- ggplot(tabout, aes(x=class, y=y2006, color=class)) + geom_bar(stat="identity", fill="white") + ylim(c(0,100))

p1 + p2
