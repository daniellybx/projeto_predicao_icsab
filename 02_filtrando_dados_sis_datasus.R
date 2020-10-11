#importando dados de municipios

library(readxl) #carregando pacote de leitura excel
library(read.dbc) #carregando pacote de leitura dbc
library(tidyverse) #carregando pacote de manipulação de dados
library(readr) #carregando pacote de leitura csv
library(ggplot2) #carregando pacote de geração de gráficos
library(reshape2) #carregando pacote de manipulação de data.frames
library(varhandle) #carregando pacote de manipulação de dados

#importando dados do SIM 
c = NULL

setwd("C:/Users/danie/OneDrive/Documentos/Ciência de Dados e Big Data/13- TCC Ciência de Dados e Big Data (2019)/Projeto/projeto_tcc_pucmg/projeto_tcc_pucmg/dados/SIM")
arq = cbind(list.files())
arq = arq[1:27, 1]

for (i in 1:length(arq)) {
  a = read.dbc(arq[i])
  a = unfactor(a)
  b = subset(a, a$CAUSABAS == substring("A37", 1,3) 
             |a$CAUSABAS == substring("A36", 1,3)  |a$CAUSABAS == substring("A33", 1,3) 
             |a$CAUSABAS == substring("A34", 1,3)  |a$CAUSABAS == substring("B26", 1,3) 
             |a$CAUSABAS == substring("B06", 1,3)  |a$CAUSABAS == substring("B05", 1,3) 
             |a$CAUSABAS == substring("A95", 1,3)  |a$CAUSABAS == substring("B16", 1,3) 
             |a$CAUSABAS == "G000" |a$CAUSABAS == "A170"
             |a$CAUSABAS == "A150" |a$CAUSABAS == "A153"
             |a$CAUSABAS == "A160" |a$CAUSABAS == "A162"
             |a$CAUSABAS == "A154" |a$CAUSABAS == "A155"
             |a$CAUSABAS == "A156" |a$CAUSABAS == "A157"
             |a$CAUSABAS == "A158" |a$CAUSABAS == "A159"
             |a$CAUSABAS == "A163" 
             |a$CAUSABAS == "A164" |a$CAUSABAS == "A165"
             |a$CAUSABAS == "A166" |a$CAUSABAS == "A167"
             |a$CAUSABAS == "A168" |a$CAUSABAS == "A169"
             |a$CAUSABAS == "A171" |a$CAUSABAS == "A172"
             |a$CAUSABAS == "A173" 
             |a$CAUSABAS == "A174" |a$CAUSABAS == "A175"
             |a$CAUSABAS == "A176" |a$CAUSABAS == "A177"
             |a$CAUSABAS == "A178" |a$CAUSABAS == "A179"
             |a$CAUSABAS == "A18" |a$CAUSABAS == substring("I00", 1,3) 
             |a$CAUSABAS == substring("I01", 1,3)  |a$CAUSABAS == substring("I02", 1,3) 
             |a$CAUSABAS == substring("A51", 1,3)  |a$CAUSABAS == substring("A52", 1,3) 
             |a$CAUSABAS == substring("A53", 1,3)  |a$CAUSABAS == substring("B50", 1,3) 
             |a$CAUSABAS == substring("B51", 1,3)  |a$CAUSABAS == substring("B52", 1,3) 
             |a$CAUSABAS == substring("B53", 1,3)  |a$CAUSABAS == substring("B54", 1,3)
             |a$CAUSABAS == substring("B77", 1,3)  |a$CAUSABAS == substring("E86", 1,3)            
             |a$CAUSABAS == substring("A00", 1,3)  |a$CAUSABAS == substring("A01", 1,3)            
             |a$CAUSABAS == substring("A02", 1,3)  |a$CAUSABAS == substring("A03", 1,3)           
             |a$CAUSABAS == substring("A04", 1,3)  |a$CAUSABAS == substring("A05", 1,3)            
             |a$CAUSABAS == substring("A06", 1,3)  |a$CAUSABAS == substring("A07", 1,3)            
             |a$CAUSABAS == substring("A08", 1,3)  |a$CAUSABAS == substring("A09", 1,3)            
             |a$CAUSABAS == substring("D50", 1,3)  |a$CAUSABAS == substring("E40", 1,3)            
             |a$CAUSABAS == substring("E41", 1,3)  |a$CAUSABAS == substring("E42", 1,3)            
             |a$CAUSABAS == substring("E43", 1,3)  |a$CAUSABAS == substring("E44", 1,3)            
             |a$CAUSABAS == substring("E45", 1,3)  |a$CAUSABAS == substring("E46", 1,3)            
             |a$CAUSABAS == substring("E50", 1,3)  |a$CAUSABAS == substring("E51", 1,3)            
             |a$CAUSABAS == substring("E52", 1,3)  |a$CAUSABAS == substring("E53", 1,3)            
             |a$CAUSABAS == substring("E54", 1,3)  |a$CAUSABAS == substring("E55", 1,3)           
             |a$CAUSABAS == substring("E56", 1,3)  |a$CAUSABAS == substring("E57", 1,3)            
             |a$CAUSABAS == substring("E58", 1,3)  |a$CAUSABAS == substring("E59", 1,3)            
             |a$CAUSABAS == substring("E60", 1,3)  |a$CAUSABAS == substring("E61", 1,3)            
             |a$CAUSABAS == substring("E62", 1,3)  |a$CAUSABAS == substring("E63", 1,3)            
             |a$CAUSABAS == substring("E64", 1,3)  |a$CAUSABAS == substring("H66", 1,3)            
             |a$CAUSABAS == substring("J00", 1,3)  |a$CAUSABAS == substring("J01", 1,3)            
             |a$CAUSABAS == substring("J02", 1,3)  |a$CAUSABAS == substring("J03", 1,3)            
             |a$CAUSABAS == substring("J04", 1,3)  |a$CAUSABAS == substring("J31", 1,3)            
             |a$CAUSABAS == substring("J13", 1,3)  |a$CAUSABAS == substring("J14", 1,3)            
             |a$CAUSABAS == "J153" |a$CAUSABAS == "J154"
             |a$CAUSABAS == "J158" |a$CAUSABAS == "J159"
             |a$CAUSABAS == "J181" 
             |a$CAUSABAS == substring("J40", 1,3)  |a$CAUSABAS == substring("J41", 1,3)            
             |a$CAUSABAS == substring("J42", 1,3)  |a$CAUSABAS == substring("J43", 1,3)            
             |a$CAUSABAS == substring("J47", 1,3)  |a$CAUSABAS == substring("J47", 1,3)            
             |a$CAUSABAS == substring("J44", 1,3)  |a$CAUSABAS == substring("I10", 1,3)           
             |a$CAUSABAS == substring("I11", 1,3)  |a$CAUSABAS == substring("I20", 1,3)           
             |a$CAUSABAS == substring("I50", 1,3)  |a$CAUSABAS == substring("J81", 1,3)                      
             |a$CAUSABAS == substring("I63", 1,3)  |a$CAUSABAS == substring("I64", 1,3)            
             |a$CAUSABAS == substring("I65", 1,3)  |a$CAUSABAS == substring("I66", 1,3)            
             |a$CAUSABAS == substring("I67", 1,3)  |a$CAUSABAS == substring("I69", 1,3)            
             |a$CAUSABAS == "E100" |a$CAUSABAS == "E101"
             |a$CAUSABAS == "E111" |a$CAUSABAS == "E120"
             |a$CAUSABAS == "E121" |a$CAUSABAS == "E130"
             |a$CAUSABAS == "E131" |a$CAUSABAS == "E140"
             |a$CAUSABAS == "E141" |a$CAUSABAS == "E102"
             |a$CAUSABAS == "E108" |a$CAUSABAS == "E112"
             |a$CAUSABAS == "E118" |a$CAUSABAS == "E122"
             |a$CAUSABAS == "E128" |a$CAUSABAS == "E132"
             |a$CAUSABAS == "E138" |a$CAUSABAS == "E142"
             |a$CAUSABAS == "E148" |a$CAUSABAS == "E109"
             |a$CAUSABAS == "E119" |a$CAUSABAS == "E129"
             |a$CAUSABAS == "E139" |a$CAUSABAS == "E149"
             |a$CAUSABAS == substring("G40", 1,3)  |a$CAUSABAS == substring("G41", 1,3)            
             |a$CAUSABAS == substring("N10", 1,3)  |a$CAUSABAS == substring("N11", 1,3) 
             |a$CAUSABAS == substring("N12", 1,3)  |a$CAUSABAS == substring("N30", 1,3)            
             |a$CAUSABAS == substring("N34", 1,3)  |a$CAUSABAS == "N390" 
             |a$CAUSABAS == substring("A46", 1,3)  |a$CAUSABAS == substring("L01", 1,3)            
             |a$CAUSABAS == substring("L02", 1,3)  |a$CAUSABAS == substring("L03", 1,3) 
             |a$CAUSABAS == substring("L04", 1,3)  |a$CAUSABAS == substring("L08", 1,3)
             |a$CAUSABAS == substring("N70", 1,3)  |a$CAUSABAS == substring("N71", 1,3)            
             |a$CAUSABAS == substring("N72", 1,3)  |a$CAUSABAS == substring("N73", 1,3) 
             |a$CAUSABAS == substring("N75", 1,3)  |a$CAUSABAS == substring("N76", 1,3)
             |a$CAUSABAS == substring("K25", 1,3)  |a$CAUSABAS == substring("K28", 1,3)            
             |a$CAUSABAS == "K920" |a$CAUSABAS == "K921"
             |a$CAUSABAS == "K922" |a$CAUSABAS == substring("O23", 1,3)
             |a$CAUSABAS == substring("O23", 1,3)  |a$CAUSABAS == substring("A50", 1,3)            
             |a$CAUSABAS == "P350"
  )
  c = data.frame(rbind(c, b))
}

write.csv2(c, "sim_csab_2019.csv", row.names = F)

#número de internações por Município
d = data.frame(table(c$CODMUNRES))

write.csv2(d, "sim_icsab_freq_2019.csv", row.names = F)

#importando dados do SIH 
c = NULL

setwd("C:/Users/danie/OneDrive/Documentos/Ciência de Dados e Big Data/13- TCC Ciência de Dados e Big Data (2019)/Projeto/projeto_tcc_pucmg/projeto_tcc_pucmg/dados/SIH")
arq = cbind(list.files())

for (i in 1:length(arq)) {
  a = read.dbc(arq[i])
  a = unfactor(a)
  b = subset(a, a$DIAG_PRINC == substring("A37", 1,3) 
             |a$DIAG_PRINC  == substring("A36", 1,3)  |a$DIAG_PRINC  == substring("A33", 1,3) 
             |a$DIAG_PRINC  == substring("A34", 1,3)  |a$DIAG_PRINC  == substring("B26", 1,3) 
             |a$DIAG_PRINC  == substring("B06", 1,3)  |a$DIAG_PRINC  == substring("B05", 1,3) 
             |a$DIAG_PRINC  == substring("A95", 1,3)  |a$DIAG_PRINC  == substring("B16", 1,3) 
             |a$DIAG_PRINC  == "G000" |a$DIAG_PRINC  == "A170"
             |a$DIAG_PRINC  == "A150" |a$DIAG_PRINC  == "A153"
             |a$DIAG_PRINC  == "A160" |a$DIAG_PRINC  == "A162"
             |a$DIAG_PRINC  == "A154" |a$DIAG_PRINC  == "A155"
             |a$DIAG_PRINC  == "A156" |a$DIAG_PRINC  == "A157"
             |a$DIAG_PRINC  == "A158" |a$DIAG_PRINC  == "A159"
             |a$DIAG_PRINC  == "A163" 
             |a$DIAG_PRINC  == "A164" |a$DIAG_PRINC  == "A165"
             |a$DIAG_PRINC  == "A166" |a$DIAG_PRINC  == "A167"
             |a$DIAG_PRINC  == "A168" |a$DIAG_PRINC  == "A169"
             |a$DIAG_PRINC  == "A171" |a$DIAG_PRINC  == "A172"
             |a$DIAG_PRINC  == "A173" 
             |a$DIAG_PRINC  == "A174" |a$DIAG_PRINC  == "A175"
             |a$DIAG_PRINC  == "A176" |a$DIAG_PRINC  == "A177"
             |a$DIAG_PRINC  == "A178" |a$DIAG_PRINC  == "A179"
             |a$DIAG_PRINC  == "A18" |a$DIAG_PRINC  == substring("I00", 1,3) 
             |a$DIAG_PRINC  == substring("I01", 1,3)  |a$DIAG_PRINC  == substring("I02", 1,3) 
             |a$DIAG_PRINC  == substring("A51", 1,3)  |a$DIAG_PRINC  == substring("A52", 1,3) 
             |a$DIAG_PRINC  == substring("A53", 1,3)  |a$DIAG_PRINC  == substring("B50", 1,3) 
             |a$DIAG_PRINC  == substring("B51", 1,3)  |a$DIAG_PRINC  == substring("B52", 1,3) 
             |a$DIAG_PRINC  == substring("B53", 1,3)  |a$DIAG_PRINC  == substring("B54", 1,3)
             |a$DIAG_PRINC  == substring("B77", 1,3)  |a$DIAG_PRINC  == substring("E86", 1,3)            
             |a$DIAG_PRINC  == substring("A00", 1,3)  |a$DIAG_PRINC  == substring("A01", 1,3)            
             |a$DIAG_PRINC  == substring("A02", 1,3)  |a$DIAG_PRINC  == substring("A03", 1,3)           
             |a$DIAG_PRINC  == substring("A04", 1,3)  |a$DIAG_PRINC  == substring("A05", 1,3)            
             |a$DIAG_PRINC  == substring("A06", 1,3)  |a$DIAG_PRINC  == substring("A07", 1,3)            
             |a$DIAG_PRINC  == substring("A08", 1,3)  |a$DIAG_PRINC  == substring("A09", 1,3)            
             |a$DIAG_PRINC  == substring("D50", 1,3)  |a$DIAG_PRINC  == substring("E40", 1,3)            
             |a$DIAG_PRINC  == substring("E41", 1,3)  |a$DIAG_PRINC  == substring("E42", 1,3)            
             |a$DIAG_PRINC  == substring("E43", 1,3)  |a$DIAG_PRINC  == substring("E44", 1,3)            
             |a$DIAG_PRINC  == substring("E45", 1,3)  |a$DIAG_PRINC  == substring("E46", 1,3)            
             |a$DIAG_PRINC  == substring("E50", 1,3)  |a$DIAG_PRINC  == substring("E51", 1,3)            
             |a$DIAG_PRINC  == substring("E52", 1,3)  |a$DIAG_PRINC  == substring("E53", 1,3)            
             |a$DIAG_PRINC  == substring("E54", 1,3)  |a$DIAG_PRINC  == substring("E55", 1,3)           
             |a$DIAG_PRINC  == substring("E56", 1,3)  |a$DIAG_PRINC  == substring("E57", 1,3)            
             |a$DIAG_PRINC  == substring("E58", 1,3)  |a$DIAG_PRINC  == substring("E59", 1,3)            
             |a$DIAG_PRINC  == substring("E60", 1,3)  |a$DIAG_PRINC  == substring("E61", 1,3)            
             |a$DIAG_PRINC  == substring("E62", 1,3)  |a$DIAG_PRINC  == substring("E63", 1,3)            
             |a$DIAG_PRINC  == substring("E64", 1,3)  |a$DIAG_PRINC  == substring("H66", 1,3)            
             |a$DIAG_PRINC  == substring("J00", 1,3)  |a$DIAG_PRINC  == substring("J01", 1,3)            
             |a$DIAG_PRINC  == substring("J02", 1,3)  |a$DIAG_PRINC  == substring("J03", 1,3)            
             |a$DIAG_PRINC  == substring("J04", 1,3)  |a$DIAG_PRINC  == substring("J31", 1,3)            
             |a$DIAG_PRINC  == substring("J13", 1,3)  |a$DIAG_PRINC  == substring("J14", 1,3)            
             |a$DIAG_PRINC  == "J153" |a$DIAG_PRINC  == "J154"
             |a$DIAG_PRINC  == "J158" |a$DIAG_PRINC  == "J159"
             |a$DIAG_PRINC  == "J181" 
             |a$DIAG_PRINC  == substring("J40", 1,3)  |a$DIAG_PRINC  == substring("J41", 1,3)            
             |a$DIAG_PRINC  == substring("J42", 1,3)  |a$DIAG_PRINC  == substring("J43", 1,3)            
             |a$DIAG_PRINC  == substring("J47", 1,3)  |a$DIAG_PRINC  == substring("J47", 1,3)            
             |a$DIAG_PRINC  == substring("J44", 1,3)  |a$DIAG_PRINC  == substring("I10", 1,3)           
             |a$DIAG_PRINC  == substring("I11", 1,3)  |a$DIAG_PRINC  == substring("I20", 1,3)           
             |a$DIAG_PRINC  == substring("I50", 1,3)  |a$DIAG_PRINC  == substring("J81", 1,3)                      
             |a$DIAG_PRINC  == substring("I63", 1,3)  |a$DIAG_PRINC  == substring("I64", 1,3)            
             |a$DIAG_PRINC  == substring("I65", 1,3)  |a$DIAG_PRINC  == substring("I66", 1,3)            
             |a$DIAG_PRINC  == substring("I67", 1,3)  |a$DIAG_PRINC  == substring("I69", 1,3)            
             |a$DIAG_PRINC  == "E100" |a$DIAG_PRINC  == "E101"
             |a$DIAG_PRINC  == "E111" |a$DIAG_PRINC  == "E120"
             |a$DIAG_PRINC  == "E121" |a$DIAG_PRINC  == "E130"
             |a$DIAG_PRINC  == "E131" |a$DIAG_PRINC  == "E140"
             |a$DIAG_PRINC  == "E141" |a$DIAG_PRINC  == "E102"
             |a$DIAG_PRINC  == "E108" |a$DIAG_PRINC  == "E112"
             |a$DIAG_PRINC  == "E118" |a$DIAG_PRINC  == "E122"
             |a$DIAG_PRINC  == "E128" |a$DIAG_PRINC  == "E132"
             |a$DIAG_PRINC  == "E138" |a$DIAG_PRINC  == "E142"
             |a$DIAG_PRINC  == "E148" |a$DIAG_PRINC  == "E109"
             |a$DIAG_PRINC  == "E119" |a$DIAG_PRINC  == "E129"
             |a$DIAG_PRINC  == "E139" |a$DIAG_PRINC  == "E149"
             |a$DIAG_PRINC  == substring("G40", 1,3)  |a$DIAG_PRINC  == substring("G41", 1,3)            
             |a$DIAG_PRINC  == substring("N10", 1,3)  |a$DIAG_PRINC  == substring("N11", 1,3) 
             |a$DIAG_PRINC  == substring("N12", 1,3)  |a$DIAG_PRINC  == substring("N30", 1,3)            
             |a$DIAG_PRINC  == substring("N34", 1,3)  |a$DIAG_PRINC  == "N390" 
             |a$DIAG_PRINC  == substring("A46", 1,3)  |a$DIAG_PRINC  == substring("L01", 1,3)            
             |a$DIAG_PRINC  == substring("L02", 1,3)  |a$DIAG_PRINC  == substring("L03", 1,3) 
             |a$DIAG_PRINC  == substring("L04", 1,3)  |a$DIAG_PRINC  == substring("L08", 1,3)
             |a$DIAG_PRINC  == substring("N70", 1,3)  |a$DIAG_PRINC  == substring("N71", 1,3)            
             |a$DIAG_PRINC  == substring("N72", 1,3)  |a$DIAG_PRINC  == substring("N73", 1,3) 
             |a$DIAG_PRINC  == substring("N75", 1,3)  |a$DIAG_PRINC  == substring("N76", 1,3)
             |a$DIAG_PRINC  == substring("K25", 1,3)  |a$DIAG_PRINC  == substring("K28", 1,3)            
             |a$DIAG_PRINC  == "K920" |a$DIAG_PRINC  == "K921"
             |a$DIAG_PRINC  == "K922" |a$DIAG_PRINC  == substring("O23", 1,3)
             |a$DIAG_PRINC  == substring("O23", 1,3)  |a$DIAG_PRINC  == substring("A50", 1,3)            
             |a$DIAG_PRINC  == "P350"
  )
  c = data.frame(rbind(c, b))
}

write.csv2(c, "sih_icsab_2019.csv", row.names = F)

#número de internações por Município
d = data.frame(table(c$MUNIC_RES))

write.csv2(d, "sih_icsab_freq_2019.csv", row.names = F)

