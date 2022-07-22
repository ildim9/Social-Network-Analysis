
require(igraph)
require(ggplot2)
setwd("C:\\Users\\elgr9\\OneDrive\\Desktop\\Assignment_2_SNA")

#### IMPORTING THE DATASETS 


d_2016 <- read.csv("d2016.csv",header = FALSE)
colnames(d_2016) <- c('from','to','weight')
View(d_2016)


d_2017 <- read.csv("d2017.csv",header = FALSE)
colnames(d_2017) <- c('from','to','weight')
View(d_2017)

d_2018 <- read.csv("d2018.csv",header = FALSE)
colnames(d_2018) <- c('from','to','weight')
View(d_2018)

d_2019 <- read.csv("d2019.csv",header = FALSE)
colnames(d_2019) <- c('from','to','weight')
View(d_2019)

d_2020 <- read.csv("d2020.csv",header = FALSE)
colnames(d_2020) <- c('from','to','weight')
View(d_2020)

g_2016 <- graph_from_data_frame(d_2016, directed=FALSE,vertices = NULL)
g_2017 <- graph_from_data_frame(d_2017, directed=FALSE,vertices = NULL)
g_2018 <- graph_from_data_frame(d_2018, directed=FALSE,vertices = NULL)
g_2019 <- graph_from_data_frame(d_2019, directed=FALSE,vertices = NULL)
g_2020 <- graph_from_data_frame(d_2020, directed=FALSE,vertices = NULL)


is.simple(g_2016) #TRUE
is.simple(g_2017) #TRUE
is.simple(g_2018) #TRUE
is.simple(g_2019) #TRUE
is.simple(g_2020) #TRUE

is.weighted(g_2016) #TRUE
is.weighted(g_2017) #TRUE
is.weighted(g_2018) #TRUE
is.weighted(g_2019) #TRUE
is.weighted(g_2020) #TRUE


###### TASK2 ###################################

########## PLOT FOR VERTICES ##################
v16<-gorder(g_2016)
v16
v17<-gorder(g_2017)
v17
v18<-gorder(g_2018)
v18
v19<-gorder(g_2019)
v19
v20<-gorder(g_2020)
v20


years<-c("2016","2017","2018","2019","2020")
vertices<-c(v16,v17,v18,v19,v20)
vert_plot<-as.data.frame(cbind(years,vertices))
vert_plot

vert_plot$vertices <- as.numeric(vert_plot$vertices)

ggplot(data=vert_plot, aes(x=years, y=vertices, fill=years),xlab=("years"),ylab=("Vertices")) +
  geom_bar(stat = "identity") +
  ggtitle("5 year Evolution of Vertices") + 
  geom_text(aes(label = vertices), vjust = -0.2) + theme_bw()
 

########## PLOT FOR EDGES ##################

e16<-gsize(g_2016)
e16
e17<-gsize(g_2017)
e17
e18<-gsize(g_2018)
e18
e19<-gsize(g_2019)
e19
e20<-gsize(g_2020)
e20


edges<-c(e16,e17,e18,e19,e20)
edge_plot<-as.data.frame(cbind(years,edges))
edge_plot

edge_plot$edges <- as.numeric(edge_plot$edges)


ggplot(data=edge_plot, 
       aes(x=years, y=edges, fill=years),
       xlab=("years"),
       ylab=("Edges")) +
  geom_bar(stat = "identity") +
  ggtitle("5 year Evolution of Edges") + 
  geom_text(aes(label = edges), vjust = -0.2)+ 
  theme_bw()


########## PLOT FOR DIAMETER ##################

d16<-diameter(g_2016,directed=FALSE)
d16
d17<-diameter(g_2017,directed=FALSE)
d17
d18<-diameter(g_2018,directed=FALSE)
d18
d19<-diameter(g_2019,directed=FALSE)
d19
d20<-diameter(g_2020,directed=FALSE)
d20

diameters<-c(d16,d17,d18,d19,d20)
diam_plot<-as.data.frame(cbind(years,diameters))

diam_plot$diameters <- as.numeric(diam_plot$diameters)

ggplot(data=diam_plot, 
       aes(x=years, y=diameters, fill=years),
       xlab=("years"),
       ylab=("diameters")) +
  geom_bar(stat = "identity") +
  ggtitle("5 year Evolution of Diameter") + 
  geom_text(aes(label = diameters), vjust = -0.2) + 
  theme_bw()


########## PLOT FOR AVG DEGREE ##################

average_degree<-c(mean(degree(g_2016, v = V(g_2016), mode = c("all"),
                         loops = FALSE, normalized = FALSE)),
             mean(degree(g_2017, v = V(g_2017), mode = c("in"),
                         loops = FALSE, normalized = FALSE)),
             mean(degree(g_2018, v = V(g_2018), mode = c("in"),
                         loops = FALSE, normalized = FALSE)),
             mean(degree(g_2019, v = V(g_2019), mode = c("in"),
                         loops = FALSE, normalized = FALSE)),
             mean(degree(g_2020, v = V(g_2020), mode = c("in"),
                         loops = FALSE, normalized = FALSE)))

average_degree <- round(average_degree,2)


avg_degree <- as.data.frame(cbind(average_degree,years))


avg_degree$average_degree <- as.numeric(avg_degree$average_degree )

ggplot(data=avg_degree, aes(x=years, y=average_degree, group=1)) +
  geom_line(color="red")+
  geom_point() +  
  ggtitle("5 year Evolution of Average Degree") + 
  geom_text(aes(label = average_degree), vjust = -0.2) + theme_bw()


ggplot(data=avg_degree, 
       aes(x=years, y=average_degree, fill=years),
       xlab=("years"),
       ylab=("average_degree")) +
  geom_bar(stat = "identity") +
  ggtitle("5 year Evolution of Average Degree") + 
  geom_text(aes(label = average_degree), vjust = -0.2)+ 
  theme_bw()


########################### TASK3 ###################################
################ DEGREE ######################
  
  d2016 <- as.data.frame(head(sort(degree(g_2016,loops = FALSE,mode = 'all'), decreasing = TRUE),10))
  colnames(d2016) <- c("Degree Score 2016")
  d2016
  d2017 <- as.data.frame(head(sort(degree(g_2017,loops = FALSE,mode = 'all'), decreasing = TRUE),10))
  colnames(d2017) <- c("Degree Score 2017")
  d2017
  d2018 <- as.data.frame(head(sort(degree(g_2018,loops = FALSE,mode = 'all'), decreasing = TRUE),10))
  colnames(d2018) <- c("Degree Score 2018")
  d2018
  d2019 <- as.data.frame(head(sort(degree(g_2019,loops = FALSE,mode = 'all'), decreasing = TRUE),10))
  colnames(d2019) <- c("Degree Score 2019")
  d2019
  d2020 <- as.data.frame(head(sort(degree(g_2020,loops = FALSE,mode = 'all'), decreasing = TRUE),10))
  colnames(d2020) <- c("Degree Score 2020")
  d2020

############## PAGE RANK ####################

page_rank_2016 <- page_rank(
  g_2016,
  algo = "prpack",
  directed = FALSE,
  damping = 0.85,
  personalized = NULL,
  options = NULL)

page_rank_2016_sort <- as.data.frame(head(sort(page_rank_2016$vector,decreasing = TRUE),10))
colnames(page_rank_2016_sort) <- c("PageRank Score 2016")
page_rank_2016_sort

page_rank_2017 <- page_rank(
  g_2017,
  directed = FALSE,
  damping = 0.85,
  personalized = NULL,
  algo = "prpack",
  options = NULL)


page_rank_2017_sort <- as.data.frame(head(sort(page_rank_2017$vector,decreasing = TRUE),10))
colnames(page_rank_2017_sort) <- c("PageRank Score 2017")
page_rank_2017_sort  

page_rank_2018 <- page_rank(
  g_2018,
  algo = "prpack",
  directed = FALSE,
  damping = 0.85,
  personalized = NULL,
  options = NULL)

page_rank_2018_sort <- as.data.frame(head(sort(page_rank_2018$vector,decreasing = TRUE),10))
colnames(page_rank_2018_sort) <- c("PageRank Score 2018")
page_rank_2018_sort

page_rank_2019 <- page_rank(
  g_2019,
  algo = "prpack",
  directed = FALSE,
  damping = 0.85,
  personalized = NULL,
  options = NULL)

page_rank_2019_sort <- as.data.frame(head(sort(page_rank_2019$vector,decreasing = TRUE),10))
colnames(page_rank_2019_sort) <- c("PageRank Score 2019")
page_rank_2019_sort

page_rank_2020 <- page_rank(
  g_2020,
  algo = "prpack",
  directed = FALSE,
  damping = 0.85,
  personalized = NULL,
  options = NULL)

page_rank_2020_sort <- as.data.frame(head(sort(page_rank_2020$vector,decreasing = TRUE),10))
colnames(page_rank_2020_sort) <- c("PageRank Score 2020")
page_rank_2020_sort

################### TASK 4 #########################################

############ CLUSTERING ####################
#### METHOD 1

start.time <- Sys.time()

louvain2016 <- cluster_louvain(g_2016)
louvain2016
louvain2017 <- cluster_louvain(g_2017)
louvain2017
louvain2018 <- cluster_louvain(g_2018)
louvain2018
louvain2019 <- cluster_louvain(g_2019)
louvain2019
louvain2020 <- cluster_louvain(g_2020)
louvain2020

end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken
##################################

#### METHOD 2

start.time <- Sys.time()

fast_greedy2016 <- cluster_fast_greedy(g_2016)
fast_greedy2016
fast_greedy2017 <- cluster_fast_greedy(g_2017)
fast_greedy2017
fast_greedy2018 <- cluster_fast_greedy(g_2018)
fast_greedy2018
fast_greedy2019 <- cluster_fast_greedy(g_2019)
fast_greedy2019
fast_greedy2020 <- cluster_fast_greedy(g_2020)
fast_greedy2020

end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken
###############################
#### METHOD 3
start.time <- Sys.time()

infomap2016 <- cluster_infomap(g_2016)
infomap2016
infomap2017 <- cluster_infomap(g_2017)
infomap2017
infomap2018 <- cluster_infomap(g_2018)
infomap2018
infomap2019 <- cluster_infomap(g_2019)
infomap2019
infomap2020 <- cluster_infomap(g_2020)
infomap2020


end.time <- Sys.time()
time.taken <- end.time - start.time
time.taken

################ choosing the fast_greedy2016 method and Irwin King #######################

m16 <-membership(fast_greedy2016)['Christos Faloutsos']
m16
m17 <-membership(fast_greedy2017)['Christos Faloutsos']
m17
m18 <-membership(fast_greedy2018)['Christos Faloutsos']
m18
m19 <-membership(fast_greedy2019)['Christos Faloutsos']
m19
m20 <-membership(fast_greedy2020)['Christos Faloutsos']
m20

############# Similarities of the communities of the Christos Faloutsos belongs to 

l2016 <- length(fast_greedy2016[[6]]) # 78 authors in this community in 2016
l2016
l2017 <- length(fast_greedy2017[[51]]) # 120 authors in this community in 2017
l2017 
l2018 <- length(fast_greedy2018[[203]]) # 23 authors in this community in 2018
l2018
l2019 <- length(fast_greedy2019[[4]])   # 64 authors in this community in 2019
l2019
l2020 <-length(fast_greedy2020[[2]]) # 316 authors in this community in 2020
l2020

community_size <- c(l2016,l2017,l2018,l2019,l2020)
avg_degree$community_size <- as.numeric(avg_degree$community_size )

community_size_evolution <- as.data.frame(cbind(community_size,years))
community_size_evolution
community_size_evolution$community_size <- as.numeric(community_size_evolution$community_size )

ggplot(data=community_size_evolution, aes(x=years, y=community_size, group=1)) +
  geom_line(color="red")+
  geom_point() +  
  ggtitle("5 year Evolution of the Communities Christos Faloutsos belongs to ") + 
  geom_text(aes(label = community_size), vjust = -0.2) + theme_bw()
##### or 
ggplot(data=community_size_evolution, 
       aes(x=years, y=community_size, fill=years),
       xlab=("years"),
       ylab=("community_size")) +
  geom_bar(stat = "identity") +
  ggtitle("5 year Evolution of the Communities Christos Faloutsos belongs to ") + 
  geom_text(aes(label = community_size), vjust = -0.2) + 
  theme_bw()

# Now we have to find the common attributes between these communities in those years 

# the 2016 and 2017 communities have only "Christos Faloutsos" in common 
i2016_2017 <- intersect(unlist(fast_greedy2016[6]),unlist(fast_greedy2017[51]))
i2016_2017
i2017_2018 <-intersect(unlist(fast_greedy2017[51]),unlist(fast_greedy2018[203]))
i2017_2018
i2018_2019 <- intersect(unlist(fast_greedy2018[203]),unlist(fast_greedy2019[4]))
i2018_2019
i2019_2020 <- intersect(unlist(fast_greedy2019[4]),unlist(fast_greedy2020[2]))
i2019_2020 


i2016_to_2018 <- intersect(i2016_2017,i2017_2018)
i2016_to_2018
i2016_to_2019 <- intersect(i2016_to_2018,i2018_2019)
i2016_to_2019
i2016_to_2020 <- intersect(i2018_2019 ,i2019_2020)
i2016_to_2020




##### COLORING THE COMMUNITIES ################

V(g_2016)$color <- factor(membership(fast_greedy2016))
V(g_2017)$color <- factor(membership(fast_greedy2017))
V(g_2018)$color <- factor(membership(fast_greedy2018))
V(g_2019)$color <- factor(membership(fast_greedy2019))
V(g_2020)$color <- factor(membership(fast_greedy2020))

#Year 2016 plot 

com_2016 <-unlist(fast_greedy2016[sizes(fast_greedy2016) > 20 & sizes(fast_greedy2016) < 50])
com_graph_2016 <- subgraph(g_2016, com_2016)
plot(com_graph_2016,
     vertex.label = NA,
     edge.arrow.width = 0.5, 
     edge.arrow.size = 0.2, 
     vertex.size = 3.5,
     main='Community Graph For 2016')


#Year 2017 plot 

com_2017 <-unlist(fast_greedy2017[sizes(fast_greedy2017) > 20 & sizes(fast_greedy2017) < 50])
com_graph_2017 <- subgraph(g_2017, com_2017)
plot(com_graph_2017, 
     vertex.label = NA, 
     edge.arrow.width = 0.5, 
     edge.arrow.size = 0.2,
     vertex.size = 3.5,
     main='Community Graph For 2017')


#Year 2018 plot 

com_2018 <-unlist(fast_greedy2018[sizes(fast_greedy2018)> 20 & sizes(fast_greedy2018) < 50])
com_graph_2018 <- subgraph(g_2018, com_2018)
plot(com_graph_2018, 
     vertex.label = NA, 
     edge.arrow.width = 0.5,
     edge.arrow.size = 0.2,
     vertex.size = 3.5,
     main='Community Graph For 2018')

#Year 2019 plot 

com_2019 <-unlist(fast_greedy2019[sizes(fast_greedy2019) > 20 & sizes(fast_greedy2019) < 50])
com_graph_2019 <- subgraph(g_2019, com_2019)
plot(com_graph_2019, 
     vertex.label = NA,
     edge.arrow.width = 0.5, 
     edge.arrow.size = 0.2, 
     vertex.size = 3.5,
     main='Community Graph For 2019')


#Year 2020 plot 

com_2020 <-unlist(fast_greedy2020[sizes(fast_greedy2020) > 20 & sizes(fast_greedy2020) < 50])
com_graph_2020 <- subgraph(g_2020, com_2020)
plot(com_graph_2020, 
     vertex.label = NA,
     edge.arrow.width = 0.5, 
     edge.arrow.size = 0.5,
     vertex.size = 3.5,
     main='Community Graph For 2020')











