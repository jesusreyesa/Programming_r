## data fraames - limpieza de datos

nombres <- c("Juan","Maria") 
edades <- c(14,15)
aprobado <- c(TRUE, FALSE)

# se convierte en texto
X <- cbind(nombres, edades, aprobado)


##respeta el tipo de caracter ingresado
df <- data.frame(nombres, edades, aprobado)

## Descripción de los datos
summary(df)

##citar columnas
df$nombres

####
#### Accediendo a datos, datos por defecto de R

##consulta de data especifica
head(iris)
head(trees)
#consulta de listados de datos
data()

##trabajaremos con la base de datos infert
Y <- infert

##Columna Age
Y$age

# Selecciona los valores de la columna 2
Y[,2]

#Selecciona los valores de la fila 1
Y[1,]

#Selecciona los vbalores de la fila 1 y columna 2
Y[1,2]

## crear nueva variable filtrada, toma los valores de la fila 1 a la 5 y de la columna 1 a la 3

y<- Y[1:5,1:3]



