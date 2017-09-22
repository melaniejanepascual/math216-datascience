library(tidyverse)
house <- read.table("House.txt", header = TRUE)

## Construct a data set with beds/baths/price and only cheap houses (<$100,000)
house %>% 
  select(Beds, Baths, Price) %>%
  filter(Price < 100000)

## Construct data set only with columns starting with "B" and whose values for all cells are >= 2 and <= 4
house %>%
  select(starts_with("B")) %>% 
  filter(between(house, 2, 4))

## Find the most expensive house with either 2 or 3 beds, then make a scatterplot of all houses vs. taxes with 2 or 3 beds
## and highlight this point (The most expensive house)
house %>%
  

