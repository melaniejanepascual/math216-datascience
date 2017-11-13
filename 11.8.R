install.packages("okcupiddata")
library(okcupiddata)
library(tidyverse)
data(profiles)
View(profiles)

adventurous <- 
  profiles %>%
    filter(grepl("adventurous", essay0))

onlywhites <- profiles %>% filter(ethnicity == "white")
View(onlywhites)

includingwhite <-profiles %>% filter(grepl("white", ethnicity))
View(includingwhite)

vegan <- profiles %>%
  filter(grepl("strictly vegan", diet))
View(vegan)

profiles %>%
  ggplot() + geom_bar(mapping = aes(x=body_type))

vegan %>%
  ggplot() + geom_bar(mapping = aes(x=body_type))


table(profiles$body_type)

View(profiles)

fun <- profiles %>%
  filter(grepl("fun", essay0))

gaywomen <- profiles %>%
  filter(grepl("gay", orientation)) %>%
  filter(sex == "f")
View(gaywomen)


profiles %>%
  ggplot() + geom_bar(mapping = aes(x=education))

gaywomen %>%
  ggplot() + geom_bar(mapping = aes(x=education))



statuses <- table(profiles$status)
statuses/sum(statuses)

gaystatuses <- table(gaywomen$status)
gaystatuses/sum(gaystatuses)


diets <- table(profiles$diet)
diets/sum(diets)

gaydiets <- table(gaywomen$diet)
gaydiets/sum(gaydiets)

diet.df <- as.data.frame(diets)
View(diets)

g.diet.df <- as.data.frame(geydiets)
View(g.diet.df)

new <- t(g.diet.df)