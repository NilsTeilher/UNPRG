#================ CARGAR PAQUETES ================#
library(imputeTS)
library(mapdata)
library(fields)
library(maps)
library(graphics)
#================ UBICARSE EN LA CARPETA DE TRABAJO ================#
setwd("G:/Clorofila")
getwd()

#================ LEER LOS DATOS ================#
dat = read.table('Chla_Miraflores.csv',header = FALSE)
dim(dat)
class(dat)

dat=dat[,1]

dat
dim(dat)
class(dat)

#================ INTERPOLACION ================#

# Vector con fechas de la misma longitud que "dat"
fechas = seq(from = as.Date("2002-07-04"), length.out = length(dat), by = "days") 

#LINEAR
interp_linear = na.interpolation(x = dat, option = "linear")

#SPLINE
interp_spline = na.interpolation(x = dat, option = "spline")

#STINE 
interp_stine  = na.interpolation(x = dat, option = "stine")

# Rangos de las series interpoladas # De los 3 rangos elijes el valor menor y mayor para tu eje "Y"
range(interp_linear, na.rm = FALSE)
range(interp_spline, na.rm = FALSE)
range(interp_stine , na.rm = FALSE)

# PLOT DE LAS SERIES DE TIEMPO INTERPOLADAS Y DE LOS DATOS NO INTERPOLADOS
par(mfrow = c(3,1), mar = c(1.5, 2, 2,2)) #Divide el gráfico en 3 paneles (3 filas, 1 columna)
 
plot(fechas,interp_linear,type="l",xlab="time",ylab="chl",col="red",ylim=c(-1.72,61.38),main="linear")
#lines(fechas,dat,col="black")
points(fechas,dat,col="black")

plot(fechas,interp_spline,type="l",xlab="time",ylab="chl",col="blue",ylim=c(-1.72,61.38),main="spline")
#lines(fechas,dat,col="black")

points(fechas,dat,col="black")

plot(fechas,interp_stine,type="l",xlab="time",ylab="chl",col="green",ylim=c(-1.72,61.38),main="stine")
#lines(fechas,dat,col="black")
points(fechas,dat,col="black")
#================ END ================#
#=============START=================#
interp_linear <- rnorm(n = 5916, mean = 0)
interp_linear
interp_linear > 0 
sum(interp_linear > 0) 
length(which(interp_linear > 0))



