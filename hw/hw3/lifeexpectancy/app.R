# Demonstrate the changes in life expectancy for each country/continent over time 
# using a Shiny App.
library(shiny)
library(tidyverse)
library(plyr)
library(dplyr)

## TO DO CHECKLIST:
# FILL IN NA'S(mostly for population)
# FIGURE OUT WHY IT ISNT PLOTTING

## create super data set, clean up everything else 
lifespan1 <- read.csv("lifeexpectancy.csv",check.names = F)
income1 <- read.csv("incomepp.csv", check.names = F)
population1 <- read.csv("population.csv", check.names = F)

lifespan2 <- gather(lifespan1, year, lifespan, -"Life expectancy")
income2 <- gather(income1, year, income, -"GDP per capita")
population2 <- gather(population1, year, population, -"Total population")
population3 <- population2[colSums(!is.na(population2)) > 0]

lifespan <- na.omit(lifespan2, cols = col("lifespan"))
income <- na.omit(income2, cols = col("income"))
population <- na.omit(population3, cols = col("population"))

lifespan <- rename(lifespan, c("Life expectancy" = "country"))
income <-  rename(income, c("GDP per capita" = "country"))
population <- rename(population, c("Total population" = "country"))

draft <- join(lifespan, income)

## the super dataset
final <- join(first, population)


# lifespan range is 1 - 85
# income range 142 - 182668


# actiual program 
ui <- fluidPage(
  sliderInput(inputId = "year", label = "Choose a year", value = 1800, 
              min = 1800, max = 2017),
  plotOutput("plot1")
  
)

server <- function(input, output) {
  output$plot1 <- renderPlot({
    final %>%
      filter(year == input$Year) %>%
      ggplot(aes(x = income, y = lifespan)) +
      geom_point(stat="identity", aes(fill = population))
  })

}

shinyApp(ui = ui, server = server)






