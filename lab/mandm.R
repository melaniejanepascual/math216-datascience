Claim: M&Ms colors are represented equally

1. Assumptions: Random sample
np >= 10 and n(1-p) >= 10
138(0.1667) > 10, 138(1-0.1667) >= 10

23 > 10, 114.99 >= 10

2. Hypotheses: 
Ho: p  = .1667
Ha: p != .1667

3. Test statistic: 
Binomial Test
centered at:
looks somewhat close to normal

prop_m <- c(20,22,26,26,16,28)
pv <- c(0.5683,0.9092,0.493,0.493,1,0.003238)
orange <- binom.test(20,138,.1667) #not equal to p
green <- binom.test(22,138,.1667) #not equal to p
blue <- binom.test(26,138,.1667) #not equal to p
yellow <- binom.test(26,138,.1667) #not equal to p
brown <- binom.test(16,138,.1167) #not equal to p
red <- binom.test(28,138,.1167) #not equal to p

From our test sample, we may conclude that the true probability success is not equal to the null hypothesis. 

new_name<- c("Orange","Green","Blue","Yellow","Brown","Red")

new_prop_m <- prop_m %>% 
  as.data.frame()

new_name <- new_name %>% 
  as.data.frame()

pv <- pv %>% 
  as.data.frame()

data <- cbind(new_name,pv)

library(tidyverse)
library(tidyr)
library(dplyr)


ggplot(data = data, aes(x = new_name, y =.)) +
  geom_bar(stat = "identity") +
  xlab("M&M colors") +
  ylab("Number of M&Ms")

## color each one as its own color

## use pie chart

p.adjust(data$.,method="BH")
[1] 0.852450 1.000000 0.852450 0.852450 1.000000 0.019428





