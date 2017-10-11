## Central Limit Theorem with SAT ~ N(600, 100^2), n=30
SAT <- rnorm(100000, 600, 100)
mean.vector <- NULL

for(i in 1:100000){
  mean.vector[i] <- mean(sample(SAT, 30))
}

hist(mean.vector)
mean(mean.vector)
sd(mean.vector)

##CLT says mean of distribution should be the same as mean of population

100/sqrt(30)

# is equal to sd(mean.vector)

# data set: waiting for a date, how long would you want to call

pop.vector <- c(5,15,15,5,10,12,6.5,20,8,5,15,10,11,3,8)
hist(pop.vector)

## CLT says describes sample mean

for(i in 1:100000){
  mean.vector[i] <- mean(sample(pop.vector, 30, replace = TRUE))
}


## replace=TRUE says you can reuse data

mean(pop.vector)
sd(pop.vector)

## trying with a different population 
for(i in 1:100000){
  mean.vector[i] <- mean(sample(pop.vector, 36, replace = TRUE))
}
  

sd(pop.vector)/6
  
hist(mean.vector) ## looks normal
  
  
mean(mean.vector)
  
sd(mean.vector)
  

## whatever the size, you should know how the mean behaves. SD of the mean is similar. 
  
  
