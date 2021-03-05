library(MASS)
View(crabs)

#Tabela completa
data <- MASS::crabs

#Tabela com as variaveis que queremos
tabela <- data[, c("sp", "sex", "FL")]

#Renomear as colunas
colnames(tabela)<-c("especie", "sexo", "lobo_frontal")

#Analise de variancia variacao lobo frontal em função da especie e do sexo
teste1<- aov(lobo_frontal~especie + sexo, tabela)
summary(teste1)
#Resultados
plot(teste1)

#Analise de variancia variacao em função da interacao especie e sexo
teste2<- aov(lobo_frontal~especie:sexo, tabela)  
summary(teste2) #Interação especie:sexo e significativa
#Resultados
plot(teste2)
boxplot(lobo_frontal~especie:sexo, data = tabela)

#Teste de normalidade da interacao especie e sexo para entender os residuos
shapiro.test(resid(teste3))

#Teste de homoscedasticidade
library(lawstat) 
levene.test(tabela$lobo_frontal,tabela$especie)
levene.test(tabela$lobo_frontal,tabela$sexo)

#Teste de Tukey
plot(TukeyHSD(teste2))
