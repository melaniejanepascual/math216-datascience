library(ggplot2)

# Read in plants.csv file
plants <- read.csv(file = "Plants.csv")

# Question 1: Compare fertilizer A and fertilizer B
fert.a <- plants$Fert = 'A'
fert.b <- plants$Fert = 'B'
fert.c <- plants$Fert = 'C'
table(fert, fert.a)
table(fert, fert.b)
table(fert, fert.c)

# Question 2: Boxplot of BiomassT2 and species
ggplot(data = plants, mapping = aes(x = species, y = biomasst2)) + 
  geom_boxplot()

# Question 3: Compare the mean final biomass of each species
biomass1 <- plants$BiomassT2 = '1'
biomass2 <- plants$BiomassT2 = '2'
biomass3 <- plants$BiomassT2 = '3'

mean(biomass1)
mean(biomass2)
mean(biomass3)

# Question 4: Compare final biomass for each fertilizer
fert.a <- plants$Fert = 'A'
fert.b <- plants$Fert = 'B'
fert.c <- plants$Fert = 'C'

mean(fert.a)
mean(fert.b)
mean(fert.c)

# Question 5

# Question 6: Compare BiomassT1 to BiomassT2
ggplot(data = plants, mapping = aes(x = BiomassT1, y = BiomassT2)) + 
  geom_point()

# Question 7
ggplot(data = plants, mapping = aes(x = BiomassT1, y = BiomassT2)) + 
  geom_point(aes(color=fert))
ggplot(data = plants, mapping = aes(x = BiomassT1, y = BiomassT2)) + 
  geom_point(aes(size = species))

# Question 8

# Question 9
geom_tile()

