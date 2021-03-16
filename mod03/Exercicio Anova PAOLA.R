###########################EXERCICIO MODULO 3################## 
install.packages("MASS")
library("MASS")
??MASS #um pacote geral com uma sÃ©rie de funÃ§Ãµes
?crabs #um data frame
data.frame(crabs) #ou
View(crabs)
install.packages("lawstat")
library("lawstat")

shapiro.test(crabs[crabs$sp=="B",]$FL) #hipótese nula aceita
shapiro.test(crabs[crabs$sp=="O",]$FL) #hipótese nula aceita
shapiro.test(crabs[crabs$sex=="F",]$FL) #hipótese nula aceita
shapiro.test(crabs[crabs$sex=="M",]$FL) #hipótese nula aceita

# 1)VARIACAO DO LOBO FRONTAL EM RELACAO A ESPECIE E SEXO (SEXO+ESPECIES)
sexspfl<- aov(FL ~ sex + sp, data = crabs) #duas variaveis independentes = anova two way
summary.aov(sexspfl)
plot(sexspfl)
boxplot(FL ~ sex + sp, data = crabs)


# 2) INTERACAO ENTRE ESPECIE E SEXO (ESPECIE:SEXO) E APRESENTE O GRAFICO DE INTERACAO
total<-aov(FL ~ sex + sp + sex:sp, data = crabs)
#a variância entre espécie e sexo deu um valor significativamente menor que 0.05
summary.aov(total)
plot(total)
boxplot(total)


# 3) ANALISES EXPLORATORIAS COMO HOMOCEDASTICIDADE, LEVINI, ETC.
levene.test(crabs$FL,group=crabs$sex) #hipótese nula aceita
levene.test(crabs$FL,group=crabs$sp) #hipótese nula aceita
plot(TukeyHSD(total))






