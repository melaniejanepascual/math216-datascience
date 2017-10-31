# Demonstrate the changes in life expectancy for each country/continent over time 
# using a Shiny App.
library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "years", label = "Choose a year", value = 1950, 
              min = 1900, max = 2017)
)

server <- function(input, output) {
  histogram <- eventReactive(input$years, {
    hist(rnorm(input$num))
  })
  output$hist <- renderPlot(histogram())
  
}

shinyApp(ui = ui, server = server)

