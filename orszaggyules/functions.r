#' Wrapper around weighted modularity functions
#' @seealso igraph package, by Gabor Csardi
#' @references Pascal Pons, Matthieu Latapy:
#' Computing communities in large networks using random walks,
#' http://arxiv.org/abs/physics/0512106
get_modularity <- function(n, weights = "raw", exclude = "IND") {

  cat("Modularity", paste0("(", weights, ")"))

  nn = graph.edgelist(cbind(n %e% "source", n %e% "target"), directed = TRUE)
  E(nn)$weight = get.edge.attribute(n, weights)
  stopifnot(is.weighted(nn))

  # transpose party attribute
  i = n %v% "party"
  names(i) = network.vertex.names(n)
  i = as.character(i[ V(nn)$name ])

  # optional exclusion of members
  if(length(exclude)) {
    cat(" excl.", paste0(exclude, collapse = ", "))
    i[ i %in% exclude ] = NA
  }

  nn = nn - which(is.na(i))
  cat(":", vcount(nn), "/", network.size(n), "nodes")

  i = as.numeric(factor(i[ !is.na(i) ]))

  m = paste0("modularity_", weights)
  n %n% m = modularity(nn, membership = i, weights = E(nn)$weight)
  cat(" Empirical:", round(n %n% m, 2))

  walktrap = lapply(1:50, function(x) walktrap.community(nn, steps = x))

  # max. partition
  maxwalks = order(sapply(walktrap, modularity), decreasing = TRUE)[1]
  walktrap = walktrap[[ maxwalks ]]

  w = paste0(m, "_maximized")
  n %n% w = modularity(walktrap)
  cat(" Maximized:", round(n %n% w, 2))

  r = paste0(m, "_ratio")
  n %n% r = n %n% m / n %n% w
  cat(" Ratio:", round(n %n% r, 2), "\n")

  return(n)

}

#' Wrapper around weighted one-mode centrality functions
#' @seealso tnet package, by Tore Opsahl
get_centrality <- function(n, weights = "raw") {

  cat("Centrality", paste0("(", weights, ")"))

  # weighted adjacency matrix to tnet
  tnet = as.tnet(as.sociomatrix(n, attrname = weights),
                 type = "weighted one-mode tnet")

  # weighted degrees and distance
  wm = data.frame(degree_w(tnet, measure = "degree", type = "out"),
                  degree_w(tnet, measure = "degree", type = "in"))
  names(wm) = c("node", "outdegree", "distance", "indegree")
  wm$distance = NA
  wd = distance_w(tnet)
  wm[ attr(wd, "nodes"), ]$distance = colMeans(wd, na.rm = TRUE)

  # generalised degree does not vary with weighting structure
  if(weights == "raw") {

    i = "indegree"
    n %v% i = wm$indegree
    n %n% i = mean(wm$indegree, na.rm = TRUE)
    cat(" Indegree:", round(n %n% i, 2))

    i = "outdegree"
    n %v% i = wm$outdegree
    n %n% i = mean(wm$outdegree, na.rm = TRUE)
    cat(" Outdegree:", round(n %n% i, 2))

    i = "degree"
    n %v% i = wm$indegree + wm$outdegree
    n %n% i = mean(wm$indegree + wm$outdegree, na.rm = TRUE)

    cat(" Total:", round(n %n% i, 2), "\n")
    cat("Centrality", paste0("(", weights, ")"))

  }

  i = paste0("distance_", weights)
  n %v% i = wm$distance
  n %n% i = mean(wm$distance, na.rm = TRUE)
  cat(" Distance:", round(n %n% i, 2))

  i = paste0("clustering_", weights)
  n %n% i = clustering_w(tnet) # global
  cat(" Clustering:", round(n %n% i, 2), "\n")

  return(n)

}

#' Wrapper around the write.gexf function
#' @seealso rgexf package, by George Vega Yon and Jorge Fabrega Lacoa
get_gexf <- function(id, n, meta, mode, colors, extra = NULL) {

  rgb = t(col2rgb(colors[ names(colors) %in% as.character(n %v% "party") ]))
  meta = list(creator = "rgexf",
              description = paste("legislative cosponsorship network,", mode, "placement,", n %n% "n_bills", "bills"),
              keywords = paste0(c("parliament", tolower(meta)), collapse = ", "))

  node.att = data.frame(url = n %v% "url",
                        party = n %v% "partyname",
                        n_bills = n %v% "n_bills",
                        photo = n %v% "photo",
                        stringsAsFactors = FALSE)

  for(i in extra)
    node.att[, i ] = n %v% i

  people = data.frame(id = as.numeric(factor(network.vertex.names(n))),
                      label = network.vertex.names(n),
                      stringsAsFactors = FALSE)

  relations = data.frame(
    source = as.numeric(factor(n %e% "source", levels = levels(factor(people$label)))),
    target = as.numeric(factor(n %e% "target", levels = levels(factor(people$label)))),
    weight = n %e% "raw")
  relations = na.omit(relations)

  # check all weights are positive after rounding
  stopifnot(all(relations$weight > 0))

  nodecolors = lapply(n %v% "party", function(x)
    data.frame(r = rgb[x, 1], g = rgb[x, 2], b = rgb[x, 3], a = .5))
  nodecolors = as.matrix(rbind_all(nodecolors))

  # node placement
  position = do.call(paste0("gplot.layout.", mode),
                     list(as.matrix.network.adjacency(n), NULL))
  position = as.matrix(cbind(round(position, 1), 1))
  colnames(position) = c("x", "y", "z")

  write.gexf(nodes = people, nodesAtt = node.att,
             edges = relations[, 1:2 ], edgesWeight = relations[, 3],
             nodesVizAtt = list(position = position, color = nodecolors,
                                size = round(n %v% "degree", 1)),
             # edgesVizAtt = list(size = relations[, 4]),
             defaultedgetype = "directed", meta = meta,
             output = paste0(id, ".gexf"))

}

#' Clean spaces
#' @seealso qdap package, by Tyler Rinker
str_space <- function(x) {

  gsub("\\s+", " ", x)

}

#' Clean commas, quotes and spaces
#' @seealso qdap package, by Tyler Rinker
str_clean <- function(x) {

  y = gsub("\\\\r|\\\\n|\\n|\\\\t", " ", x)

  y = str_space(y)
  y = str_space(str_trim(y))

  y = gsub("\"", "", y)
  y = gsub(" ,", ",", y)

  n = nchar(y)
  y = paste0(str_trim(substring(y, 1, n - 1)), substring(y, n))

  y[ is.na(x) ] = NA

  return(y)

}

#' Lighter version of the ggnet function, co-authored with Moritz Marbach
#' @seealso GGally package, by Barret Schloerke, for the full version
ggnet_save <- function(n, file, i, j, q, colors, order) {

  party = as.vector(i)
  party[ i != j ] = "#AAAAAA"

  print(table(n %v% "party", exclude = NULL))
  stopifnot(all(unique(n %v% "party") %in% names(colors)))

  m = network::as.matrix.network.adjacency(n)
  m = do.call(paste0("gplot.layout.", mode), list(m, NULL))

  ij = network::as.matrix.network.edgelist(n)
  xy = data.frame(m[ij[, 1], ], m[ij[, 2], ])
  colnames(xy) = c("X1", "Y1", "X2", "Y2")

  g = ggplot(data.frame(m), aes(X1, X2)) +
    geom_segment(data = xy, aes(x = X1, y = Y1, xend = X2, yend = Y2),
                 size = 0.25, colour = party, alpha = 0.5) +
    geom_point(alpha = 1/3, aes(size = q, color = n %v% "party")) +
    geom_point(alpha = 1/2, aes(size = min(q), color = n %v% "party")) +
    scale_color_manual("", values = colors, breaks = order) +
    scale_size_continuous(range = c(6, 12)) +
    scale_x_continuous(breaks = NULL) +
    scale_y_continuous(breaks = NULL) +
    theme(panel.background = element_rect(fill = "white"),
          panel.grid = element_blank(), axis.title = element_blank(),
          legend.key = element_blank(),
          legend.key.size = unit(1, "cm"),
          legend.position = "right",
          legend.text = element_text(size = 16)) +
    guides(color = guide_legend(override.aes = list(alpha = 1/3, size = 6)),
           size = FALSE)

  print(g)

  ggsave(paste0(file, ".pdf"), g, width = 10, height = 9)

  ggsave(paste0(file, ".jpg"), g + theme(legend.position = "none"),
         width = 9, height = 9, dpi = 150)

}
