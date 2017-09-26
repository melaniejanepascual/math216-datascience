## mutate() group_by() summarize()
house <- read.table("House.txt", header = TRUE)

## mutate

house %>%
  mutate(BedBathBeyond = Beds + Baths) ##creates new variable that adds both

house %>%
  transmute(BedBathBeyond = Beds + Baths)

## group_by() and summarize()
library(ggplot2)


## mean price for each color diamond
diamonds %>%
  group_by(color) %>%
  summarize(mean.price = mean(price)) 

diamonds %>%
  group_by(color) %>%
  summarize(num.of.diamonds = n()) 

## gives the expensive ones 
diamonds %>%
  group_by(color) %>%
  summarize(prop.expensive = mean(price > 10000))

##tells if expensive, returns T/F
diamonds$price > 10000

## New dataset - flights
library(nycflights13)
flights
## Compare mean arrival delay for flights into Burlington vs. flights into Boston

flights %>%
  filter(dest == "BOS" | dest == "BTV") %>%
  group_by(dest) %>% 
  summarize(delay.avg = mean(dep_delay, na.rm = TRUE))
