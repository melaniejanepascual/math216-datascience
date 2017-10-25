library(shiny)
library(ggplot2)
# generate 1000 random normal variables and let the user control
# mean, standard deviation, graph title, color

ui <- fluidPage(
  textInput(inputId = "mean", label = "Mean", value = "Enter mean"),
  textInput(inputId = "sd", label = "Standard Deviation", value = "Enter standard deviation"),
  textInput(inputId = "title", label = "Graph Title", value = "Enter title for graph"),
  selectInput(inputId = colors, label = "Colors",
              choices = c("red", "blue", "green")),
  plotOutput(outputId = "Histogram")
  
  
)

server <- function(input, output) {
  output$value <- renderPrint({ input$mean })
  output$value <- renderPrint({ input$sd })
  output$value <- renderPrint({ input$title })
  
  output$Histogram <-renderPlot({
    # generate random normal variables
    random.variables <- data.frame(numbers = rnorm(input$slider1))
    ggplot(random.variables, aes(numbers)) + geom_histogram()
  })
}

shinyApp(ui = ui, server = server) 
