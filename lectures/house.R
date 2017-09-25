## Practice

library(tidyverse)
library(ggplot2)
house <- read.table("House.txt", header = TRUE)

## Construct a data set with beds/baths/price and only cheap houses (<$100,000)
house %>% 
  select(Beds, Baths, Price) %>%
  filter(Price < 100000)

## Construct data set only with columns starting with "B" and whose values 
## for all cells are >= 2 and <= 4
house %>%
  select(starts_with("b")) %>% 
  filter(between(Beds, 2, 4), between(Baths,2,4))

## Find the most expensive house with either 2 or 3 beds, then make a scatterplot 
## of all houses vs. taxes with 2 or 3 beds
## and highlight this point (The most expensive house)

house %>%
  filter(between(Beds, 2, 3)) %>%  ## houses with 2/3 beds 
  arrange(Price) %>% ## organized by price, house 6 is the most expensive 
  ggplot(mapping = aes(Taxes, Price)) + geom_point() + geom_point(data = expensive.house, color = "red", size = 5)

expensive.house <- filter(house, case == 6)


## guy has expensive house but isnt paying taxes on

