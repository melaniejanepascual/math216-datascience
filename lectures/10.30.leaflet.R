library(leaflet)

leaflet() %>%
  addTiles() %>% ## creates a world map 
  addMarkers(lng = -73.1755, lat = 44.01005, popup = "warner hall") ## middlebury college marker!

## generate random coordinates
dataset1 <- data.frame(y = 1:10, x = rnorm(10, sd = 10))


leaflet(dataset1) %>%
  addTiles() %>%
  addMarkers(lng = ~x, lat = ~y)
