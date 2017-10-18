library(tidyverse)
bball <- read.csv(file = "Basketball.csv")

## test the hypothesis that ~20% (.196) teams make it to the playoff

playoff.teams <- bball %>%
  group_by(NCAA) %>%  
  select(Team, NCAA) %>%
  summarise(NCAA.prop = sum(NCAA),
            NCAA.prop.test = prop.test(NCAA.prop, 3, p=.196)$p.val) %>%
  filter(NCAA.prop.test <= 0.05)


## do with no bonferroni correction
bball %>%
  group_by(Team) %>%  
  select(Team, Blocks) %>%
  summarise(p.val = t.test(Blocks, mu=130)$p.val,
            t.stat = t.test(Blocks, mu=130)$statistic) %>%
  filter(p.val <= 0.05) %>%
  arrange(p.val)

# do with bonferroni correction
bball %>%
  group_by(Team) %>%  
  select(Team, Blocks) %>%
  summarise(p.val = t.test(Blocks, mu=130)$p.val,
            t.stat = t.test(Blocks, mu=130)$statistic) %>%
  filter(p.val <= 0.05/73) %>%
  arrange(p.val)

## Michigans mean of 70 was significant, Kentuckys not significant even though the mean is 285


p.adjust(c(0.05, 0.01, .00000001), method = "bonferroni")


## no correlation between free throw percentage to any offensive play
ggplot(bball, aes(FTM/FTA, PointsPerGame)) + geom_point()