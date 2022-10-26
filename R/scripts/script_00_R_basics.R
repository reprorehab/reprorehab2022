# assigning values to and basic functions ----
x = 2
x = x + 3 

x*3


y = 2 

x/y


z = "word"

x*z

x < 2
x > 2

z < 2
z > 2
# 2 gets coerced to a string, and then strings are compared in ASCII order
# "." < 0 < 2 < ...9 < A < B < C <... W...

is.character(z)
is.numeric(z)

# some data types ----
# vectors
x <- 2 # vector of length one
x <- c(2, 3, 4) # vector of length 3
x
y
x*y # the smaller vector is repeated to match the larger vector

y <- c(0, 1, 0) # item-wise operations for vectors of the same length
x
y
x*y

z <- c("red", "red", "blue", "blue", "green", "green")
summary(z)
str(z)

z <- factor(z)
summary(z)
str(z)


# matrix 
mat_data <- c(1,2,3,4,5,6,7,8,9)
mat_data
mat1 <- matrix(data=mat_data, nrow=3, ncol=3)
mat1


mat1[1,]
mat1[,3]
mat1[1,3]

# lists
# are very flexible, data do not need to be the same length or the same type
my_list <- list("a" = 2.5, "b" = TRUE, "c" = 91:87)
my_list

my_list$a
my_list$c
my_list$c[3]


# data frames
sex <- factor(c(rep("male", 10), rep("female", 10)))
height <- c(rnorm(10, mean=67, sd=2.5), rnorm(10, 64, 2.2))

DAT1 <- data.frame(sex, height)
DAT1

plot(height~sex, data=DAT1)



# thinking more about functions and arguments ----
x
summary(x)
?summary()

class(x)
class(z)
class(my_list)
class(DAT1)

str(my_list)
str(DAT1)


mean(x)
x<-append(x, c(NA, 0, 15))
x
mean(x)
mean(x, na.rm=TRUE)


# installing and loading packages -----
install.packages("tidyverse")
library("tidyverse")


# setting the working directory -----
getwd()
list.files()

setwd()

# you can also set the working directory manually through "Session"



# importing data from your computer ----
setwd("~/GitHub/ReproRehab/")
list.files()
list.files("./data/")

DAT2 <- read.csv("./data/data_PROCESSED_EEG.csv",
                 header=TRUE, 
                 stringsAsFactors = TRUE)
head(DAT2)




# importing data from the web
DAT3 <- read.csv("https://raw.githubusercontent.com/keithlohse/grad_stats/main/data/data_THERAPY.csv",
                 header=TRUE,
                 stringsAsFactors = TRUE)

DAT3



