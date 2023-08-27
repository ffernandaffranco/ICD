library(tidyverse)

# Nos quedamos solamente con los pasajeros de primera clase
filter(titanic, class == 'First')

# Podemos complejozar un poco más esta condición
# Condición 1 y condición 2
# Condición 1 o condición 2
# NO (condición 1)

# y = &
# o = |
# no = !

# Pasajeros masculinos de primera clase
filter(titanic, sex == 'male' & class == 'First')

# Pasajeros de primera y tercera clase
filter(titanic, class == 'First' | class == 'Third')

# Pasajeros de primera clase o que sean hombres
filter(titanic, class == 'First' | sex == 'male')

# Pasajeros de primera clase o que sean hombres o que tengan más de 38 años
filter(titanic, class == 'First' | sex == 'male' | age > 38)

# Pasajeros que no sean varones
filter(titanic, !sex == 'male')

# Pasajeros que no sean de primera
filter(titanic, !class == 'First')

# Pasajeros de segunda o tercera o que no hayan abordado en S
filter(titanic, !class == 'First' | !'Port.of.Embarkation' == 'S')

# Pasajeros varones, que sean de primera o tercera clase y que tengan más de 18 años
filter(titanic, sex == 'male' & !class == 'First' & age > 18)

# Ahora con el pipe
titanic %>%
  filter(sex == 'male') %>%
  filter(!class == 'First') %>%
  filter(age > 18)




