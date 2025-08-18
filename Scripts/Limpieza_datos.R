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

# para este caso las uniremos con el id, llamandola "C"

C <- merge(Calificaciones1, Calificaciones2, by = "id", all = TRUE)

# Exploraremos los datos cargados y cruzados


head(C)

dim(C)

# Esta función lo que hace es mostrarme la información por filas

glimpse(C)



##Uso de Dplyr


head(C)

## Para esa linea, seleccionamos de la tabla "C", seleccionamos id y literatura 

select(C, id, Literatura)

## Un ejemplo no quiero agregar la columna de matematicas, tendremos unicamente la salida de las columnas sin la seleccionada "Matematica"

select(C, -Matematica)

## Filter

#Seleccionamos en matematicas los valores mayores a 4


filter(C, Matematica>4)

#En este filtro realizaremos el filtro de, personas que buena calificación en filosofia y superior a literatura

filter(C, Filosofia>Literatura)


#En esta linea ejecutaremos la misma base anterior, pero condicionaremos a que Filosofia sea mayor a 7


filter(C, Filosofia>Literatura & Filosofia >7)


# Exclusión de datos vacios

## Para nuestro ejemplo no tenemos datos vacios, pero podemos ingresar a la tabla del excel y ajustarlo
## debemos realizar el sihuiente codigo para excluir campos con valores vacios.


Sin_NA <- filter(C,!is.na(Matematica))

## Crear nueva tabla, en la cual vamos a agregar una nueva columna, para el caso del ejemplo haremos que 
## se adiciones una nueva columna en función a un promedio entre matematica y fisica ((matematica+fisica)/2) 

Comparacion <- mutate(Sin_NA, numeros = (Matematica+Fisica)/2)


##Adicionar una segunda columna, para este caso seria separado por coma una vez incluyamos un primer calculo


Comparacion <- mutate(Sin_NA, numeros = (Matematica+Fisica)/2, letras = (Literatura+Filosofia))


## Una nueva columna para validar nuevos campos, en este caondicionales y haremos:
## Si número es mayor que letras nos dara el mensaje "Numeros > Letras" en el caso contrario "Letras > Numeros"


nueva_col <- mutate(Comparacion, comp = ifelse(numeros>letras,"Numeros > letras", "Letras >Numeros"))



                      