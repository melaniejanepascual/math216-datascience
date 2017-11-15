# Demonstrate the changes in life expectancy for each country/continent over time 
# using a Shiny App.
library(shiny)
library(tidyverse)
library(plyr)
library(dplyr)


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

first <- join(lifespan, income)
second <- join(first, population)

## converting from wide to long with gather()


## clean up the ones without N/A



ui <- fluidPage(
  sliderInput(inputId = "lifespan", label = "Choose a year", value = 1800, 
              min = 1800, max = 2017),
  plotOutput("scatterplot")
  
)

server <- function(input, output) {
  output$scatterplot <- renderPlot({
      ggplot(aes(x = income, y = lifespan)) +
        geom_point(stat="identity", aes(fill = population, size = population)) 
  })

}

shinyApp(ui = ui, server = server)

