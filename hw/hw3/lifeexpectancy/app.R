# Demonstrate the changes in life expectancy for each country/continent over time 
# using a Shiny App.
library(shiny)
library(tidyverse)
library(plyr)
library(dplyr)

## TO DO CHECKLIST:
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
final <- join(draft, population)

write.csv(final, file = "country.csv")

country <- read.csv("country.csv")

## why is income decreasing!
test <- country %>%
  filter(year == 2010) %>%
  select(country, income)


# actiual program 
ui <- fluidPage(
  sliderInput(inputId = "year", label = "Choose a year", value = 1800, 
              min = 1800, max = 2010, step = 10),
  plotOutput("plot1")
  
)  

server <- function(input, output) {
  scatter <- eventReactive(input$year, {
                country %>%
                  filter(year == input$year) %>%
                  ggplot(aes(x = income, y = lifespan)) +
                  geom_point(stat="identity", aes(size = population))
            })
  output$plot1 <- renderPlot(
   scatter()
  )

}

shinyApp(ui = ui, server = server)






