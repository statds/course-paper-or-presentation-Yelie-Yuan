rm(list = ls())
library(igraph); library(wdnet)
set.seed(123)
g <- erdos.renyi.game(2e2, 1e4, type = "gnm", directed = TRUE, loops = TRUE)
edgelist0 <- as_edgelist(g)
n <- 1
targetRho <- list("outout" = 0.98, "inin" = 0.98)
eta0 <- wdnet:::get_dist(edgelist0, joint_dist = TRUE)$eta
dim(eta0)
ret1 <- dprewire(edgelist = edgelist0, target.assortcoef = targetRho, 
                control = list(iteration = n))
eta1 <- wdnet:::get_dist(ret1$edgelist, joint_dist = TRUE)$eta

ret2 <- dprewire(edgelist = ret1$edgelist, eta = ret1$solver.result$eta,
                  control = list(iteration = 4*n))
eta2 <- wdnet:::get_dist(ret2$edgelist, joint_dist = TRUE)$eta

ret3 <- dprewire(edgelist = ret2$edgelist, eta = ret1$solver.result$eta,
                  control = list(iteration = 96*n))
eta3 <- wdnet:::get_dist(ret3$edgelist, joint_dist = TRUE)$eta

eta_target <- ret1$solver.result$eta
eta_target <- eta_target[rownames(eta0), colnames(eta0)]
eta1 <- eta1[rownames(eta0), colnames(eta0)]
eta2 <- eta2[rownames(eta0), colnames(eta0)]
eta3 <- eta3[rownames(eta0), colnames(eta0)]

pheatmap::pheatmap(eta0, cluster_rows = FALSE, cluster_cols = FALSE, 
                   legend = FALSE, show_rownames = FALSE, show_colnames = FALSE)

pheatmap::pheatmap(eta1, cluster_rows = FALSE, cluster_cols = FALSE, 
                   legend = FALSE, show_rownames = FALSE, show_colnames = FALSE)


pheatmap::pheatmap(eta2, cluster_rows = FALSE, cluster_cols = FALSE, 
                   legend = FALSE, show_rownames = FALSE, show_colnames = FALSE)

pheatmap::pheatmap(eta3, cluster_rows = FALSE, cluster_cols = FALSE, 
                   legend = FALSE, show_rownames = FALSE, show_colnames = FALSE)

pheatmap::pheatmap(eta_target, cluster_rows = FALSE, cluster_cols = FALSE, 
                   legend = FALSE, show_rownames = FALSE, show_colnames = FALSE)

