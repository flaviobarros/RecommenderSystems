## Carregando os pacotes necessários
library(readr)

## Lendo o banco de dados
dados <- read_csv('A1Ratings.csv')

## Calculando as médias por coluna
sort(apply(dados[,-1], 2, function(x) mean(x, na.rm = T)), decreasing = T)

## Porcentagem de 4+ para cada filme
sort(apply(dados[,-1], 2, function(x) {sum(ifelse(x >= 4, T, F), na.rm = T)/length(x[complete.cases(x)])} ), decreasing = T)

## Contagem do número de ratings
sort(apply(dados[,-1], 2, function(x) {length(x[complete.cases(x)])} ), decreasing = T)

## Contando co-ocorrência com Star Wars IV
ocorrencias = apply(dados[,-1], 2, function(x) ifelse(is.na(x), F, T))

# Pegando a coluna 2 como referência do filme Star Wars IV
sort(apply(ocorrencias, 2, function(x) {sum(x&ocorrencias[,1])/sum(ocorrencias[,1])} ) ,decreasing = T)
  