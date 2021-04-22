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



