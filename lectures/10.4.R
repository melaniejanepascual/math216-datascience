## number of successes that read harry potter books
hist(rbinom(10000, 14, .75))

#convert to proportion of successes
hist(rbinom(10000, 14, .75)/14)

# binom.test
binom.test(10, 14, .75)

## created two tail
pbinom(10, 14, .75)*2 

pnorm(.71, mean=.75, sd = sqrt(.75*.25/14))*2


# Taboo
library(tidyverse)
taboo <- read.csv("Taboo.csv")

males <- taboo %>%
            filter(Gender == "M") %>%
            select(Marijuana)

females <- taboo %>%
  filter(Gender == "F") %>%
  select(Marijuana)

prop.test(x = c(15,14), n = c(52,48))
## prop 1 = men, prop 2 = women



