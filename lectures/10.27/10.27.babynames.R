library(shiny)
library(babynames)
library(ggplot2)
library(tidyverse)

testYear <- 1977

babynames %>%
  filter(year == testYear)
  arrange(year, prop)
  select( p)


#  select(sex, name, prop)