
install.packages('Distance')
library('Distance')
data(sparrowDetectionData)

install.packages('dplyr')
library('dplyr')
sparrowDetectionData = rename(sparrowDetectionData, 'distance' = 'sightdist')

sparrowDetectionData = rename(sparrowDetectionData, 'Sample.Label' = 'groupsize')
sparrowDetectionData = subset(sparrowDetectionData, select = -(siteID))
sparrowDetectionData['Effort'] = 500
sparrowDetectionData['Area'] = 10000
Region.Label = rep(c('A', 'B'), each = 178)
sparrowDetectionData['Region.Label'] = Region.Label

----------------------------------------------------------------
install.packages('Rdistance')
library('Rdistance')

View(sparrowDetectionData)
??Distance
??Rdistance
  
hist(sparrowDetectionData$distance, xlab="dist", 
     main="Sparrow line transects")

sparrow.hn <- ds(data=sparrowDetectionData, key="hn", adjustment=NULL,truncation=150)
summary(sparrow.hn)

