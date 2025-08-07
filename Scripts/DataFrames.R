## Data frames - Limpieza de datos

nombres <- c("Juan", "María") 
edades <- c(14, 15)
aprobado <- c(TRUE, FALSE)

# Se convierte en texto
X <- cbind(nombres, edades, aprobado)

## Respeta el tipo de carácter ingresado
df <- data.frame(nombres, edades, aprobado)

## Descripción de los datos
summary(df)

## Citar columnas
df$nombres

####
#### Accediendo a datos, datos por defecto de R

## Consulta de datos específica
head(iris)
head(trees)

# Consulta de listados de datos
data()

## Trabajaremos con la base de datos infert
Y <- infert

## Columna age
Y$age

# Selecciona los valores de la columna 2
Y[, 2]

# Selecciona los valores de la fila 1
Y[1, ]

# Selecciona los valores de la fila 1 y columna 2
Y[1, 2]

## Crear nueva variable filtrada: toma los valores de la fila 1 a la 5 y de la columna 1 a la 3
y <- Y[1:5, 1:3]

# Selecciona las columnas "parity" y "case"
Y[, c("parity", "case")]

## Crea una variable independiente llamada "case"
case <- Y$case

# 
attach(Y)

# Filtra por case con la función
case

######
###### 
# Agregar filas y columnas 
######
######

# En este ejemplo se trabajará con la base de datos del sistema "women"
head(women)

# La guardamos en la variable W
W <- women

## 1 libra = 0.454 kg
## 1 pulgada = 0.0254 m

# Se calcula el valor de la altura en metros y el valor del peso en kilogramos
alturamts <- W$height * 0.0254
PesoKG <- W$weight * 0.454

# cbind: "c" de "columns"
# Adicionamos las dos columnas creadas a la variable W 
W <- cbind(W, alturamts, PesoKG)

# Crear una nueva fila
fila <- c(35, 56, 123, 123)

# rbind agrega filas; se podría, en modo ejemplo, describir como "r" de "row"
W <- rbind(W, fila)

# Quitar filas
W <- W[-c(16), ]

## IMC 
## Peso / altura^2

# Se crea el IMC
imc <- (W$PesoKG / (W$alturamts)^2)

# Para este caso se agrega la columna IMC a W, en el DataFrame W
W <- cbind(W, imc)

colnames(W)

# Se quitan las columnas 1, 2 y 5
W <- W[, c(1, 2, 5)]

######
###### 
# Ordenando y filtrando datos 
######
######


head(iris)

# Selección de columna 1 y 2
I <- iris[, c(1, 2)]

## Selección de orden
i <- order(I$Sepal.Length)

# En esta línea se aplica el orden 
I2 <- I[i, ]

# Creación de orden por orden indicado de columnas
ii <- order(I$Sepal.Length, I$Sepal.Width)

# Aplicación de nuevo orden
I3 <- I[ii, ]


# Filtrando DataFrames

# Subconjunto dado por condiciones: filtración de peso entre 60 kg y 70 kg, lógica proporcional
subset(W, PesoKG > 60 & PesoKG < 70)

# Operador O: el peso es mayor de 60 kg o la altura es menor de 1.70 m
subset(W, PesoKG > 60 | alturamts < 1.70)

# Se realiza subset con referencia a las columnas que quiero mostrar
subset(W, PesoKG > 60 | alturamts < 1.70, select = c(alturamts, imc))
