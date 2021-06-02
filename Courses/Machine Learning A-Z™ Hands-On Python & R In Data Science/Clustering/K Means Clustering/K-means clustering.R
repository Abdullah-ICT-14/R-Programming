
# K- Means Clustering

## Importing the dataset
df=read.csv("Mall_Customers.csv")
df
x=df[4:5]
x


# Using the elbow method find the optimal cluster number
set.seed(42)
wcss <- vector()
for(i in 1:10) wcss[i] <- sum(kmeans(x,i)$withinss)
plot(1:10,wcss,type = 'b',main = paste('Clusters of Client'),xlab = 'Number of clusteer',ylab="wcss")



# Appling the KMeans to the dataset
set.seed(42)
kmean=kmeans(x,5,iter.max = 300,nstart = 10)
kmean


# Visualie the cluster
library(cluster)
clusplot(x,
         kmean$cluster,
         lines=0,
         shade = TRUE,
         color = TRUE,
         labels = TRUE,
         plotchar = FALSE,
         span = TRUE,
         main = paste('Clusters of Client'),
         xlab = 'Annual Income',
         ylab="Spending Score" )
         