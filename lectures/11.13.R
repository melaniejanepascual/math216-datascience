## Correlation
## r = correlation coefficient, -1<=r<=1
cor.test() # is the correlation coefficient significantly different than 0
cor() # actual correlation 
## Warm-up: Randomly generate x and y of equal length. Calculate p-value from the correlation 
## test. Do this 100,000 times and make a histogram. Calculate the proportion of p-value < .05

cortests <- NULL

for(i in 1: 100000) {
  x <- rnorm(1000, 10, 2)
  y <- rnorm(1000, 10, 5)
  
cortests[i] <- cor.test(x, y)$p.value
}
hist(cortests)


sum(cortests< .05) ## small p value, but nothing is going on 


# simple linear regression: uses an x variable to predict a y variable
# x = predictor, independent, covariate. y = response, dependent

# population equation: Ny = alpha + Bx + Error 
# regression equation: y^ = alpha  + Bx 

library(ggplot2)
ggplot(faithful, aes(waiting, eruptions)) + geom_point()
cor(faithful$waiting, faithful$eruptions)
cor.test(faithful$waiting, faithful$eruptions)

#shows they're not really related 
# linear model lm (y variable ~ x variable), use waiting time to predict erupting time
model1 <- lm(eruptions ~ waiting, data = faithful)
summary(model1)

# y^ = -1,87 (alpha is intercept estimate) + .08 (waiting, estimate)*waiting 
## testing equivalence is the same as testing linear regression


ggplot(faithful, aes(waiting, eruptions)) + 
  geom_point() +
  geom_abline(intercept = -1.874016, slope = 0.075628, color = "blue")


ggplot(faithful, aes(waiting, eruptions)) + 
  geom_point() +
  geom_smooth(method = "lm")

## Least Sqquare Regresssion Line 

bball <- read.csv("Basketball.csv")

## use response variable of Sagarin Rank

model2 <- lm(Sagarin.Rating ~ FGM, data = bball)
summary(model2)





