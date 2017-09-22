library(tidyverse)

## Make subsets of data
subset(diamonds, color == "E" & carat > 1)

filter(diamonds, color == "E", carat > 1)

filter(diamonds, between(price, 5000, 10000))

## Selects particular columns
select(diamonds, carat, price)

starts_with()
select(diamonds, starts_with("c"))
select(diamonds, ends_with("c"))


## Lets say we want only the diamonds >$10000 in price.
## Then, we want to examine their colors only.
expensive.diamonds <- filter(diamonds, price > 10000)
select(expensive.diamonds, color, price)

x <- c(1,2,3,4,5)

x %>% mean() 
mean(x)

filter(diamonds, price > 10000)
diamonds %>% filter(price > 10000)


## sorts ascending
diamonds %>% 
  filter(price > 10000) %>%
  select(color, price, carat, depth) %>%
  arrange(carat, depth)
