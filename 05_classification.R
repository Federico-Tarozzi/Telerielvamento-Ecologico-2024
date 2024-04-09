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

