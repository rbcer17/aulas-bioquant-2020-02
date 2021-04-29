# Para a pr?tica dessa semana usaremos os dados de detec??o de pardais no pacote Rdistance
# Backstory: Voc?, e um estagi?rio (chamado Valdisnei) fizeram um transecto de linha para se detectar pardais
# em arvores, com o intuito de descobrir a abund?ncia dele. Para isso Valdisnei montou uma tabela, na qual
# sigthdist ? a dist?ncia do pardal do transecto e sightangle ? o angulo de vis?o para detecta-lo 
# (relacionado ? altura da arvore).

install.packages('Rdistance')
library('Rdistance')
data(sparrowDetectionData)

# Primeiro vamos corrigir o erro do Valdisney e renomear a coluna para distancia usando a fun??o rename do pacote dplyr

install.packages('dplyr')
library('dplyr')
sparrowDetectionData = rename(sparrowDetectionData, 'distance' = 'sightdist')

# Aparentemente, Valdisney fez mais erros que o esperado (e n?o merece ter o nome homenageando alguem que acertou muito)
# ent?o vamos mudar mais nomes de colunas e criar outras chamadas ?rea, effort e separar os pardais em dois grupos chamados A e B.
# Tamb?m iremos apagar a coluna de siteID que ele criou sem querer.
# "foi mal gente" Valdisney, 2021

sparrowDetectionData = rename(sparrowDetectionData, 'Sample.Label' = 'groupsize')
sparrowDetectionData = subset(sparrowDetectionData, select = -(siteID))
sparrowDetectionData['Effort'] = 500
sparrowDetectionData['Area'] = 10000
Region.Label = rep(c('A', 'B'), each = 178)
sparrowDetectionData['Region.Label'] = Region.Label

# Agora ? com voc?s, calculem a densidade e a abund?ncia observada e estimada para os grupos de pardal (lembrando de desconsideirar as detec??es que as dist?ncias forem maior q 150 m).
----------------------------------------------------------------

install.packages('Rtools')
View(sparrowDetectionData)
??RDistance

sum(!is.na(sparrowDetectionData$distance)) #mostra as distâncias que não estão faltando na tabela
hist(sparrowDetectionData$distance, xlab="dist", 
     main="Sparrow line transects")
conversion.factor <- convert_units("meter", "kilometer", "hectare")


sparrow.hn <- ds(data=sparrowDetectionData, key="hn", adjustment=NULL,
              transect="line", convert.units=conversion.factor, truncation="distance>150")
summary(sparrow.hn)

