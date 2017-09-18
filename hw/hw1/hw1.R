library(ggplot2)

# Read in plants.csv file
plants <- read.csv(file = "Plants.csv")

# Question 1: Compare fertilizer A and fertilizer B
table(Fert = 'a', Fert = 'b')

# Question 2: Boxplot of BiomassT2 and species
ggplot(data = plants, mapping = aes(x = species, y = biomasst2)) + 
  geom_boxplot()

# Question 3: Compare the mean final biomass of each species
mean(BiomassT2)

# Question 4: Compare final biomass for each fertilizer
ggplot(data = plants, mapping = aes(x = fertilizer, y = biomasst2)) + 
  geom_boxplot()

# Question 5

# Question 6: Compare BiomassT1 to BiomassT2
ggplot(data = plants, mapping = aes(x = BiomassT1, y = BiomassT2)) + 
  geom_point()

# Question 7
ggplot(data = plants, mapping = aes(x=carat, y=price)) + 
  geom_point(aes(color=fert))
ggplot(data = plants, mapping = aes(x = carat, y = price)) + 
  geom_point(aes(size = species))

# Question 8

# Question 9
geom_tile()

