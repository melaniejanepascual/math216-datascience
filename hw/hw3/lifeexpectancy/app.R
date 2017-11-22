# Demonstrate the changes in life expectancy for each country/continent over time 
# using a Shiny App.

library(shiny)
library(tidyverse)
library(plyr)
library(dplyr)

# clean up variables 
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

# organize the super dataset
draft <- join(lifespan, income)
final <- join(draft, population)
# write.csv(final, file = "country.csv")

country <- read.csv("country.csv")

# artsy
asia <-  
  country %>%
    filter(continent == 1)
africa <- 
  country %>%
    filter(continent == 2)
europe <- 
  country %>%
    filter(continent == 3)

australia <- 
  country %>%
    filter(continent == 4)
north.america <-
  country %>%
  filter(continent == 5)
south.america <-
  country %>%
  filter(continent == 6)

# Application  
ui <- fluidPage(
  sliderInput(inputId = "year", label = "Choose a year", value = 1800, 
              min = 1800, max = 2010, step = 10, animate = TRUE),
  plotOutput("plot1")
  
)  

server <- function(input, output) {
  scatter <- eventReactive(input$year, {
                country %>%
                  filter(year == input$year) %>%
                  ggplot(aes(x = income, y = lifespan)) +
                  geom_point(aes(color = factor(continent, 
                    labels = c("Asia","Africa","Europe", "Australia",
                     "North America", "South America")), size = population)) +
                  labs(color = "Continent", population = "Population") 
            
                              
            })
  output$plot1 <- renderPlot(
   scatter()
  )

}

shinyApp(ui = ui, server = server)






