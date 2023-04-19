## Script de Ejercicios desarrollado por Gener, Laura, Betsaida
## 19 de Abril 2023


### Instalando librerías
#install.packages("nycflights13")

library(nycflights13)
library(DataExplorer)


## Cargando datos
data_list <- list(airlines, airports, flights, planes, weather)
merge_airlines <- merge(flights, airlines, by = "carrier", all.x = TRUE)
merge_planes <- merge(merge_airlines, planes, by = "tailnum", all.x = TRUE, suffixes = c("_flights", "_planes"))
merge_airports_origin <- merge(merge_planes, airports, by.x = "origin", by.y = "faa", all.x = TRUE, suffixes = c("_carrier", "_origin"))
final_data <- merge(merge_airports_origin, airports, by.x = "dest", by.y = "faa", all.x = TRUE, suffixes = c("_origin", "_dest"))


#############################################################
#############################################################
## Evaluación de Calidad de los Datos
#############################################################
#############################################################
