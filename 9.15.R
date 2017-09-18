## write mtcars to csv file
write.csv(x = mtcars, file = "mtcars.csv")
mtcars2 <- read.csv(file = "mtcars.csv")

## create new.var
new.var <- NULL

for(i in 1:100) {
  new.var[i] <- i
}

## Practice: write a loop that reads from 3 different data sets 

## Make 3 data sets (aka matrixes)
dataset1 <- matrix(data = c(10,10,10,20,20,40,50,30,40,20), nrow = 5, ncol = 2, byrow = TRUE)
dataset2 <- matrix(data = c(120,120,102,202,202,402,520,230,240,202, 400, 208), nrow = 4, ncol = 3, byrow = TRUE)
dataset3 <- matrix(data = c(1,2,3,4,5,6), nrow = 2, ncol = 3, byrow = TRUE)

## Iterative loop to read from data sets
## solution 1
for(i in 1:3) {
  assign(paste(c("new.dataset", i), collapse=""), 
         read.csv(file = paste(c("dataset", i, ".csv"), 
              collapse="")))
}

#solution 2
super.dataset <- NULL
for (i in 1:3) {
  # read in dataset
  current.dataset <- read.csv(file = paste(c("dataset", i, ".csv"), 
                        collapse=""))
  
  # attach dataset to other datasets to make super dataset
  super.dataset <- rbind(super.dataset, current.dataset) 

}


