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