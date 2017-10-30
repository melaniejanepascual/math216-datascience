library(shiny)

ui <- fluidPage(
   sliderInput(inputId = "num", label = "Choose a number", value = 5000, 
               min = 1, max = 10000),
   textInput(inputId = "text1", label = "write a title"),
   actionButton(inputId = "button1", label = "Activate!"),
   plotOutput("hist")
)

# observeEvent() - if i observe a reactive value change, ill run some code
# eventReactive()
server <- function(input, output) {
   # if someone clicks action button, then ____
  observeEvent(input$button1,{
    output$hist <- renderPlot({
      hist(input$num)  
    })
  })
}

shinyApp(ui = ui, server = server)

