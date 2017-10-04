library(tidyverse)
taboo <- read.csv("Taboo.csv")

taboo %>%
  filter(Gender == "M", Marijuana == 0) %>%
  summarize(mean.happy = mean(Happiness))

taboo %>%
  filter(Gender == "M", Marijuana == 0) %>%
  summarize(sd.happy = sd(Happiness))

taboo %>%
  filter(Gender == "M", Marijuana == 0) %>%
  summarize(number.happy = n())

# Testing with actual T test function
t.test(taboo %>% filter(Gender == "M", Marijuana == 0) %>%
         select(Happiness), mu = 70)

# P Value 
pt(-1.8, 36)
pt(-1.8, 36) * 2

m.sex <- taboo %>%
            filter(Gender == "M") %>%
            select(Sex)

f.sex <- taboo %>%
  filter(Gender == "F") %>%
  select(Sex)


mean(m.sex$Sex)
mean(f.sex$Sex)
t.test(m.sex, f.sex)

## Conclusion: Assuming 2 means are equal, thers a 25% chance (p-value) the difference is caused by chance

dominant <- c(392, 278, 390, 287, 316, 318, 268, 380, 289, 393, 357, 293, 321, 360, 278)
nondominant <- c(350, 292, 423, 294, 316, 318, 292, 460, 299, 463, 345, 292, 339, 334, 267)

difference <- dominant - nondominant
mean(difference) 

#checking if its caused by chance with a t test
t.test(difference, mu = 0)

# 20% chance that 11 ms difference is due to chance. 1 out of 5 isn't rare. Accept null hypothesis
# No evidence against null hypothesis

t.test(dominant, nondominant)
