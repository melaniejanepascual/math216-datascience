library(ggplot2)

# Read in plants.csv file
plants <- read.csv(file = "Plants.csv")
plants$Species <- factor(plants$Species)
plants$Fert <- factor(plants$Fert)

# Question 1: Compare fertilizer A and fertilizer B
table(plants$Species, plants$Fert)


# Question 2: Boxplot of BiomassT2 and species
ggplot(data = plants, mapping = aes(x = Species, y = BiomassT2)) + 
  geom_boxplot()

# Question 3: Compare the mean final biomass of each species

species1 <- subset(plants, Species == "1")
biomass.plant2<- subset(plants, Species == "2")
biomass.plant3 <- subset(plants, Species == "3")

mean(table(species1, plants$BiomassT2))

table(plants$Species == "1", plants$BiomassT2)
# Question 4: Compare final biomass for each fertilizer
ggplot(data = plants, mapping = aes(x = Fert, y = BiomassT2)) + 
  geom_boxplot()

# Question 5 - color based on species
ggplot(data = plants, mapping = aes(x = Species , y = BiomassT2)) + 
  geom_boxplot(aes(fill = Fert))


# Question 6: Compare BiomassT1 to BiomassT2
ggplot(data = plants, mapping = aes(x = BiomassT1, y = BiomassT2)) + 
  geom_point()

# Question 7
ggplot(data = plants, mapping = aes(x = BiomassT1, y = BiomassT2)) + 
  geom_point(aes(color = Fert, size = Species))

# Question 8
ggplot(data = plants, mapping = aes(x = Row, y = Column)) +
  geom_point(aes(size = BiomassT2))

# Question 9
ggplot(data = plants, mapping = aes(x = Row, y = Column)) +
  geom_tile(aes(fill = BiomassT2))

# Question 10
# Question 11
biomassT1.avg <- mean(plants$BiomassT1)
biomassT2.avg <- mean(plants$BiomassT2)
