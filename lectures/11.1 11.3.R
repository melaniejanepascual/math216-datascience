library(leaflet)
library(tidyverse)

new.data <- data.frame(lat = 53, long = 21)

leaflet(new.data) %>%
  addTiles() %>%
  addCircleMarkers(color = "red")

new.data2 <- data.frame(y= c(53, 51, 54), x = c(21, 24, 36), good.bad = c("Good", "Good", "Bad"))

leaflet(new.data2) %>%
  addTiles() %>%
  addCircleMarkers(lat = ~y, lng = ~x, color= "red")

cat <- makeIcon (
  iconUrl = "https://orig00.deviantart.net/104e/f/2015/256/d/1/cat_png_by_kasirun_hasibuan-d99ey1q.png", 
  iconWidth = 70, iconHeight = 70
)

dog <- makeIcon (
  iconUrl = "http://www.pngpix.com/wp-content/uploads/2016/02/Dog-PNG-Image-500x473.png", 
  iconWidth = 50, iconHeight = 50
)

leaflet(new.data2) %>%
  addTiles() %>%
  addMarkers(lat = ~y, lng = ~x, icon=~cat)

good.bad.icons <- iconList(
  Good = cat, 
  Bad = dog
)

leaflet(new.data2) %>%
  addTiles() %>%
  addMarkers(lat = ~y, lng = ~x, icon= ~good.bad.icons[good.bad])



#Map of middlebury -- label football stadium with football, 
#soccer field with soccer ball
#mead chapel with church icon


middlebury <- data.frame(name = c("Football", "Mead", "Soccer"), 
                         lat = c(44.001601, 44.0094568, 44.003111), 
                         lng = c(-73.179648, -73.1795047, -73.171127))



football <- makeIcon (
  iconUrl = "http://www.freeiconspng.com/uploads/football-american-png-4.png", 
  iconWidth = 50, iconHeight = 50
)


chapel <- makeIcon (
  iconUrl = "https://www.shareicon.net/data/512x512/2015/11/26/183958_church_512x512.png", 
  iconWidth = 50, iconHeight = 50
)


soccer <- makeIcon (
  iconUrl = "http://www.freeiconspng.com/uploads/soccer-ball-png-19.png", 
  iconWidth = 50, iconHeight = 50
)

midd.icons <- iconList(
  Football = football, 
  Mead = chapel, 
  Soccer = soccer
)

leaflet(middlebury) %>%
  addTiles() %>%
  addMarkers(lat =~lat, lng=~lng, icon= ~midd.icons[name])

library(rvest)

brady.url <- "https://en.wikipedia.org/wiki/Tom_Brady"

brady.url %>%
  read_html() %>%
  html_nodes("table")



