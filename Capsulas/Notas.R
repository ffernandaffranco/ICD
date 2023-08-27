#######################################

ggplot() # para arrancar

geom_point() # puntos

geom_bar() # barras

xlab() / ylab() # nombre de los ejes

labs(x = a, y = b) # lo mismo

#######################################

rename(data, 'nombre nuevo' = 'nombre viejo')

min(insurance$age, na.rm=TRUE) # min columna

max(insurance$age, na.rm=TRUE) # max columna

slice_min(insurance, order_by=age, n=5) # min + fila

slice_max() # max + fila

arrange(insurance, charges) # ordena por charges ascendente

arrange(insurance, desc(charges)) # ordena por charges descendente

arrange(data, variable1, variable2) # más variables

filter(data, condición) # filtra por condición, ignora NA

insurance_groupsex <- group_by(insurance, sex) # guarda un nuevo dataframe agrupado por sexo

summarise(insurance_groupsex, n()) # cuantas f y cuantas m?

unique(insurance$sex) # categorías

fct_infreq() # Ordena de mayor a menor las barras

mean() # saca el promedio de la columna

mutate() # añade o cambia una variable en el df
#######################################






