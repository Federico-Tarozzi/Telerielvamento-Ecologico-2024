# installing new packages in R

#l'argomento da inserire sarà il pacchetto da installare tra VIRGOLETTE. Il pacchetto va ad essere preso dal cran

install.packages("terra")

# al fine di caricare pacchetti in R, se correttamente installati
library(terra)


# volgio installare imageRy da github, volgio quindi prima andare a installare devtools per poter andare ad
accedere alla funzione install.github

install.packages("devtools")

library(devtools)

# install the imageRy package from GitHub
devtools::install_github("ducciorocchini/imageRy")

library(imageRy)
