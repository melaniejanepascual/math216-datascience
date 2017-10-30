library(shiny)

ui <- fluidPage(
  actionButton(inputId = "button1", "Normal"),
  actionButton(inputId = "button2", label = "uniform"),
  plotOutput("hist")
)


server <- function(input, output) {
  ## create vector with nothing in it
  v <- reactiveValues(data = NULL)
  
  ## 2 different outputs based on what button is clicked 
  observeEvent(input$button1, {
                v$data <- rnorm(10000)
  })
  
  observeEvent(input$button2, {
    v$data <- runif(10000)
  })
  
  output$hist <- renderPlot({
    if(is.null(v$data) == TRUE) {return()}
    hist(v$data)
  })
  
}

shinyApp(ui = ui, server = server)

