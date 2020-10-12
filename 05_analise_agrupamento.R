#carregando pacotes

library(tidyverse)
library(cluster)
library(dendextend)
library(factoextra) 
library(gridExtra)

#importando dados 
dados_fn <- readRDS("dados_finais2.rds") #dados padronizados

#Agrupar dados por UF

dados_fn$UF = substring(dados_fn$GEOCOD, 1, 2)

#Incluindo rótulos de UF
rotulos = read.csv2("rotulos.csv")
dados_fn = merge(dados_fn, rotulos, by = "UF")
dados_fn$GEOCOD = NULL
dados_fn$UF = NULL

dados_fn2 = aggregate( . ~ ESTADO, FUN = mean, data = dados_fn)

#Ajustar data.frame
rownames(dados_fn2) <- dados_fn2[,1] #usando UF como titulo de linha
dados_fn2 <- dados_fn2[,-1]
colnames(dados_fn2) = c("cobertura_esf", "tx_icsab", "tx_mort", "gini",
                        "idhm", "menores_5", "maiores_60")

#padronizar dados
dados_pad = scale(dados_fn2)

##cluster hierárquico##
#calcular as distancias da matriz utilizando a distancia euclidiana
dist <- dist(dados_pad, method = "euclidean")

#Calcular o Cluster usando método single
cluster.hierarquico <- hclust(dist, method = "single" )

# Dendrograma
plot(cluster.hierarquico, cex = 0.6, hang = -1,
     ylab = "Distância",
     xlab = "UF",
     main = "Dendograma de cluster por UF")

#Criar o grafico e destacar os grupos
rect.hclust(cluster.hierarquico, k = 4)

#Verificando Elbow e Silhoutte
fviz_nbclust(dados_pad, FUN = hcut, method = "wss")
fviz_nbclust(dados_pad, FUN = hcut, method = "silhouette")

#criando 4 grupos 
grupo <- cutree(cluster.hierarquico, k = 4)
table(grupo)

#transformando em data frame a saida do cluster
ufs_grupos <- data.frame(grupo)

#juntando com a base original
ufs_fn <- cbind(dados_fn2, ufs_grupos)

#MEDIAS das variaveis por grupo
mediagrupo <- ufs_fn %>% 
  group_by(grupo) %>% 
  summarise(n = n(),
            cobertura_esf = mean(cobertura_esf), 
            tx_icsab = mean(tx_icsab), 
            tx_mort = mean(tx_mort),
            gini = mean(gini), 
            idhm = mean(idhm), 
            menores_5 = mean(menores_5),
            maiores_60 = mean(maiores_60))
