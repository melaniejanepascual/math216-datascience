library(ggplot2)
ggplot(data = diamonds, aes(color, price)) + geom_boxplot()

## Add title to graph 
ggplot(data = diamonds, mapping = aes(carat, price)) +
  geom_point(aes(color=color, size = depth)) +
    ggtitle("Roberts Graph") + xlab("CARAT") + ylab("PRICE")
  

## To center graph titles
theme_update(plot.title=element_text(hjust = 0.5))

##Changes axis labels/limits
ggplot(data = diamonds, mapping = aes(carat, price)) +
  geom_point(aes(color=color, size = depth)) +
  ggtitle("Roberts Graph") + xlab("CARAT") + ylab("PRICE") +
  scale_x_continuous(limits=c(0,10), breaks = c(0,2,4,6,8,10)) +
  scale_y_continuous(limits=c(0,10), breaks = c(0,2,4,6,8,10))
## Warning message:
## Removed 53940 rows containing missing values (geom_point). 


## Make new plot
ggplot(diamonds) + geom_point(aes(x=carat, y=price))

## Make new data set, chooses specific row
## Checking premium cut diamonds
diamonds2 <- subset(diamonds, cut == "Premium")

## Plot diamonds2 data points on graph
ggplot() + geom_point(data=diamonds, aes(x=carat, y=price)) +
  geom_point(data= diamonds2, aes(x=carat, y=price), color = "red", size = 1)


## Add layers to histogram
## Make histograms of diamonds prices for colors D and J
d.diamonds <- subset(diamonds, color == "D")
j.diamonds <- subset(diamonds, color == "J")

ggplot(diamonds, mapping = aes(price)) +
  geom_histogram(data = d.diamonds, aes(price), fill ="red", alpha = .3) +
  geom_histogram(data = j.diamonds, aes(price), fill ="blue", alpha = .3)
