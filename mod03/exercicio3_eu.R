library(MASS)
View(crabs)

#Tabela completa
data <- MASS::crabs

#Tabela com as variaveis que queremos
tabela <- data[, c("sp", "sex", "FL")]

#Renomear as colunas
colnames(tabela)<-c("especie", "sexo", "lobo_frontal")

#Analise de variancia variacao lobo frontal em função da especie
teste1<- aov(lobo_frontal~especie, tabela)
summary(teste1)
#Resultados
plot(teste1)
boxplot(lobo_frontal~especie, data = tabela)

#Analise de variancia variacao lobo frontal em função do sexo
teste2<- aov(lobo_frontal~sexo, tabela)
summary(teste2)
#Resultados
plot(teste2)
boxplot(lobo_frontal~sexo, data = tabela)

#Analise de variancia variacao lobo frontal em função da interacao especie e sexo
teste3<- aov(lobo_frontal~especie*sexo, tabela)  
summary(teste3) #Interação especie*sexo e significativa
#Resultados
plot(teste3)
boxplot(lobo_frontal~especie*sexo, data = tabela)

#Teste de normalidade da interacao especie e sexo para entender os residuos
shapiro.test(resid(teste3))

#Teste de homoscedasticidade
library(lawstat) 
levene.test(tabela$lobo_frontal,tabela$especie)
levene.test(tabela$lobo_frontal,tabela$sexo)


