                       ### BIOLOGIA QUANTITATIVA 2/2020 ###
# MODULO 6 - Distribuicoes Espaciais
# Prof. Dr. Roberto Cavalcanti
# Monitoria: Ana Terra Guedes, Marcela Ponce, Vin?cius Telheiro


# Analizando distribui??es - dados sa?da #

# Lembram do que o professor ensinou na aula passada? 
# Ent?o, para verificar se os dados seguem uma distribui??o aleat?ria, 
# vamos gerar uma distribui??o aleat?ria esperada 
# baseada nos nossos dadoscom a ajuda da funcao "goodfit" do pacote "vcd" 

install.packages("vcd")
library(vcd)
??vcd

# Vamos gerar a distribui??o e realizar o teste de qui quadrado, para
# verificar a hip?tese de que os dados seguem uma distribui??o de poisson.

# Verificamos primeiro com a poisson pois, caso a distribui??o
# seja de poisson, significa que a distribui??o ? aleat?ria, portanto
# tende a n?o seguir padr?es.

# Confirmando isso, sabemos que segue um padr?o e,podemos ir atras dele. 

# Em distribui??es uniformes temos -> 
# media MAIOR (ou ligeiramente menor) que a variancia,
# sendo que a divisao media/variancia > 1 

# Ja em uma distribuicao agregada ->
# media MENOR que variancia,
# sendo que a divisao media/variancia <1.


# DADOS:

extinctData = read.csv(url("http://whitlockschluter.zoology.ubc.ca/wp-content/data/chapter08/chap08e6MassExtinctions.csv"))
# Criar objeto do tipo tabela a partir de link da internet

View(extinctData)
?goodfit

# Permite verificar a qualidade do ajuste dos seus dados 
# as seguintes distribuicoes discretas:
# Poisson, binomial ou binomial negativa (Pascal).
# Distribuicoes discretas = descreve a probabilidade de ocorrencia 
# de cada valor de uma variavel aleatoria discreta (contagem).


binomialfit = goodfit(extinctData$numberOfExtinctions,type = "binomial")
plot(binomialfit)
summary(binomialfit)


# A distribuicao usada deve ser explicitada 

View(poissonfit)

# Histograma:
# Permite fazer uma inspecao vizual da distribui??o

hist(extinctData$numberOfExtinctions)

# Essa distribui??o parece aleatoria? não

# Para verificarmos o resultado do qui quadrado (goodfit) usamos o summary

summary(poissonfit)
# P > ou < que 0.05?
# Portanto aceitamos ou rejeitamos H0? rejeita H nula