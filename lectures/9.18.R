
## Load in library of ggplot2 functions
library(ggplot2)

# Make scatterplot in ggplot2
ggplot(data=diamonds, mapping=aes(x=carat, y=price)) + geom_point()

# Make boxplot in ggplot2
ggplot(data=diamonds, mapping=aes(x=factor(0), y=price)) + geom_boxplot()

# conclusion: worst color diamonds are more expensive than better colored diamonds
ggplot(data=diamonds, mapping=aes(x=color, y=price)) + geom_boxplot()

# Make scatterplot with >2 variables
# points turn red
ggplot(data=diamonds, mapping=aes(x=carat, y=price)) + geom_point(color="red")

# points based on color
ggplot(data=diamonds, mapping=aes(x=carat, y=price)) + geom_point(aes(color=color))

# change size of each point to measure of the volume
ggplot(data=diamonds, mapping=aes(x=carat, y=price)) + 
  geom_point(aes(color=color, size=depth))
