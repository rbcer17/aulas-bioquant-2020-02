# Load data
install.packages("cluster")
library(cluster)
install.packages("vegan")
library(vegan)

data(animals)
View(animals)
head(animals, 3)
tail(animals, 50)
# log transform 

ir.species <- animais1[, 5]
View(ir.species)

#Elimina dados com NA
animais1<-animals[1:10,]

# apply PCA - scale. = TRUE is highly 
# advisable, but default is FALSE. 
ir.pca <- prcomp(animais1,
                 center = TRUE,
                 scale. = TRUE) 
# print method
print(ir.pca)
# plot method
plot(ir.pca, type = "l")
# summary method
summary(ir.pca)
# Predict PCs
predict(ir.pca, 
        newdata=tail(animais1, 2))
library(devtools)
#install_github("ggbiplot", "vqv")
install_github("vqv/ggbiplot")
force=TRUE

library(ggbiplot)
g <- ggbiplot(ir.pca, obs.scale = 1, var.scale = 1, 
              groups = ir.species , ellipse = TRUE, 
              circle = TRUE)
print(g)
