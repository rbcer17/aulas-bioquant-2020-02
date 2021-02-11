## Biologia Quantitativa 2/2020
# Prof. Roberto Cavalcanti
# Aula 1
#. 1. Introducao


# O que ? o R?
# ? um software livre para fazer an?lise estat?stica e manipula??o de dados. 
# ? tamb?m uma linguagem de programa??o que utiliza pacotes com fun??es prontas. 


# Porque utilizar o R? 
# Porque ? um programa gratuito e tem in?meras colabora??es no mundo. 
# Graficos com alta qualidade.
# Linguagem de programa??o simples. 
# Voc? pode criar pacotes.
# ? um programa popular, ou seja, tem muito material de consulta e ajuda na internet!
  # Existem muitas apostilas, video-aulas, cursos e blogs sobre o R.
    # Comunidades de estudos do R. Ex: Stack Overflow, CRAN, Data Camp, etc.. 


# Mas a gente est? utilizando o RStudio..
  # O RStudio ? uma plataforma que facilita o uso do R. 


# As 4 janelas do RStudio


# 1. Script : Aqui escrevemos todas nossas an?lises, comandos, fun??es etc. O Script que ir? 
# salvar todo seu trabalho, como se fosse um caderno de comandos para as an?lises realizadas. 


# 2. Console : Todas as opera??es seram resolvidas no comando. As fun??es do script ser?o 
# resolvidas no comando. Lembre que o comando n?o salva nenhuma fun??o. 


# 3. Environment : Nesta janela aparecem todos os objetos que voc? criou nas suas an?lises. 
# Ela lista os objetos e descreve cada objeto. O History ? uma copia do console, voc? pode 
# salvar as opera??es e suas respostas.


# 4. Files, Plots, Packages, Help, Viewer : 
# 4.1.Files: Todos seus arquivos R utilizados recentemente aparecer?o nesta janela.
# 4.2.Plots: Janela para gr?ficos.
# 4.3.Packages: Mostra os pacotes que voc? tem instalados no seu R e permite baixar e procurar
# pacotes. 
# 4.4.Viewer: Janela para ver arquivos da internet. 


#### 
## Pr?tica em R


# Primeiramente, sempre crie uma pasta espec?fica para suas an?lises. Nesta pasta voc? pode
# salvar tanto as an?lises feitas com o R e seus dados brutos. 
  # Para isso, vamos escolher a pasta com setwd()


setwd("~/Academicos/Ciencias Biologicas/7 Semestre/Monitoria - Topicos em Zoologia 2")
# ou
# CTR + SHIFT + H (Session -> Set Working Directory -> Choose Directory)


####


# Uso basico ----
# Opera??es b?sicas


# Com CTR + ENTER ou CTR + R ou RUN (na parte superior direita do script)
# Jogo da velha: Nos permite fazer anota??es sem interferir no script e no comando.


##### 
# Fun??es
# Desempenham alguma utilidade matem?tica no ambiente R


# Um argumento ? aquilo que est? dentro do par?ntese ()
# Existem fun??es no R que voc? pode utilizar mais de um argumento.


log(x=100, base=10)


# Voc? n?o precisa especificar o nome do argumento se ele estiver na ordem certa


log(100, 10)
log(10, 100) # Se colocar em ordem diferente o resultado tambem sera diferente. 


##### 
## Atributos/objetos


# O R armazena dados e/ou resultados em "objetos"
# Para criar um objeto utilize a "<-" ou "="
3+2+5
soma <- 3+2+5 
soma


## Fun??es podem ser guardadas como objetos tambem 
4.3/5.6
divisao <- 4.3/5.6 


divisao 


## Note que o R ? sens?vel a letras maiusculas
Divisao # Error: object 'V' not found


## Podemos criar objetos utilizando outros objetos!
peso <- 4.3
altura <- 5.6
pesoaltura<- (peso/altura) 
pesoaltura
# Lembre-se que o R est? programado em ingles, assim nossa virgula ? trocada pelo ponto.
4.4 # 4,4
4,4 # 4 e 4


####
## Tipos de objetos ----


# 1. VETOR


# Vamos concatenar c() os elementos (neste caso n?meros) para criar um vetor 
vetor1 <- c(2,3,4,5)
vetor2 <- c(3,6,8,9)


# Deletar objetos rm()
rm(vetor1) 


# Procurar os elementos do vetor
vetor1 <- c(2,3,4,5)
vetor2 <- c(3,6,8,9)


vetor1[2]          # Qual elemento esta na posi??o 2?
vetor1[c(1,2)]     # Quais s?o os elementos na posi??o 1 e 2?
vetor1[-2]         # Elimine o elemento da posi??o 2.
max(vetor1)        # Qual ? o maior valor do vetor 1?
min(vetor1)        # Qual ? o menor valor do vetor 1?
vetor1 == 3        # Em qual posi??o o elemento ? igual (==) a 3?
vetor1 !=3         # Em qual posi??o o elemento ? diferente (!=) de 3?
which(vetor1 == 3) # Em qual posi??o o vetor tem o valor igual a 3?


# 2. MATRIZ
# Tabela com n-linhas e n-colunas e um corpo com elementos.


matrix(1:6 , nrow = 3, ncol = 2) # De 1 a 6 (:)
matrix(c(3,5,11,10), nrow = 4, ncol = 2)
matriz1 <- matrix(vetor1, 5, 4)
matriz1


# Quando os elementos s?o escassos para o numero de linhas e colunas, o R repete os 
# elementos no corpo da matriz. 


# Procurar elementos dentro da matriz (parecido ao vetor!)


matriz1[1,1]     # Qual o elemento da linha 1 [1,] e coluna 1 [,1]?
matriz1[,3]      # Quais os elementos da coluna 3?
matriz1[3,]      # Quais os elementos da linha 3?
matriz1[1,] == 2 # Qual a posi??o do elemento igual a 2 na linha 1?
matriz1 != 4     # Quais as posi??es daqueles valores diferentes de 4?


colnames(matriz1) <- c("a", "b", "c", "d")
rownames(matriz1) <- c("e", "f", "g", "h", "i")
matriz1
matriz1["e","b"] 


# 3. TABELA


# 3.1. Data frame
# O Data frame ? uma tabela que coloca os dois vetores como colunas
tabexemplo <-data.frame(vetor1,vetor2)
tabexemplo


# Perguntamos ao R se nosso objeto ? um data frame 
is.data.frame(tabexemplo)


# 3.2 .Table
# A tabela ir? a criar classes (agrupar os mesmos elementos) e colocar o numero de elementos
# em cada classe. Se usa principalmente para calcular FREQU?NCIAS! 


# Ex.1 crie uma tabela com os seguintes dados: pessoas que gostam de fruta
# Vamos criar um vetor com caracteres ""
pessoas <-c("sim", "sim", "nao","nao","nao","sim")
table(pessoas)


# 4. Lista
# Cria uma lista com os valores sem junt?-los
list(vetor1)
list(vetor1,vetor1,vetor2,vetor2)


####
# Gr?ficos


# 1. Plot() 
# Gr?fico XY
plot(x = vetor1, y = vetor2)


peso <- c(60,72,57,90,95,73)
altura <- c(1.75,1.8,1.65,1.90,1.74,1.91)
plot(altura, peso, xlab="Altura", ylab= "Peso") 
# Cada posi??o corresponde a uma amostra(pessoa), precisa ter o mesmo n?mero de elementos. 
# Xlab e ylab: colocar a legenda nos eixos. Com main= colocamos o t?tulo do gr?fico!


# 2. Gr?fico de barra 


# Ex. 2: Um pesquisador capturou 12 peixes zebra com quatro tipos em rela??o ? suas listras, sendo 1) normais,
# 2) leopardo, 3) listras vermelhas e 4) albino


zebrafish <-c(1,1,3,1,2,1,1,4,1,3,4,1)
length(zebrafish) # Quantidade de elementos length() no vetor
table(zebrafish)  


barplot(zebrafish)


barplot(table(zebrafish))
# A fun??o "col=" dentro de uma fun??o de graficos serve para dar cor ao mesmo e, nesse caso, ?s barras.
# Como temos 4 barras, por termos 4 classes, queremos colocar cores diferentes para cada classe. Para isso
# usaremos a fun??o c(), concatenar, para atribuir cores ?s classes de modo que a sequencia das cores na fun??o
# col ser? respectiva ? sequ?ncia de cada classe pela fun??o table
# Notar que usando o barplot do table de zebrafish, ele nos mostra a frequ?ncia com que cada classe ocorre
# enquanto fazendo o barplot apenas de zebrafish ele nos mostra pelo plot a representa??o gr?fica do objeto.




####


## Pacotes ----
# Um pacote ? um conjunto de fun??es e dados dispon?veis na internet. 


install.packages("vegan") # Instalar o pacote
library(vegan)            # Carregar o pacote
require(vegan)            # Carregar o pacote


## HELP! 
# Utilizem sempre, o help que ir? a esclarecer como utilizar cada fun??o e ir? te mostrar
# o conteudo de cada pacote.
?vegan
??vegan # Dois signos de interroga??o para uma busca mais ampla.


# Dicas: Voc? pode fazer CTR + F para buscar palavras no script. 
#        Tem como compactar o script quando coloca qualquer simbolo 4 vezes seguidas 


######
## Estat?stica descritiva


# Vamos pegar um conjunto de dados chamado "Crabs" dentro do pacote MASS


library(MASS)


crabs


## M?dia 
# Valor que tem maior concentra??o de dados de uma distribui??o.
mean(abund)


## Mediana
# Valor que separa os dados na metade.
median(abund)


## Quartis
# Tr?s valores que dividem seus dados em 4 partes.
quantile(abund)
# 25% ? o primeiro quartil, 50% o segundo quartil e 75% o terceiro quartil


## Resumo - Summary()
# No summary() conseguimos visualizar os valores m?ximos, m?nimo, media, mediana, e quartis
summary(abund)