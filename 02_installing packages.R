# installing new packages in R

# l'argomento da inserire sarà il pacchetto da installare tra VIRGOLETTE. Il pacchetto in questo modo viene preso dal cran
install.packages("terra")

# Se correttamente installati, la funzione library() permette di caricare i pacchetti. 
library(terra)


# volgio installare imageRy da github. Pertanto, devo prima andare a installare devtools per accedere alla funzione install.github
install.packages("devtools")

library(devtools)

# install the imageRy package from GitHub
devtools::install_github("ducciorocchini/imageRy")

#or simply
install_github("ducciorocchini/imageRy")

# richiamo il pacchetto installato
library(imageRy)
