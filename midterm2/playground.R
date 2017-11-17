library(babynames)

babynames %>%
  mutate(rank = rank(-prop)) %>%
  arrange(rank) %>%
  filter(rank <= 10) %>%
  ggplot(aes(x = reorder(name, prop), y = prop)) +
  geom_bar(stat="identity", aes(fill = sex)) +
  scale_fill_manual(values = c("Pink", "Blue")) +
  xlab("Name")

test1<- babynames %>%
  mutate(rank = rank(prop)) %>%
  arrange(rank)

test2 <- babynames %>%
  mutate(rank = rank(-prop)) %>%
  arrange(rank) 