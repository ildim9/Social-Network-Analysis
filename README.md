# Social-Network-Analysis

# Network Analysis and Visualization with R and igraph 

#### Problem
## 1 ‘A Song of Ice and Fire’ network
Your first task is create an igraph graph1 using the network of the characters
of ’A Song of Ice and Fire’ by George R. R. Martin [1]. A .csv file with the list
of edges of the network is available online.2 You should download the file and
use columns Source, Target, and Weight to create an undirected weighted
graph. For your convenience, you are free to make any transformations you
think are appropriate to the file.
## 2 Network Properties
Next, having created an igraph graph, you will explore its basic properties and
write code to print:
* Number of vertices
* Number of edges
* Diameter of the graph
* Number of triangles
* The top-10 characters of the network as far as their degree is concerned
* The top-10 characters of the network as far as their weighted degree is concerned

## 3 Subgraph
After that, your task is to plot the network:
You will first plot the entire network. Make sure you set the plot parameters
appropriately to obtain an aesthetically pleasing result. For example, you can
opt not to show the nodes’ labels (vertex.label = NA) and set a custom value for
parameters: edge.arrow.width, and vertex.size. Feel free to configure additional
parameters that may improve your visualization results.
Then, you will create a subgraph of the network, by discarding all vertices that
have less than 10 connections in the network, and plot the subgraph.
In addition to the above plots, you are also asked to write code that calculates
the edge density of the entire graph, as well as the aforementioned subgraph,
and provide an explanation on the obtained results (a few sentences in your
report).

## 4 Centrality
Next, you will write code to calculate and print the top-15 nodes according to
the:
* closeness centrality
* betweenness centrality
In addition, you are asked to find out where the character Jon Snow is ranked
according to the above two measures and provide an explanation (a few sen-
tences) of the observations you make after examining your results.

## 5 Ranking and Visualization
In the final step of this project your are asked to rank the characters of the
network with regard to their PageRank value.
You will write code to calculate the PageRank values, and create a plot of the
graph that uses these values to appropriately set the nodes’ size so that the
nodes that are ranked higher are more evident.

# From raw data to temporal graph structure exploration

## 1 DBLP co-authorship graph
Your first task is create a weighted undirected graph with igraph,1 using raw
data from dblp. You will download a compressed file with conference proceed-
ings records listed in dblp. 2 The format of the file is the following:

*2003,"The link prediction problem for social networks.",CIKM,"David Liben-Nowell,Jon M. Kleinberg"
*2006,"Sampling from large graphs.",KDD,"Jure Leskovec,Christos Faloutsos"
*2010,"Measuring User Influence in Twitter.",ICWSM,"M. Cha,H. Haddadi,F. Benevenuto,P. Krishna Gummadi"
*2016,"Do Cascades Recur?",WWW,"Justin Cheng,Lada A. Adamic,Jon M. Kleinberg,Jure Leskovec"
*2016,"Big data security and privacy.",IEEE BigData,"Elisa Bertino".

In each line above, the first column indicates the year the paper was published,
the second column is the title of the paper, and the third column is the confer-
ence where the paper was presented. Finally, the fourth column of the line is a
comma separated list of the paper’s authors.

You will first manipulate the raw data with the programming language of your
choice to filter out all records that are not related to the five (5) conferences
listed above, e.g, CIKM, or are older than 5 years. Then, you will create a total
of 5 .csv files, one for each of the last 5 years, using the following format:

*from,to,weight
*author1,author2,5
*author1,author3,2
...

Each .csv file should describe the weighted undirected co-authorship graph for
the respective year, e.g., in the example above author1 has co-authored 5 papers
with author2, and 2 with author3.
Having created the .csv files it will be trivial to use them and create the re-
spective igraph graphs.
Your submission should include the code you used to create the .csv files (any
programming language), the code you used to create the igraph graphs (R) and
the 5 (compressed) .csv files.

## 2 Average degree over time
Your next task is to create plots that visualize the 5-year evolution of different
metrics for the graph. More specifically, you will create plots for:
* Number of vertices
* Number of edges
* Diameter of the graph
* Average degree (simple, not weighted)
What do you notice for each of the 5 above metrics? Are there significant
fluctuations during these five years?

## 3 Important nodes
Next, you will write to code to create and print data frames for the 5-year
evolution of the top-10 authors with regard to:
* Degree (simple, not weighted)
* PageRank
Again, provide short comments on your findings. Do you notice variations on
the top-10 lists for the different years.

## 4 Communities
Your final task is to perform community detection on the mention graphs. Try
applying fast greedy clustering, infomap clustering, and louvain clustering on
the 5 undirected co-authorship graphs. Are you able to get results with all
methods? Include a short comment on your report regarding the performance
of the 3 algorithms.
Then, pick one of the three methods as well as a random author that appears
in all 5 graphs and write code to detect the evolution of the communities this
user belongs to. Do you spot similarities in the communities?
Finally, you will create a visualization of the graph using a different color for
each community. Make sure to have a look at the sizes of the communities and
filter out all nodes that belong to very small or very large communities, in order
to create a meaningful and aesthetically pleasing visualization.

