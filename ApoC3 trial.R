
library(dplyr)
#cor_matrix <- cor(Boston) %>% round(digits = 2)


tri <- c(2, 5, 6, 3, 4)
try <- c(1, 6, 3, 7, 4)
dis <- c(5, 5, 6, 3, 2)

cor <- data.frame(tri, try, dis)

cor_matrix <- as.matrix(cor)
str(cor_matrix)
dim(cor_matrix)

library(corrplot)

corrplot(cor_matrix, is.corr = FALSE, method = "square")



corrplot(cor_matrix, method="circle", type = "upper", cl.pos = "b", tl.pos = "d", tl.cex = 0.6)
