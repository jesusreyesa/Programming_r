# Iniciaremos con las librerias necesarias para este escenario, las dejare en comentario en caso de no tenerlas instaladas

#install.packages(dplyr)
#install.packages(tidyr)
#install.packages(readxl)

#En esta linea llamamos las librerias descargadas o que tengamos en nuestra biblioteca por defecto

library(dplyr)
library(tidyr)
library(readxl)


#En este caso importamos calificaciones 1 y calificaciones 2con el fin de tener los datos en R.

Calificaciones1 <- read_excel("Datos/Calificaciones1.xlsx", 
                              col_types = c("numeric", "numeric", "numeric"))
View(Calificaciones1)



Calificaciones2 <- read_excel("Datos/Calificaciones2.xlsx", 
                              col_types = c("numeric", "numeric", "numeric"))
View(Calificaciones2)


## Union de bases de datos

# poara este caso las uniremos con el id, llamandola "C"

C <- merge(Calificaciones1, Calificaciones2, by = "id", all = TRUE)

# Exploraremos los datos cargados y cruzados


head(C)

dim(C)



