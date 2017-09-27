library(nycflights13)
library(tidyverse)
library(ggplot2)

flights$dep_delay > 60
  # returns T/F
mean(flights$dep_delay > 60)
  # returns N/A because you can't get an average of booleans
mean(flights$dep_delay > 60, na.rm = TRUE)
  #returns number


# Construct a bar graph of the "Top 10" carriers with the highest proportion
# of flights delayed more than an hour. (dep delay)

flights %>%
  group_by(carrier) %>%
  summarize(carrier.avg = mean(dep_delay > 60 , na.rm=TRUE)) %>%
  arrange(desc(carrier.avg)) %>%
  mutate(Rank = rank(-carrier.avg)) %>%
  filter(Rank <= 10) %>%
  ggplot(mapping = aes(x = reorder(carrier, carrier.avg), carrier.avg)) + 
  geom_bar(stat = "identity", aes(fill = carrier))

## Create a function
favNum <- function(x) {
  num <- paste(c("MJ's favorite number is", x, "."), collapse = " ")
  return(num)
}

## Create a t test function - assume we only care about left tailed t tests
pt <- function(data) {
  x <- mean(data)
  s <- sd(data)
  
  
  pvalue <- (x-m)/(s/sqrt(n))
}
