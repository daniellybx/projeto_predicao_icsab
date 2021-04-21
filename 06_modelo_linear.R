#carregando pacotes

library(ggplot2)
library(nortest)

#importando dados 
dados_fn <- readRDS("dados_finais2.rds") #dados padronizados

#incluindo nomes dos municípios
rotulos = read.csv2("rotulos2.csv")
dados_fn = merge(rotulos, dados_fn, by = "GEOCOD")
colnames(dados_fn) = c("geocod", "municipio", "cobertura_esf", "tx_icsab", "tx_mort", "gini",
                        "idhm", "menores_5", "maiores_60")

#excluindo taxa de mortalidade
dados_fn$tx_mort = NULL

#testando correlação entre as variáveis
cor(dados_fn[,3:8]) #correlação negativa forte entre maiores de 60 e menores de 5 anos

#utilizando o algoritimo stepwise para escolha de variáveis
model = lm(data = dados_fn, tx_icsab ~ cobertura_esf+gini+idhm+menores_5+maiores_60)
summary(model)
step(model, direction = "both", scale = 618.1) #usando o residual standart error para scale

model_fn = lm(formula = tx_icsab ~ cobertura_esf+idhm+menores_5+maiores_60, data = dados_fn[1:5000,])
summary(model_fn)

#plotando o modelo 
par(mfrow= c(2,2))
plot(model_fn, which = c(1:4), pch = 20)

#teste shapiro-wilk para normalidade dos resíduos
sf.test(model_fn$residuals)

# coeficientes do modelo
model_fn$coefficients
