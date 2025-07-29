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

#Selecciono las columnas "Parity" y "case"

Y[,c("parity","case")]

## Crea una variable independiente llamada "case"
case<- Y$case

#
attach(Y)
#filtra por case con la función
case

######
######
#Agregr filas y columnas
######
######

# En este ejemplo se trabajara con la base de datos del sistemaa "women"

head(women)

#La guardamos en la variable W
W<- women

## 1 libra= 0.454 kg
## 1 pulgada = 0.0254 mts

# Se calcula el valopr de la altura en cms y el valor del peso en kgs
alturamts <- W$height*0.0254
PesoKG <- W$weight*0.454

#cbind  , c de "columns"
#adicionamos las dos columnas creadas a la variable W 

W<- cbind(W, alturamts, PesoKG)

#crear una nueva fila
fila <- c(35,56,123,123)


# rbind agrega filas, se podria en modo ejemplo describir como "r de row"
rbind(W, fila)



