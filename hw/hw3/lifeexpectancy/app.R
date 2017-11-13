# Demonstrate the changes in life expectancy for each country/continent over time 
# using a Shiny App.
library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "lifespan", label = "Choose a year", value = 1800, 
              min = 1800, max = 2017),
  plotOutput("plot1")
  
)

server <- function(input, output) {
  histogram <- eventReactive(input$lifespan, {
    output$hist <- renderPlot(plot(mtcars$wt, mtcars$mpg))
  })

}

shinyApp(ui = ui, server = server)

