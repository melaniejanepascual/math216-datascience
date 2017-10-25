#base code for every shiny app
library(shiny)
library(ggplot2)

# controls everything the user will see - user interface!
ui <- fluidPage(
  ## can also choose 1 in checkboxes
  radioButtons(inputId = "RadioButtons ", label = "Items", 
               choices = c("Item 1", "Item 2", "Item 3")),
  sliderInput(inputId = "slider1", label = "Select a value",
              min = 0, max = 10000, value = 5000),
  plotOutput(outputId = "Histogram")
  
)
# do math in server function 
server <- function(input, output) {
  # generate random normal variables with the number equal to slider value, then
  # make a graph
  
  #everything you want to output needs to be stored in the output vector
  output$Histogram <-renderPlot({
    # generate random normal variables
    random.variables <- data.frame(numbers = rnorm(input$slider1))
    ggplot(random.variables, aes(numbers)) + geom_histogram()
  })
}

##everytime slider is changed, input is changed so a new histogram is made
shinyApp(ui = ui, server = server) 