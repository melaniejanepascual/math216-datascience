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
  select(dep_delay) %>%
  filter(dep_delay > 60) %>%
  group_by(carrier) %>%
  summarize(mean(flights$carrier), na,rm=TRUE)