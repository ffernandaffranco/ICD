# Parte 1: Preparación de los datos.

library(tidyverse)
df <- read_csv('/home/sunflower/Desktop/datadatadata/ICD/Data/insurance.csv')
view(df)

df_fumadores <- filter(df, sex == 'male' & smoker == 'yes')



# Parte 2: Limitaciones de las métricas de resumen y dot plot.

# Ejercicio 4
ggplot() +
  geom_point(df, mapping = aes(x = age, y = charges, colour = smoker)) +
  labs(title = 'Gastos médicos en función de la edad de los asegurados',
       x = 'Edad',
       y = 'Gastos médicos [USD]') +
  scale_colour_discrete(name = 'Fumador', labels = c('No', 'Sí'))

# Ejercicio 5
df_fumadores %>%
  ggplot(mapping = aes(x = charges)) +
  geom_jitter(aes(y = 2.0), width = 0) +
  geom_boxplot(aes(y = 3.0), fill = 'darksalmon') +
  geom_dotplot(aes(),
               binwidth = 2000,
               fill = 'salmon', colour = 'transparent',
               dotsize = 0.45) +
  scale_y_continuous(name = NULL, labels = NULL) +
  labs(title = 'Costo del seguro de salud',
       subtitle = 'Varones fumadores de EEUU',
       x = 'Gastos médicos [USD]') +
  theme(axis.title = element_text(size = 14))



# Parte 3: Histogramas.

# Ejercicio 7
df %>%
  ggplot(mapping = aes(x = charges)) +
  geom_jitter(aes(y = 2.0), width = 0) +
  geom_boxplot(aes(y = 3.0), fill = 'darksalmon') +
  geom_dotplot(aes(),
               binwidth = 2000,
               fill = 'salmon', colour = 'transparent',
               dotsize = 0.45) +
  scale_y_continuous(name = NULL, labels = NULL) +
  labs(title = 'Costo del seguro de salud',
       subtitle = 'Varones fumadores de EEUU',
       x = 'Gastos médicos [USD]') +
  theme(axis.title = element_text(size = 14))

# Ejercicio 8

df_fumadores %>%
  ggplot(mapping = aes(x = charges)) +
  geom_jitter(aes(y = 18.0), width = 0) +
  geom_boxplot(aes(x = charges, y = 20.0), fill = 'darksalmon') +
  geom_histogram(aes(),
               binwidth = 2000,
               fill = 'salmon', colour = 'transparent') +
  labs(title = 'Costo del seguro de salud',
       subtitle = 'Varones fumadores de EEUU',
       x = 'Gastos médicos [USD]',
       y = NULL) +
  theme(axis.title = element_text(size = 14))



# Parte 4: Densidades.

# Ejercicio 10

g <- ggplot(data = df) + stat_bin(aes(x = charges))
a <- ggplot_build(g)
datos <- a[1]$data[[1]]
datos$count

bw <- 2000
df_fumadores %>%
  ggplot() +
  geom_histogram(aes(x = charges),
                 binwidth = bw,
                 fill = 'cadetblue', colour = 'transparent') +
  stat_bin(aes(x = charges, y = ..count.., label = ..count..),
           binwidth = bw, geom = 'text', vjust = -.5) +
  labs(y = 'Cuentas', x = 'Costo del seguro [USD]')

# Ejercicio 11

bw <- 2000
df %>%
  filter(sex == 'male') %>%
  ggplot(aes(x = charges, fill = smoker)) +
  geom_histogram(binwidth = bw,
                 colour = 'transparent',
                 position = 'identity',
                 alpha = 0.5) +
  labs(y = 'Cuentas', x = 'Costo del seguro [USD]') +
  scale_fill_discrete(name = 'Fumador', labels = c('No', 'Sí'))

# Ejercicio 13

bw <- 2000
df %>%
  filter(sex == 'male') %>%
  ggplot(aes(x = charges, fill = smoker)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = bw,
                 colour = 'transparent',
                 position = 'identity',
                 alpha = 0.5) +
  labs(y = 'Cuentas', x = 'Costo del seguro [USD]') +
  scale_fill_discrete(name = 'Fumador', labels = c('No', 'Sí'))

# Ejercicio 14

bw <- 2000
df %>%
  filter(sex == 'male') %>%
  ggplot(aes(x = charges, fill = smoker)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = bw,
                 colour = 'transparent',
                 position = 'identity',
                 alpha = 0.6) +
  geom_density(aes(),
               colour = 'black',
               alpha = 0.3,
               fill = 'transparent') +
  labs(y = 'Cuentas', x = 'Costo del seguro [USD]') +
  scale_fill_discrete(name = 'Fumador', labels = c('No', 'Sí'))

# Ejercicio 15

df %>%
  filter(sex == 'male') %>%
  ggplot(aes(x = charges, fill = smoker)) +
  geom_histogram(aes(y = ..density..),
                 binwidth = bw,
                 colour = 'transparent',
                 position = 'identity',
                 alpha = 0.6) +
  geom_density(aes(),
               colour = 'black',
               alpha = 0.3,
               fill = 'transparent',
               bw = 1000) +
  labs(y = 'Cuentas', x = 'Costo del seguro [USD]') +
  scale_fill_discrete(name = 'Fumador', labels = c('No', 'Sí'))



# Parte 5: Comparaciones múltiples.

# Ejercicio 16

bw <- 2000
df %>%
  filter(sex == 'male') %>%
  ggplot(aes(x = charges)) +
  geom_histogram(aes(fill = region),
                 binwidth = bw,
                 position = 'identity',
                 alpha = 0.3) +
  labs(y = 'Cuentas', x = 'Costo del seguro [USD]') +
  geom_freqpoly(aes(colour = region),
                 binwidth = bw,
                 position = 'identity',
                 alpha = 0.9)

# Ejercicio 17 y 18

df %>%
  filter(sex == 'male') %>%
  ggplot() +
  geom_violin(aes(x = region, y = charges, colour = region),
              draw_quantiles = c(0.25, 0.5, 0.75)) +
  labs(x = 'Región',
       y = 'Costo del seguro [USD]',
       title = 'Costo del seguro por región',
       subtitle = 'Varones fumadores de EEUU') +
  scale_colour_discrete(name = 'Región')



# Parte 6. Más dimensiones

# Ejercicio 20
