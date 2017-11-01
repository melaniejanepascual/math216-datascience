# Demonstrate the changes in life expectancy for each country/continent over time 
# using a Shiny App.
library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "lifespan", label = "Choose a year", value = 1800, 
              min = 1800, max = 2017),
  plotOutput("hist")
  
)

server <- function(input, output) {
  histogram <- eventReactive(input$lifespan, {
    hist(rnorm(input$num))
  })
  output$hist <- renderPlot(histogram())
  
}

shinyApp(ui = ui, server = server)

