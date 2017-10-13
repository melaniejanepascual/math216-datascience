# Suppose the lifespan of lightbulbs follows a distribution with a mean of
# 5 years and standard deviation of 4 years. What is the probability that you
# buy 100 lightbulbs and their average lifespan exceeds 6 years?

#calculate t statistic and convert it with pt()

pnorm(6,5,4/10, lower.tail = FALSE)

# BASKETBALL DATA
library(tidyverse)
bball <- read.csv(file = "Basketball.csv")

# wana see if each team, if the average points per game different for the
# avg points per game for the mean of the entire league

# avg points per game for georgia
UGA <- bball %>%
  group_by(Team) %>%
  filter(Team == "Georgia") %>%
  select(Team, PointsPerGame)

t.test(UGA$PointsPerGame, mu = 66) # > falls in line with null hypothesis, mean is 66.09

t.test(UGA$PointsPerGame, mu = 66)$p.val
# Do it for all games

# set each team to a number 

team.points <- bball %>%
  group_by(Team) %>%  
  select(Team, PointsPerGame) %>%
  summarise(pval=t.test(PointsPerGame, mu = 66)$p.val) %>%
  arrange(pval)

# Missouri has a low p value because they have a higher average in shooting 
Missouri <- bball %>%
  filter(Team == "Missouri") %>%
  select(PointsPerGame)





