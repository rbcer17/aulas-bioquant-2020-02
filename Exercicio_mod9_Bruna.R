# Para a prática dessa semana usaremos os dados de detecção de pardais no pacote Rdistance
# Backstory: Você, e um estagiário (chamado Valdisnei) fizeram um transecto de linha para se detectar pardais
# em arvores, com o intuito de descobrir a abundância dele. Para isso Valdisnei montou uma tabela, na qual
# sigthdist é a distância do pardal do transecto e sightangle é o angulo de visão para detecta-lo 
# (relacionado à altura da arvore).
install.packages('Rdistance')
library('Rdistance')
data(sparrowDetectionData)
# Primeiro vamos corrigir o erro do Valdisney e renomear a coluna para distancia usando a função rename do pacote dplyr
install.packages('dplyr')
library('dplyr')
sparrowDetectionData = rename(sparrowDetectionData, 'distance' = 'sightdist')
# Aparentemente, Valdisney fez mais erros que o esperado (e não merece ter o nome homenageando alguem que acertou muito)
# então vamos mudar mais nomes de colunas e criar outras chamadas área, effort e separar os pardais em dois grupos chamados A e B.
# Também iremos apagar a coluna de siteID que ele criou sem querer.
# "foi mal gente" Valdisney, 2021
sparrowDetectionData = rename(sparrowDetectionData, 'Sample.Label' = 'groupsize')
sparrowDetectionData = subset(sparrowDetectionData, select = -(siteID))
sparrowDetectionData['Effort'] = 500
sparrowDetectionData['Area'] = 10000
Region.Label = rep(c('A', 'B'), each = 178)
sparrowDetectionData['Region.Label'] = Region.Label
# Agora é com vocês, calculem a densidade e a abundância observada e estimada para os grupos de pardal (lembrando de desconsideirar as detecções que as distâncias forem maior q 150 m).
View(sparrowDetectionData)
install.packages("Distance")
library("Distance")
Pardais <- ds(sparrowDetectionData, truncation=150)
summary(Pardais)

##Abundance:
#Label  Estimate   se(Observada)        cv         lcl        ucl       df
#1     A  8.593233 8.084291 0.9407741 0.000874921 84400.3725 1.042504
#2     B  5.597125 5.211597 0.9311203 0.213221218   146.9263 2.086835
#3 Total 14.190358 9.709285 0.6842170 0.982229817   205.0093 1.996707

#Density:
#Label     Estimate   se(observada)        cv          lcl        ucl       df
#1     A 0.0008593233 0.0008084291 0.9407741 8.749210e-08 8.44003725 1.042504
#2     B 0.0005597125 0.0005211597 0.9311203 2.132212e-05 0.01469263 2.086835
#3 Total 0.0007095179 0.0004854642 0.6842170 4.911149e-05 0.01025047 1.996707