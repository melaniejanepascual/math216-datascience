#Benjamini test
p.values <- c(.06, .01, .002)
p.adjust(p.values, method = "BH")

wait.times2 <- c(5,1,11,2,8,0,1,4,6,3,13,9,8,15,7)
music <- rep(c("Ad", "Muzak", "Classical"), each=5)

music.data <- as.data.frame(cbind(wait.times, music))
## change from factors to numeric
music.data$wait.times2 <- as.numeric(wait.times2)

## Create ANOVA model
## y is quantitative variable (wait-times) x is categorical group (music)
model1 <- aov(wait.times2~music, data=music.data)

summary(model1)

