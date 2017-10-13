## Try breaking the central limit theorem
# small sample size & weird population distribution
test.scores <-c(98.95,92,88,86,84,84, 20,14)

mean.vector <- NULL

for(i in 1:100000){
  mean.vector[i] <- mean(sample(test.scores, 2, replace = TRUE))
}

hist(mean.vector)

#sample size 20

test.scores2 <-c(98.95,92,88,86,84,84, 20,14)

mean.vector <- NULL

for(i in 1:100000){
  mean.vector[i] <- mean(sample(test.scores2, 20, replace = TRUE))
}

hist(mean.vector)



#sample size 50

test.scores3 <-c(98.95,92,88,86,84,84, 20,14)

mean.vector <- NULL

for(i in 1:100000){
  mean.vector[i] <- mean(sample(test.scores3, 50, replace = TRUE))
}

hist(mean.vector)

## with flights. doesn't matter that the distribution is weird because it knows sample distribution
## and mean

library(nycflights13)
library(ggplot2)


ggplot(flights, aes(dep_delay)) + geom_histogram()

##n is number of rows
flights %>%
  filter(carrier == "DL") %>%
  summarize(mean.delay = mean(dep_delay, na.rm = TRUE, n=n(), sd=sd(dep_delay, na.rm = TRUE)))

39.74/sqrt(48110)
pnorm(9.26, 5, .18, lower.tail=FALSE)



delta.delays <- flights %>%
    filter(carrier == "DL") %>%
    select(dep_delay)

delta.delays <- as.data.frame(delta.delays)
t.test(delta.delays, mu=5)

## assuming the null hypothesis (mu=5) is true, there is a MINISCULE chance that you
## would observe 9.26 as the mean

times





