# CÁPSULA 2C: Group_by y summarise
# Capítulo 5.6 del libro

library(tidyverse)

# Summarise colapsa un data frame en una fila
# Saca el promedio (mean) de todas las edades en una columna "prom_edad"
titanic %>%
  summarise(prom_edad = mean(age, na.rm = TRUE))

# Se pueden crear tantas columnas como se quiera
# Acá se usa n() que lo único que devuelve es la cantidad de filas del data frame pasado
titanic %>%
  summarise(prom_edad = mean(age, na.rm = TRUE),
            cant_pasajeros = n()
  )

# Group_by por sex (agrupa por sexo dentro del df) y se lo pasa al summarise
titanic %>%
  group_by(sex) %>%
  summarise(prom_edad = mean(age, na.rm = TRUE))

# Group_by por cant_pasajeros + summarise
titanic %>%
  group_by(sex) %>%
  summarise(cant_pasajeros = n(),
            prom_edad = mean(age, na.rm = TRUE))

# Se puede agrupar por más de un atributo. Agrupemos por sexo y clase.
# sex = {female, male}
# class = {First, Second, Third}
#
# group_by(sex, class) va a tomar primero 'female' y lo va a pasar por todas las clases.
# Recién ahí pasa a male, y lo pasa por todas las clases.

titanic %>%
  group_by(sex, class) %>%
  summarise(cant_pasajeros = n())

# Entonces, group_by(class, sex) pasa por 'First' y ambos sexos, 'Second' y ambos sexos...
titanic %>%
  group_by(class, sex) %>%
  summarise(cant_pasajeros = n())