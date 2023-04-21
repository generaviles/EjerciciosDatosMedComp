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

## Segmentando la base de datos para quedarnos con un subconjunto de práctica

#############################################################
#############################################################
## Evaluación de Calidad de los Datos
#############################################################
#############################################################
library(dlookr)
library(kableExtra)
library(dplyr)

## Usando DlookR
final_data %>%
  diagnose() %>%
  kbl() %>%
  kable_paper("hover", full_width = F)

######## Recategorización de variables ######

### MES ###
final_data %>%
  select(month) %>%
  as.vector() %>%
  as.factor() %>%
  recode_factor(1 = "Enero")
  head()


final_data$month <- as.factor(final_data$month)
levels(final_data$month) <- c("Enero",
                                 "Febrero",
                                 "Marzo",
                                 "Abril",
                                 "Mayo",
                                 "Junio",
                                 "Julio",
                                 "Agosto",
                                 "Septiembre",
                                 "Octubre",
                                 "Noviembre",
                                 "Diciembre")
str(final_data$month)

table(final_data$month)

## Tabla de conteo de mes.
final_data %>%
  select(month) %>%
  table() %>%
  kbl() %>%
  kable_paper("hover", full_width = F)

