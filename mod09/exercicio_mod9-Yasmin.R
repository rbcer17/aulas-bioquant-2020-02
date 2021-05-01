#Pacotes
library('Rdistance')
library('dplyr')
library('Distance')

#Dados
data(sparrowDetectionData)

#Correcoes na tabela
sparrowDetectionData = rename(sparrowDetectionData, 'distance' = 'sightdist')
sparrowDetectionData = rename(sparrowDetectionData, 'Sample.Label' = 'groupsize')
sparrowDetectionData = subset(sparrowDetectionData, select = -(siteID))
sparrowDetectionData['Effort'] = 500
sparrowDetectionData['Area'] = 10000
Region.Label = rep(c('A', 'B'), each = 178)
sparrowDetectionData['Region.Label'] = Region.Label

#Calculo da abundancia e da densidade observada e estimada
hist(sparrowDetectionData$dist, col="grey", main="",
     xlab="distance (m)")

sparrow_hn <- ds(sparrowDetectionData, truncation = 150)

summary(sparrow_hn)
