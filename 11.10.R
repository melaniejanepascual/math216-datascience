################
library(tidyverse)
library(ggplot2)
library(okcupiddata)

table(profiles$sex)

#gay or straight females
qwomen <- profiles %>%
  filter(orientation != "straight") %>%
  filter(sex == "f")
View(qwomen)

diets <- table(profiles$diet)
diets/sum(diets)
diets <- as.data.frame(diets)

qdiets <- table(qwomen$diet)
qdiets/sum(qdiets)
qdiets <- as.data.frame(qdiets)

dietdata <- data.frame(diet = c("Anything", "Veggie", "Other"), count =
                         as.numeric(c(diets[1,2] + diets[4,2] + diets[11,2], 
                                      diets[8,2] + diets[9,2] + diets[15,2] + diets[16,2] + diets[17,2] + diets[18,2],
                                      diets[2,2] + diets[3,2] + diets[5,2] + diets[6,2] + diets[7,2] + diets[10,2] + diets[12,2]+ diets[13,2]+ diets[14,2])))

qdietdata <- data.frame(diet = c("Anything", "Veggie", "Other"), count =
                          as.numeric(c(qdiets[1,2] + qdiets[3,2] + qdiets[10,2], 
                                       qdiets[7,2] + qdiets[8,2] + qdiets[13,2] + qdiets[14,2] + qdiets[15,2] + qdiets[16,2],
                                       qdiets[2,2] + qdiets[4,2] + qdiets[5,2] + qdiets[6,2] + qdiets[9,2] + qdiets[11,2] + qdiets[12,2])))

dietdata <- dietdata %>%
  mutate(percent = count/sum(count))

qdietdata <- qdietdata %>%
  mutate(percent = count/sum(count))




graphdata <- rbind(dietdata, qdietdata)
graphdata[,4] = as.factor(c("Total","Total","Total", "Queer Women","Queer Women","Queer Women"))

ggplot(graphdata,mapping=aes(x = diet, y = percent, fill = V4)) + geom_col(position=position_dodge()) +
  xlab("Diet") + ylab("Percent") + theme(legend.position="bottom") + theme(legend.title=element_blank())


binom.test(x = qdietdata[2,2], n = sum(qdietdata$count), p=dietdata[2,3])