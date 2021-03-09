#Exercicio para casa modulo 03 Anova Biologia Quantitativa 2020/02
# Entregar ate 05 de marco de 2021


#Instale o pacote MASS usando o Rstudio e visualize o banco de dados crabs
library(MASS)
View(crabs)
#Este banco de dados tem as seguintes variaveis:  especie, sexo, numero da amostra,
#  tamanho lobo frontal mm,  largura posterior mm, comprimento carapaca mm, 
# largura carapaca mm, profundidade do corpo mm
# 
#Faca uma analise de variancia com o seguinte modelo:
#  variacao do lobo frontal em funcao de especie e sexo
# mostre a tabela completa da analise de variancia
# faca um boxplot dos resultados 
aovfl_sp<- aov(crabs$FL~crabs$sp)
summary(aovfl_sp)
coefficients(aovfl_spsex)
boxplot(crabs$FL~crabs$sp)
#p value significativo =8.84e-11, ou seja aceitamos a hipótese de que o tamanho do lobo frontal varia em relação a especie

aovfl_sex<-aov(crabs$FL~crabs$sex)
summary.aov(aovfl_sex)
summary(aovfl_sex)
boxplot(crabs$FL~crabs$sex)
#p value não significativo = 0.543, rejeitamos a hipotese de que tamanho do lobo frontal varia em relação ao sexo

#Repita a analise de variancia incluindo o componente de interacao entre especie e sexo
# mostre a variancia explicada pela interacao entre especie e sexo - e significativa?
aovfl_sp_sex <- aov(FL~sp:sex,crabs)
summary(aovfl_sp_sex)
boxplot(FL~sp:sex,crabs)
#p value significativo= 6.08e-11, aceitamos a hipotese de que existe variação no lobo frontal em relação a especie e sexo, porém qual varia?

testedetukey<-TukeyHSD(aovfl_sp_sex)
testedetukey
plot(TukeyHSD(aovfl_sp_sex))

# teste as premissas do modelo de normalidade e homoscedascidade usando
#testes de shapiro e levene - instale o pacote lawstat para usar o teste de levene

#Normalidade
shapiro.test(resid(aovfl_sp))
#p-value = 0.1211
shapiro.test(resid(aovfl_sex))
#p-value = 0.2261
shapiro.test(resid(aovfl_sp_sex))
#0.08612
#Todos os p values resultaram maiores que 0,05, portanto, aceitamos a hipotese nula de que os residuos estão em uma distribuição normal

#Homocedasticidade
install.packages("lawstat")
library(lawstat)
levene.test(crabs$FL,crabs$sex)
#p-value = 0.9443 
levene.test(crabs$FL,crabs$sp)
#p-value = 0.4472 
#como os valores de p sao maiores do que 0.05, aceito a H0 e concluo que as variancias sao homogeneas
#Submetido!

