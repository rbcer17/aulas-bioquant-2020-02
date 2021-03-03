                      ### BIOLOGIA QUANTITATIVA 2/2020 ###

# Módulo 4 - Regressao Linear 
# Prof. Dr. Roberto Cavalcanti
# Monitoria: Ana Terra Guedes, Marcela Ponce, Vinícius Telheiro


#    1. Covariancia:

# Estimar o grau de variacao/associacao conjunta das variaveis.


#    1.1. Correlacao:

# Relacao entre duas variaveis continuas.
# Determinar se as variaveis sao idependentes ou covariantes, ou seja, 
# se a variacao de uma esta associada a variacao da outra. 

# Medida estatística que estima o grau de variacao (r)/associacao 
#linear entre duas variáveis, e se existe, qual sua magnitude e sinal.


#     1.2. Coeficiente de correlacao de Pearson (CCP)

# Tipo de associacao linear entre duas variaveis que 
# quantifica a medida de covariacao. 
# Utiliza coeficiente que varia de -1 a 1. 


#     1.3. Tipos de correlacao

# Correlacao positiva (1) : Aumento ou diminuicao das duas variaveis 
# em conjunto -> diretamente proporcional

# Correlacao negativa(-1) : Aumento da variavel implica na diminuicao 
# da outra e vice-versa -> inversamente proporcional

# Resultado proximo a 0?
# indica a independencia dos dados, menor o grau de correlacao.

#ATENCAO!
# A correlacao nao implica relacao de causa-efeito,
# mas sim quantifica o quanto duas variaveis estao relacionadas
# numericamente entre si, mesmo que nao haja dependencia entre elas.

# Portanto, as vezes e possivel observar uma correlacao numerica de 
# fenomenos factualmente nao relacionados -> 
# correlacao de duas variaveis independentes 

# Dependencia: Implica que ha uma variavel independente (causa) 
# e uma independente (efeito).
 

#    1.4. Exemplos

# Exemplo A:

amostra1 <- c(2,4,6,8,10,12)
amostra2 <- c(25,30,35,40,45,50)

?cor.test #teste de correlacao entre pares simples 
cor.test(amostra1, amostra2, method = "pearson")
plot(amostra1, amostra2) #variavel x (independente) seguida de y (dependente) 

cor(amostra1, amostra2) # Teste que somente retorna o valor da correlacao


# Exemplo B:

# Variaveis:
gosta_doce <- c(20,30,42,56,68,80)
n_gatos <- c(5.6,4.1,3,2.5,1.1,1)

cor.test(gosta_doce, n_gatos, method = "pearson")
plot(gosta_doce, n_gatos)


#     2. Regressao linear 

# Acessar a dependencia da variavel dependente em relacao a variavel indepente.
# Verifica causalidade
# Ajuste de um modelo que retorna uma equacao da reta


#     2.1. Premissas:

# 1) Distribuicao normal
# 2) Independencia das amostras
# 3) Homocedasticidade


#     2.2 Exemplo


# Tamanho do craneo de elefantes:
tamanho1 <- c(9.8,8.8,10.6,11.9,7,11.4,9.9,9.7,9.6,10.5)
tamanho2 <- c(18.7,19.2,21.1,22.5,20.2,19.4,19.6,20,20.2,19.2)
tamanho3 <- c(31.4,28.2,30.1,31.4,29.9,27.3,29.3,29.4,29.3,29.3)
tamanho4 <- c(38.3,38.9,42,41.9,39.3,38.8,38.7,39.5,39.9,40.6)


# Teste de normalidade:

shapiro.test(tamanho1)
shapiro.test(tamanho2)
shapiro.test(tamanho3)
shapiro.test(tamanho4)

# OU: 

# Cria-se um data frame com os dados...
shapiroTamanhos <- data.frame(tamanho1, tamanho2, tamanho3, tamanho4)
View(shapiroTamanhos)
# ...para aplicar o teste simultaneamente!
apply(shapiroTamanhos, 2, shapiro.test)
# funcao aplica teste/funcao escolhida para todas as colunas 
# identificadas na função pelo "2" , 
# ou linhas identificadas pelo "1" do data frame.


# Idade dos craneos de cada elefante:
idade <- c(rep(2,10),rep(4,10), rep(6,10), rep(8,10))
# Repete o número "2" 10 vezes, e igualmente para o 4, 5, 8.


# Tabela:

# Concatenamos os conjuntos de observacoes em um objeto
tamanho <- c(tamanho1, tamanho2, tamanho3, tamanho4)
View(tamanho) 
# Observar a diferença entre o formato retornado
# em "shapiroTamanhos" e "tamanho"

elefante <- data.frame(tamanho,idade)
plot(tamanho,idade)


# Homocedasticidade:

library(lawstat)
levene.test(elefante$tamanho, elefante$idade)

reg <- lm(tamanho~idade, data = elefante)
summary(reg)
# Retorna a equacao da reta (y = ax + b)
# a = angulo da reta, b = intercepto

# O mesmo resultado pode ser obtido pela anova!
anov <- aov(tamanho~idade, data = elefante)
summary(anov)


# Grafico:
plot(elefante$tamanho~elefante$idade)
abline(reg)
