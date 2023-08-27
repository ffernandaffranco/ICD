library(tidyverse)

# Filtramos los pasajeros de primera clase y guardamos en una nueva variable
titanic_first <- filter(titanic, class == 'First')

# De todos los pasajeros de primera clase devolver los dos que pagaron menos
# Filtramos los pasajeros de primera clase, ordenamos de menor a mayor por "fare"
# y nos quedamos con los dos primeros
titanic_first <- filter(titanic, class == 'First')
titanic_first1 <- arrange(titanic_first, fare)
head(titanic_first1, 2)

# Lo mismo, pero mejor con el pipe %>%
titanic %>%
  filter(class == 'First') %>%
  arrange(fare) %>%
  head(2)

# Para guardar el resultado en otro df
new_titanic <- titanic %>%
  filter(class == 'First') %>%
  arrange(fare) %>%
  head(2)








  