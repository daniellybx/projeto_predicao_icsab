#importando dados de municipios

library(readxl) #carregando pacote de leitura excel
library(read.dbc) #carregando pacote de leitura dbc
library(tidyverse) #carregando pacote de manipulação de dados
library(readr) #carregando pacote de leitura csv
library(ggplot2) #carregando pacote de geração de gráficos
library(reshape2) #carregando pacote de manipulação de data.frames

## importando dados desagregados do atlas
atlas = read_csv("dados/atlas_brasil_2013.csv")
glimpse(atlas)

sort(unique(atlas$ANO)) # identificando anos dos dados

# filtrando dados de 2010
atlas_2010 = subset(atlas, atlas$ANO == 2010)

#selecionando variáveis que serão usadas na análise de agrupamentos

agru = data.frame(cbind(atlas_2010$Município, atlas_2010$UF, atlas_2010$Codmun6,
                        atlas_2010$GINI, atlas_2010$MULH0A4, atlas_2010$HOMEM0A4,
                        atlas_2010$MULH65A69, atlas_2010$MULH70A74, atlas_2010$MULH75A79,
                        atlas_2010$MULHER80,
                        atlas_2010$HOMEM65A69, atlas_2010$HOMEM70A74, atlas_2010$HOMEM75A79,
                        atlas_2010$IDHM, atlas_2010$POP))
colnames(agru) = c("mun", "uf", "geocod", "gini", "mulher0a4", "homem0a4",
                   "mulher65a69", "mulher70a74", "mulher75a79", "mulher80",
                   "homem65a69", "homem70a74", "homem75a79", "idhm", "pop")

#transformando variáveis em número
agru$gini = as.double(agru$gini)
agru$mulher0a4 = as.double(agru$mulher0a4)
agru$homem0a4 = as.double(agru$homem0a4)
agru$mulher65a69 = as.double(agru$mulher65a69)
agru$mulher70a74 = as.double(agru$mulher70a74)
agru$mulher75a79 = as.double(agru$mulher75a79)
agru$mulher80 = as.double(agru$mulher80)
agru$homem65a69 = as.double(agru$homem65a69)
agru$homem70a74 = as.double(agru$homem70a74)
agru$homem75a79 = as.double(agru$homem75a79)
agru$idhm = as.double(agru$idhm)
agru$pop = as.double(agru$pop)

#somando dados de menores de 5 e maiores de 60
agru$menores_5 = (agru$mulher0a4+agru$homem0a4)/agru$pop
agru$maiores_60 = rowSums(agru[,7:13])/agru$pop

#gerando medidas de posição dos dados
medidas = data.frame(cbind(c("gini", "idhm", "menores_5", "maiores_60"),
rbind(summary(agru$gini),
summary(agru$idhm),
summary(agru$menores_5),
summary(agru$maiores_60))))

#gerando boxplot para as variáveis usadas

## excluindo variáveis não utilizadas
agru2 = agru
agru2$mulher0a4 = NULL
agru2$homem0a4 = NULL
agru2$mulher65a69 = NULL
agru2$mulher70a74 = NULL
agru2$mulher75a79 = NULL
agru2$mulher80 = NULL
agru2$homem65a69 = NULL
agru2$homem70a74 = NULL
agru2$homem75a79 = NULL

## padronizando variáveis para geração de boxplot
agru2$gini_pad = scale(agru2$gini)
agru2$idhm_pad = scale(agru2$idhm)
agru2$menores_5_pad = scale(agru2$menores_5)
agru2$maiores_60_pad = scale(agru2$maiores_60)

## usando reshape para geração de boxplot
agru3 = agru2
agru3$gini = NULL
agru3$idhm = NULL
agru3$menores_5 = NULL
agru3$maiores_60 = NULL

agru4 = melt(data = agru3, id.vars = c("mun", "uf", "geocod"), 
     measure.vars = c("gini_pad", "idhm_pad", "menores_5_pad", "maiores_60_pad"))

## gerando boxplot
agru4 %>%
  ggplot(aes(x = variable, y=value, fill= variable)) + 
  geom_boxplot()

## ajustando boxplor sem outliers extremos
agru5 = agru4 
agru5$variable = as.character(agru5$variable)

agru5$variable[agru5$variable == "gini_pad"] = "Índice de Gini"
agru5$variable[agru5$variable == "idhm_pad"] = "IDHM"
agru5$variable[agru5$variable == "menores_5_pad"] = "% menor de 5 anos"
agru5$variable[agru5$variable == "maiores_60_pad"] = "% maior de 60 anos"

## gerando boxplot de dados do Ipea
agru5 %>%
  ggplot(aes(x = variable, y=value, fill= variable)) + 
  geom_boxplot()+
  ggtitle("Distribuição variáveis consideradas do Atlas Brasil por município, Brasil, 2010")+
  ylab("Escala (z score)")+
  xlab("Variáveis")+
  scale_fill_manual(values = c("#ff0000", "#7aff00", "#00fffb", "#f300ff"))+
  theme_minimal()
