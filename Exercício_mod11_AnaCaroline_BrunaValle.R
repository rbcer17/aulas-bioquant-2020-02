library(vegan)
library(MASS)
data (iris)
View(iris)

iris1 <- iris[,1:4]

# 1. Matriz:
d <-vegdist(iris1, method = "bray") 
d

# 2. Cluster hierarquico com Bray-Curtis
cluster1 <- hclust(d, method = "average")
plot(cluster1)
dendro.cluster1 <- as.dendrogram(cluster1) 
plot(dendro.cluster1)
rect.hclust(cluster1, h = 0.40)
