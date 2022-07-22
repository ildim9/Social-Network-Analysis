getwd()


setwd("C:\\Users\\elgr9\\OneDrive\\Desktop\\Social_Network_Analysis_Assignment_1")

#QUESTION 1
require(igraph)
got_edges <- read.csv("asoiaf-all-edges.csv")

got_edges$Type <- NULL
got_edges$id <- NULL


got <- graph_from_data_frame(got_edges, directed=FALSE)

# directed = True gia directed grafo

is.simple(got) # the output is true meaning that we have a undirected graph without loops or multiple edges 

plot(got)


#QUESTION 2 

#Number of vertices

gorder(got) # 796

#Number of edges

gsize(got) # 2823

#Diameter of the graph
#The diameter of a graph is the length of the longest geodesic. 

diameter(got,directed=FALSE)

# Number of triangles

sum(count_triangles(got))/3

# equivalent with 

length(triangles(got))/3


# The top-10 characters of the network as far as their degree is concerned

head(sort(degree(got,loops = FALSE), decreasing = TRUE),10)

# The top-10 characters of the network as far as their WEIGHTED degree is concerned

head(sort(strength(got,loops = FALSE), decreasing = TRUE),10)

# QUESTION 3 Subgraph

#Entire network.
plot(got,
     vertex.color="red", 
     vertex.label = NA, 
     edge.arrow.width=15, 
     vertex.size=3,
     main='Entire Network Visualization', 
     edge.arrow.size=4)


# Making a subgraph of the network, by discarding all vertices that
# have less than 10 connections in the network, and plot the sub graph
# v(got) the unique vertices of the graph 

subgraph<-delete.vertices(got, V(got)[ degree(got) < 10])


plot(subgraph,
     vertex.label = NA,
     vertex.color="yellow",
     vertex.shape="circle", 
     edge.arrow.size = 0.5, 
     edge.color="gray", 
     edge.width=0.4,
     vertex.size = 4,
     main="Subgraph plot with more than 10 connections")

# Density Calculation

edge_density(got, loops = FALSE)
edge_density(subgraph,loops = FALSE)

# QUESTION 4 


#Centality Calculation 


head(sort(closeness(got),decreasing = TRUE),15) # John Snow 10th


#Between Calculation

head(sort(betweenness(got),decreasing = TRUE),15) # John Snow 1rst 


# QUESTION 5 Ranking and Visualization

page_rank <- page_rank(
  got,
  directed = FALSE,
  damping = 0.85,
  personalized = NULL,
  options = NULL, weights = E(got)$weights
)

vertex.size=page_rank$vector*600 #Node's Size
plot(got,
     vertex.label = NA,
     edge.color="#FFCCFF",
     edge.arrow.width=0.9,
     vertex.size=vertex.size,main="Page Rank Visualization")
















