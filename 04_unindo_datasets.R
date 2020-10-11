#importando dados de municipios

library(tidyverse) #carregando pacote de manipulação de dados
library(readr) #carregando pacote de leitura csv
library(reshape2) #carregando pacote de manipulação de data.frames
library(varhandle) #carregando pacote de manipulação de dados

#importando dados 
dados_ipea <- readRDS("dados_ipea.rds") #ipea
taxas_csab_mun <- readRDS("taxas_csab_mun.rds") # SIM e SIH
cobertura_ab_2019 <- readRDS("cobertura_ab_2019.rds") # CNES

#padronizando dados de taxas de internação e mortalidade
taxas_csab_mun$POP = NULL
taxas_csab_mun$ICSAB = NULL
taxas_csab_mun$OBT_CSAB = NULL

taxas_csab_mun = subset(taxas_csab_mun, !is.na(taxas_csab_mun$TX_INT))
taxas_csab_mun = subset(taxas_csab_mun, !is.na(taxas_csab_mun$TX_MORT))

taxas_csab_mun$TX_INT_PAD = scale(taxas_csab_mun$TX_INT)
taxas_csab_mun$TX_MORT_PAD = scale(taxas_csab_mun$TX_MORT)

#extraindo proporção de cobertura estratégia saúde da familia e padronizando
cobertura_ab_2019$COBERTURA = sub("\\%", "", cobertura_ab_2019$COBERTURA)
cobertura_ab_2019$COBERTURA <- parse_number(cobertura_ab_2019$COBERTURA, locale = readr::locale(decimal_mark = ","))
cobertura = data.frame(cbind(cobertura_ab_2019$GEOCOD, cobertura_ab_2019$COBERTURA))
colnames(cobertura) = c("GEOCOD", "COBERTURA_ESF")
cobertura$COBERTURA_ESF_PAD = scale(cobertura$COBERTURA_ESF)

#unindo dados
df1 = merge(cobertura, taxas_csab_mun, 
            by.x = "GEOCOD", by.y = "COD",
            all.x = T, all.y = T)
df2 = merge(df1, dados_ipea, 
            by.x = "GEOCOD", by.y = "geocod",
            all.x = T, all.y = T)

saveRDS(df2, "dados_finais_todos.rds")

#separando dados padronizados e dados obtidos

df_dados = df2
df_dados$COBERTURA_ESF_PAD = NULL
df_dados$TX_INT_PAD = NULL
df_dados$TX_MORT_PAD = NULL
df_dados$gini_pad = NULL
df_dados$idhm_pad = NULL
df_dados$menores_5_pad = NULL
df_dados$maiores_60_pad = NULL
df_dados$pop = NULL
df_dados$mun = NULL
saveRDS(df_dados, "dados_finais.rds")

df_dados2 = df_dados
df_dados2$MUN = NULL
df_dados2$uf = NULL
saveRDS(df_dados2, "dados_finais2.rds")

df_pad = df2
df_pad$COBERTURA_ESF = NULL
df_pad$TX_INT = NULL
df_pad$TX_MORT = NULL
df_pad$gini = NULL
df_pad$idhm = NULL
df_pad$menores_5 = NULL
df_pad$maiores_60 = NULL
df_pad$mun = NULL
df_pad$pop = NULL
saveRDS(df_pad, "dados_pad.rds")

df_pad2 = df_pad
df_pad2$MUN = NULL
df_pad2$uf = NULL
saveRDS(df_pad2, "dados_pad2.rds")

df_pad3= melt(data = df_pad2, id.vars = "GEOCOD")
df_pad3 = unfactor(df_pad3)

df_pad3$variable[df_pad3$variable == "COBERTURA_ESF_PAD"] = "% cobertura de ESF"
df_pad3$variable[df_pad3$variable == "TX_INT_PAD"] = "ICSAB"
df_pad3$variable[df_pad3$variable == "TX_MORT_PAD"] = "Mortalidade por CSAB"
df_pad3$variable[df_pad3$variable == "menores_5_pad"] = "% menores de 5"
df_pad3$variable[df_pad3$variable == "gini_pad"] = "Índice de Gini"
df_pad3$variable[df_pad3$variable == "idhm_pad"] = "IDHM"
df_pad3$value = as.numeric(df_pad3$value)

saveRDS(df_pad3, "dados_pad3.rds")

# criando boxplot para todas as variáveis consideradas
df_pad3 %>%
  ggplot(aes(x = variable, y=value, fill= variable)) + 
  geom_boxplot()+
  ggtitle("Distribuição variáveis consideradas no estudo, Brasil, 2010")+
  ylab("Escala (z score)")+
  xlab("Variáveis")+
  theme_minimal()