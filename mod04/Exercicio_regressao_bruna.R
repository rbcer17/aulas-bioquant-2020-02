#### Exercicio 1

# O professor Roberto Cavalcanti foi ao campo e coletou o comprimento do corpo de 5 aves 
#e tambem o comprimento das asas destes individuos. 
#Ele quer saber qual a relacao entre essas variaveis e quanto uma varia em funcao da outra.
# Ajude-o fazendo o teste estatistico adequado.
# Ao final fa?a um graf?co.
asas = c(1.6, 1.5, 1.8, 1.3, 1.2 ,1.8, 1.5, 1.6, 1.7, 1.8, 1.4, 1.3, 1.8, 1.6, 1.7, 1.5, 1.5, 1.1, 2.0 ,1.7, 1.9, 1.6, 1.7, 1.6, 1.4, 1.5, 1.6, 1.5, 1.6, 1.7, 1.5, 1.6, 1.6, 1.3, 1.4, 1.5, 1.5, 1.4 ,1.6 ,1.5, 1.4 ,1.5, 1.8 ,1.1, 1.7, 1.4, 1.1, 1.7, 1.6, 1.4)
corpo = c(3.3, 1.8, 4.2, 3.3, 1.3, 1.3, 2.5, 2.3, 4.4, 3.6, 2.3, 2.8, 4.4, 2.1, 2.3, 2.2, 4.3, 4.0, 1.0, 3.4, 2.6, 3.0, 3.1, 3.1, 2.9, 2.6, 3.0, 3.2,3.8, 2.6, 2.0, 2.0, 3.4, 4.0, 2.5, 2.0, 2.2, 4.5, 2.7, 2.1, 3.1 ,3.8,2.6, 2.8, 3.3, 4.6, 2.8, 2.9, 2.3, 2.8)

#teste de correlação
cor.test(corpo,asas,method = "pearson")
plot(corpo,asas)
cor(corpo,asas)

## Resultado
#cor value:-0.08926116
#data:  corpo and asas
#t = -0.6209, df = 48, p-value = 0.5376

#Regressão linear
#teste de normalidade
shapiro.test(asas)
shapiro.test(corpo)
corpo.asas <- data.frame(corpo,asas)

#Independencia das amostras : são independentes como mostra o teste de correlação
#homocedasticidade
library(lawstat)
levene.test(corpo.asas$corpo,corpo.asas$asas)

reg <- lm(corpo.asas$corpo~corpo.asas$asas)
summary(reg)

plot(corpo.asas$corpo~corpo.asas$asas)
abline(reg)
#Resultado foi próximo de 0, ou seja, baixo grau de correlação entre as variáveis, asas varia muito pouco em relação a corpo, independência dos dados

### Exercicio 2

# Vamos analisar agora a m?dia do  n?mero de mortes por queda de escada nos Estados unidos com o 
# numero de advogados na Georgia (EUA) entre os anos de 1999 e 2009. Existe uma coorela??o entre esses
#dados? Se sim, Qual ? a possibilidade de rela??o entre eles (porque voc?s acham que houve a rela??o)?
# Ao final fa?am um graf?co.

acidentes = c(1.421, 1.307, 1.462, 1.598, 1.588, 1.638, 1.690, 1.818, 1.917, 1.935, 1.960)
advogados =c(21.268, 21.362, 22.254, 23.134, 23.698, 24.367, 24.930, 25.632, 26.459, 27.227, 27.457)

cor.test(acidentes,advogados,method = "pearson")
#data:  acidentes and advogados
#t = 16.65, df = 9, p-value = 4.543e-08
#alternative hypothesis: true correlation is not equal to 0
#95 percent confidence interval:
#  0.9381057 0.9960129
#sample estimates:
#  cor 
#0.9841526 
#valor próximo de 1, há uma correlação positiva.Essa correlação existe porque os dados variam proporcionalmente, contudo não significa relação de causa e efeito

plot(acidentes,advogados)

