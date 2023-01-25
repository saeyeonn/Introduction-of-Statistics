1 : 3
x = 1:5
y = c(1, 3, 5)

a = seq(from = 1, to = 10, by = 2)
ex <- c(1, 3, 5, NA, 12)
ex < 10
ex %% 2 == 0
ex[ex%%2]

is.na(ex)

x1 <- c(1,2,3,4,5,6)
factor(x, levels = c(1,2,3,4))
x <- c(1,0,1,1,0)
factor(x, levels = c(0,1), labels = c("M", "F"))
name <- c("a", "b", "c")
age <- c(21,22,31)
gender <- factor(c("M", "F", "M"))
user <- data.frame(name, age, gender)

user
user $name
user $age
user $gender


data <- read.csv("C:/Users/saeye/Downloads/행정구역_시군구_별__성별_인구수_20220915152248.csv", header=TRUE)
