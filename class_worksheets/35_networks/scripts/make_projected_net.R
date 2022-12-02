library(igraph)

class_edges = read.csv(here::here("content/class_worksheets/35_networks/data/edgelist.csv"), header = TRUE, stringsAsFactors = FALSE)
toy_attributes = read.csv(here::here("content/class_worksheets/35_networks/data/attributes.csv"), header = TRUE, stringsAsFactors = FALSE)

course = unique(class_edges$to)
student = unique(class_edges$from)

tf.list = data.frame(name=c(course, student), type=c(rep(FALSE, length(course)), rep(TRUE, length(student))), stringsAsFactors=FALSE)

proj_net = graph.data.frame(class_edges, directed = FALSE, vertices = tf.list)

proj_net = bipartite.projection(proj_net)

proj_edgelist = as.data.frame(as_edgelist(proj_net[[2]]), stringsAsFactors = FALSE)
colnames(proj_edgelist) = c("from", "to")

write.csv(proj_edgelist, here::here("content/class_worksheets/35_networks/data/projected.csv"), row.names = FALSE)
