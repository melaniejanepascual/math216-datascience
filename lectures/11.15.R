library(ggplot2)
bball <- read.csv("Basketball.csv")
model1 <- lm(Sagarin.Rating ~ Blocks, data = bball)
summary(model1)

#make predictions using linear model
#using model, make a prediction for blocks = 100
predict.lm(model1, data.frame(Blocks = 100), interval = "confidence")

ggplot(bball, aes(Blocks, Sagarin.Rating)) + geom_point() + geom_smooth(method = "lm")

# make ugly output from model look nicer
library(broom)
library(knitr)
kable(tidy(model1))

#make correlation matrix plots
library(corrplot)
library(tidyverse)
bball2 <- bball %>% select(Sagarin.Rating, Points, Blocks, Steals, OREB, DREB)
  
# shows the correlations 
corrplot(cor(bball2))

model2 <- lm(Sagarin.Rating ~ Blocks, data = bball)
bball.model <- bball %>% 
  group_by(Year, Conference) %>%
  do(model.output = lm(Sagarin.Rating ~ Blocks, data = .))
  
# period says take everything before the pipe operator and stick it there
# do() like summarize()


# libear models for each year and each conference
bball.model %>%
  summarize(r.sq.values = summary(model.output)$r.squared)

bball %>%
  mutate(FTPercent = FTM/FTA)

multiple.model <- lm(Sagarin.Rating ~ Blocks + Steals + OREB, data = bball)
  
summary(multiple.model)
  

## find a variable that will help make your team better

  
  
  
  


