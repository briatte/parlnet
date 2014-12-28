plot = T
gexf = T

meta = c("Hungary", "Országgyűlés")
mode = "fruchtermanreingold"

for(ii in rev(unique(na.omit(b$legislature)))) {

  cat(ii)
  data = subset(b, legislature == ii & n_au > 1)
  s = subset(a, legislature == ii)

  cat(":", nrow(data), "cosponsored documents, ")

  # check for missing sponsors
  u = unlist(strsplit(data$authors, ";"))
  u = na.omit(u[ !u %in% s$uid ])
  if(length(u)) {
    cat("Missing", length(u), "sponsors:")
    print(table(u))
  }

  #
  # directed edge list
  #

  edges = rbind_all(lapply(data$authors, function(d) {

    w = unlist(strsplit(d, ";"))

    d = expand.grid(i = s$uid[ s$uid %in% w ],
                    j = s$uid[ s$uid == w[1]], stringsAsFactors = FALSE)

    return(data.frame(d, w = length(w) - 1)) # number of cosponsors

  }))

  rownames(s) = s$uid

  #
  # edge weights
  #

  # first author self-loops, with counts of cosponsors
  self = subset(edges, i == j)

  # count number of bills per first author
  n_au = table(self$j)

  # remove self-loops from directed edge list
  edges = subset(edges, i != j)

  # count number of bills cosponsored per sponsor
  n_co = table(edges$i)

  # identify directed ties
  edges$ij = apply(edges[, 1:2 ], 1, paste0, collapse = "///")

  # raw edge counts
  raw = table(edges$ij)

  # Newman-Fowler weights (weighted quantity of bills cosponsored)
  edges = aggregate(w ~ ij, function(x) sum(1 / x), data = edges)

  # expand to edge list
  edges = data.frame(i = gsub("(.*)///(.*)", "\\1", edges$ij),
                     j = gsub("(.*)///(.*)", "\\2", edges$ij),
                     raw = as.vector(raw[ edges$ij ]), # raw edge counts
                     nfw = edges$w, stringsAsFactors = FALSE)

  # Gross-Shalizi weights (weighted propensity to cosponsor)
  edges = merge(edges, aggregate(w ~ j, function(x) sum(1 / x), data = self))
  edges$gsw = edges$nfw / edges$w

  # final edge set: cosponsor, first author, weights
  edges = edges[, c("i", "j", "raw", "nfw", "gsw") ]

  cat(nrow(edges), "edges, ")

  #
  # directed network
  #

  n = network(edges[, 1:2 ], directed = TRUE)

  n %n% "country" = meta[1]
  n %n% "title" = paste(meta[2], "legislature", ii)

  n %n% "n_bills" = nrow(data)
  n %n% "n_sponsors" = table(subset(b, legislature == ii)$n_au)

  n_au = as.vector(n_au[ network.vertex.names(n) ])
  n %v% "n_au" = ifelse(is.na(n_au), 0, n_au)

  n_co = as.vector(n_co[ network.vertex.names(n) ])
  n %v% "n_co" = ifelse(is.na(n_co), 0, n_co)

  n %v% "n_bills" = n %v% "n_au" + n %v% "n_co"

  cat(network.size(n), "nodes\n")

  rownames(s) = s$uid

  n %v% "url" = as.character(s[ network.vertex.names(n), "url" ])
  n %v% "sex" = as.character(s[ network.vertex.names(n), "sex" ])
  # n %v% "born" = as.numeric(substr(s[ network.vertex.names(n), "born" ], 1, 4))
  n %v% "party" = as.character(s[ network.vertex.names(n), "party" ])
  n %v% "partyname" = as.character(groups[ n %v% "party" ])
  n %v% "lr" = as.numeric(scores[ n %v% "party" ])
  n %v% "photo" = as.character(s[ network.vertex.names(n), "photo" ])
  n %v% "nyears" = as.numeric(s[ network.vertex.names(n), "mandate" ])

  set.edge.attribute(n, "source", as.character(edges[, 1])) # cosponsor
  set.edge.attribute(n, "target", as.character(edges[, 2])) # first author

  set.edge.attribute(n, "raw", edges$raw) # raw edge counts
  set.edge.attribute(n, "nfw", edges$nfw) # Newman-Fowler weights
  set.edge.attribute(n, "gsw", edges$gsw) # Gross-Shalizi weights

  #
  # weighted measures
  #

  n = get_modularity(n, weights = "raw")
  n = get_modularity(n, weights = "nfw")
  n = get_modularity(n, weights = "gsw")

  n = get_centrality(n, weights = "raw")
  n = get_centrality(n, weights = "nfw")
  n = get_centrality(n, weights = "gsw")

  #
  # network plot
  #

  if(plot) {

    q = n %v% "degree"
    q = as.numeric(cut(q, unique(quantile(q)), include.lowest = TRUE))

    ggnet_save(n, file = paste0("plots/net_hu", ii),
               i = colors[ s[ n %e% "source", "party" ] ],
               j = colors[ s[ n %e% "target", "party" ] ],
               q, colors, order)

  }

  #
  # save objects
  #

  assign(paste0("net_hu", substr(ii, 1, 4)), n)
  assign(paste0("edges_hu", substr(ii, 1, 4)), edges)
  assign(paste0("bills_hu", substr(ii, 1, 4)), data)

  #
  # export gexf
  #

  # clean vertex names for GEXF export
  n %v% "name" = gsub("(.*)\\s\\((.*)\\)", "\\1", network.vertex.names(n))

  if(gexf)
    get_gexf(paste0("net_hu", ii), n, meta, mode, colors, extra = "name")

}

#
# save
#

if(gexf)
  zip("net_hu.zip", dir(pattern = "^net_hu\\d{4}-\\d{4}\\.gexf$"))

save(list = ls(pattern = "^(net|edges|bills)_hu\\d{4}$"), file = "data/net_hu.rda")

# kthxbye
