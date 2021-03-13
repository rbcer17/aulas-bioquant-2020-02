#### Exercicio 1

# O professor Roberto Cavalcanti foi ao campo e coletou o comprimento do corpo de 5 aves 
#e tambem o comprimento das asas destes individuos. 
#Ele quer saber qual a relacao entre essas variaveis e quanto uma varia em funcao da outra.
# Ajude-o fazendo o teste estatistico adequado.
# Ao final fa?a um graf?co.

asas = c(1.6, 1.5, 1.8, 1.3, 1.2 ,1.8, 1.5, 1.6, 1.7, 1.8, 1.4, 1.3, 1.8, 1.6, 1.7, 1.5, 1.5, 1.1, 2.0 ,1.7, 1.9, 1.6, 1.7, 1.6, 1.4, 1.5, 1.6, 1.5, 1.6, 1.7, 1.5, 1.6, 1.6, 1.3, 1.4, 1.5, 1.5, 1.4 ,1.6 ,1.5, 1.4 ,1.5, 1.8 ,1.1, 1.7, 1.4, 1.1, 1.7, 1.6, 1.4)
corpo = c(3.3, 1.8, 4.2, 3.3, 1.3, 1.3, 2.5, 2.3, 4.4, 3.6, 2.3, 2.8, 4.4, 2.1, 2.3, 2.2, 4.3, 4.0, 1.0, 3.4, 2.6, 3.0, 3.1, 3.1, 2.9, 2.6, 3.0, 3.2,3.8, 2.6, 2.0, 2.0, 3.4, 4.0, 2.5, 2.0, 2.2, 4.5, 2.7, 2.1, 3.1 ,3.8,2.6, 2.8, 3.3, 4.6, 2.8, 2.9, 2.3, 2.8)

#Correlacao
cor.test(asas, corpo, method = "pearson")
#As variaveis sao pouco correlacionadas, mais próximo de 0 que de -1

#Regressao linear
#Teste de normalidade
shapiro.test(asas)
shapiro.test(corpo)
#Distribuições são normais

#Homocedasticidade
library(lawstat)
levene.test(asas, corpo)

#Equacao da reta
reg <- lm(asas~corpo)
summary(reg)

# Grafico 
plot(asas~corpo)
abline(reg)


### Exercicio 2

# Vamos analisar agora a m?dia do  n?mero de mortes por queda de escada nos Estados unidos com o 
# numero de advogados na Georgia (EUA) entre os anos de 1999 e 2009. Existe uma coorela??o entre esses
#dados? Se sim, Qual ? a possibilidade de rela??o entre eles (porque voc?s acham que houve a rela??o)?
# Ao final fa?am um graf?co.

acidentes = c(1.421, 1.307, 1.462, 1.598, 1.588, 1.638, 1.690, 1.818, 1.917, 1.935, 1.960)
advogados =c(21.268, 21.362, 22.254, 23.134, 23.698, 24.367, 24.930, 25.632, 26.459, 27.227, 27.457)

#Correlacao
cor.test(acidentes, advogados, method = "pearson")
#Sao correlacionadas positivamente. Apesar de serem correlacionadas, as variaveis provavelmente variam em relacao a uma terceira variavel

#Regressão linear

#Teste de normalidade
shapiro.test(acidentes)
shapiro.test(advogados)
#Distribuicoes sao normais

#Equacao da reta
reg2 <- lm(acidentes~advogados)
summary(reg2)

# Grafico 
plot(acidentes~advogados)
abline(reg2)
