x <- rnorm(219)
y <- runif(219, 0, 5)
z <- 1:219

bball <- read.csv("Basketball.csv")
attach(bball)

model1 <- lm(Sagarin.Rating ~ x + y + z)
summary(model1)

model2 <- lm(Sagarin.Rating ~ Points)

# Aic has a higher AIC result
AIC(model1)
AIC(model2)

AIC()
BIC()

# Use all columns as predictors, take all columns except for sagarin rating and 
# add to the model

big.ass.model <- lm(Sagarin.Rating ~ ., data = bball)
summary(big.ass.model)

#finds the lowest AIC model
step()


big.model <- lm(Sagarin.Rating ~ Points + DREB + FTA,
                data = bball)
summary(big.model)
step(big.model)

Taboo <- read.csv("Taboo.csv")
ggplot(Taboo, aes(Sex, Happiness)) + 
  geom_point(aes(color = Gender), size  = 3) + 
  geom_smooth(method = "lm")

happiness <- lm(Happiness ~ Sex, data = Taboo)

happiness2 <- lm(Happiness ~ Sex + Gender, data = Taboo)
summary(happiness2)

ggplot(Taboo, aes(Sex, Happiness)) + 
  geom_point(aes(color = Gender), size  = 3) +
  geom_abline(slope = 2.5, intercept = 56.6, color = "red") +
  geom_abline(slope = 4.4, intercept = 57.1, color = "blue")
  
  
happiness2$coefficients[[2]]

# interaction term
happiness3 <- lm(Happiness ~ Sex + Gender + Sex:Gender, data = Taboo)

happiness3 <- lm(Happiness ~ Sex*Gender, data = Taboo)

summary(happiness3)













  
  
  






