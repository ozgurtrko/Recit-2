function1 <- function(x, y){
  print(x^y)
}

function1(2,3)



data <- read.csv("https://people.sc.fsu.edu/~jburkardt/data/csv/biostats.csv")
head(data)

colnames(data) <- c("Name","Age","Sex","Height","Weight") 
head(data)

plot(data$Height, data$Weight, col = "darkgreen", lwd = 3,
     xlab = "Height", ylab = "Weight")

dev.print(pdf, "part_vi.pdf")

# vii.
set.seed(16)
library(babynames)

data1 <- babynames[sample(nrow(babynames), size = 10, replace = FALSE),]
data1

?barplot

barplot(data1$n, names.arg = data1$name, 
        col = ifelse(data1$sex == "F", "pink","lightblue"),
        xlab = "Name Count", ylab = "Proportion", cex.names = 0.8,beside = T)
legend("topright", legend = unique(data1$sex), fill = c("pink","lightblue"), title = "Gender")

















