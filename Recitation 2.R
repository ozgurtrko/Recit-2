getwd()

# iii.
set.seed(16)

M <- matrix(rbinom(72, size = 10, prob = 0.5), nrow = 12, ncol = 6)
rownames(M) <- paste0("Row.", 1:nrow(M))
colnames(M) <- paste0("Col.", 1:ncol(M))

L <- matrix(rnorm(72), 12, 6)
rownames(L) <- paste0("Row.", 1:nrow(L))
colnames(L) <- paste0("Col.", 1:ncol(L))

part3 <- list(M, L)

# iv.

write.csv(part3, file = "part3.csv")



















