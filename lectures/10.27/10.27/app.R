library(shiny)
library(ggplot2)

ui <- fluidPage(
  sliderInput(inputId = "slider", label = "Choose a number",
              value = 5000, min = 1, max = 10000),
  textInput(inputId = "title", label = "Enter a title"),
  ## vector of length 1. when user presses button, it incremements it by 1
  actionButton(inputId = "actionButton1", label = "Make new data"),
  actionButton(inputId = "actionButton2", label = "Make new title"),
  plotOutput("hist")
)

server <- function(input, output) {
    
  #input$slider is reactive
  # make it so that x should change whenever slider changes
  x <- reactive({
    input$actionButton1
    isolate(data.frame(numbers = rnorm(input$slider)))
  })
    
  output$hist <- renderPlot({
    input$actionButton2
    # use isolate function to ???? 
    ggplot(x(), aes(numbers)) + geom_histogram() + ggtitle(isolate(input$title))
    ## you have to reference x as a function now
  })
}


#need 2 action buttons: 1
shinyApp(ui = ui, server = server) 
