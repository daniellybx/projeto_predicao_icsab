#importando dados de municipios

library(tidyverse) #carregando pacote de manipulação de dados
library(readr) #carregando pacote de leitura csv
library(reshape2) #carregando pacote de manipulação de data.frames

#calculando taxa de internação e mortalidade por município

sih = read_csv2("sih_icsab_freq_2019.csv")
colnames(sih) = c("MUN", "ICSAB")

sim = read_csv2("sim_icsab_freq_2019.csv")
colnames(sim) = c("MUN", "OBT_CSAB")

csab = merge(sih, sim, by = "MUN", all.x = T, all.y = T)
csab = replace(csab, is.na(csab), 0) #substituindo NA por 0

pop = read.csv2("pop.csv")

csab2 = merge(pop, csab, by.x = "COD", by.y = "MUN", all.x = T, all.y = T)
csab2 = replace(csab2, is.na(csab2), 0) #substituindo NA por 0

## calculando taxas
csab2$TX_INT = round(csab2$ICSAB/csab2$POP*100000, 2)
csab2$TX_MORT = round(csab2$OBT_CSAB/csab2$POP*1000, 2)

# importando os dados
write.csv2(csab2, "taxas_csab_mun_2019.csv", row.names = F)
