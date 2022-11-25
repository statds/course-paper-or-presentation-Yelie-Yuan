pdf(file = "full_graph.pdf", width = 4, height = 4)
par(mar=c(0,0,0,0)+0.1)
plot(make_full_graph(6),
     vertex.color = "lightblue", 
     vertex.size = 40, edge.width = 5, vertex.label = NA)
dev.off()

assortativity.degree(make_full_graph(6))

pdf(file = "star_graph.pdf", width = 4, height = 4)
par(mar=c(0,0,0,0)+0.1)
plot(make_star(6, mode = "undirected"),
     vertex.color = "lightblue", 
     vertex.size = 40, edge.width = 5, vertex.label = NA)
dev.off()

assortativity.degree(make_star(6, mode = "undirected"))


edgelist0 <- matrix(c(
  1, 3,
  1, 4,
  3, 2,
  2, 4,
  1, 6, 
  7, 2, 
  8, 2
), ncol = 2, byrow = TRUE)

edgelist1 <- matrix(c(
  1, 3,
  1, 2,
  3, 4,
  2, 4,
  1, 6, 
  7, 2, 
  8, 2
), ncol = 2, byrow = TRUE)

unlist(wdnet::assortcoef(edgelist0))
unlist(wdnet::assortcoef(edgelist1))

