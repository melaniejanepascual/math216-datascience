library("ggplot2")

skittles <- data.frame(skittle.color = c("Purple", "Green", "Red", "Yellow", "Orange"),
    count = c(18, 20, 19, 20, 25))

#Bar Plot
ggplot(skittles, aes(skittle.color, count)) + geom_col()
skittle.bar<- ggplot(skittles, aes(x="", y=count, fill=skittle.color))+
  geom_bar(width = 1, stat = "identity") 

#Pie Chart
skittle.pie <- skittle.bar + coord_polar("y", start=0) + scale_fill_manual(values=c("green", "orange", "purple", "red", "yellow"))
