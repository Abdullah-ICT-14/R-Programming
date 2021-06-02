
# Higherarchical Clustering

## Importing the dataset
df=read.csv("Mall_Customers.csv")
df
x=df[4:5]
x


# Using the dendrogram method find the optimal cluster number

dendrogram=hclust(dist(x,method = 'euclidean'),method = 'ward.D')
plot(dendrogram,
     main = paste("Dendrogram"),
     xlab = 'Customer',
     ylab = 'Euclidean distances'
     )
  
  
# Appling the Higherarchical clustering to the dataset

hc=hclust(dist(x,method = 'euclidean'),method = 'ward.D')
y_hc=cutree(hc,5)
y_hc

# Visualie the cluster
library(cluster)
clusplot(x,
         y_hc,
         lines=0,
         shade = TRUE,
         color = TRUE,
         labels = TRUE,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Client'),
         xlab = 'Annual Income',
         ylab="Spending Score" )
         