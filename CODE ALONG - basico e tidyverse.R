# ------------------------------------------ #
# Esse script deve ser usado para ensinar SEM abrir
# o Rproj
#------------------------------------------- #


# Carregando os pacotes ----
library(palmerpenguins)
library(tidyverse)

# glimpse ----
glimpse(penguins)

# verbos básicos ----

mutate_simples <- mutate(penguins, 
       tamanho_nadadeira = 
         if_else(flipper_length_mm > 200, "longa", "curta"))

## inserindo o operador pipe ----

nadadeiras <- penguins |>
                ### nova variavel com base em condição ----
                mutate(tamanho_nadadeira = 
                         if_else(flipper_length_mm > 200, "longa", "curta")) |>
                ### filtramos para tamanhos que não são NA ----
                filter(!is.na(tamanho_nadadeira)) |>
                ### calculamos media e DP para grupos ----
                summarise(media_bico = mean(bill_length_mm),
                          desv_pad_bico = sd(bill_length_mm),
                          .by = tamanho_nadadeira)

# Path - onde estamos trabalhando?
getwd()

# vamos ler um arquivo simples
bivariate_norm <- read.csv(
  "/home/cesaragalvao/Documents/r-projects/curso_quarto_GYN/data/bivariate.csv"
)

head(bivariate_norm)
