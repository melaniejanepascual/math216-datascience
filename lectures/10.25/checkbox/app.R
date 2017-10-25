library(shiny)

ui <- fluidPage(
  radioButtons(inputId = "checkbox", label = "Items", 
               c("Item 1", "Item 2", "Item 3"))
)

server <- function(input, output) {
  
}

shinyApp(ui = ui, server = server) 
