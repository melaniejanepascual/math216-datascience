library(shiny)

ui <- fluidPage(
   sliderInput(inputId = "num", label = "Choose a number", value = 5000, 
               min = 1, max = 10000),
   textInput(inputId = "text1", label = "write a title"),
   actionButton(inputId = "button1", label = "Activate!"),
   plotOutput("hist")
)

# observeEvent() - if i observe a reactive value change, ill run some code
# eventReactive() - similar to observe event, but you can store it somewhere 
server <- function(input, output) {
  # if someone clicks action button, then make a histogram of random var and 
  # make input text the title 

  observeEvent(input$button1,{
    output$hist <- renderPlot({
      hist(rnorm(input$num), main = input$text1)  
    })
  })
  
  # anything reactive is a function 
  histogram <- eventReactive(input$button1, {
                  hist(rnorm(input$num))
              })
  output$hist <- renderPlot(histogram())
  
  # create my own list of reactive values separate from what the user will do
  
}

shinyApp(ui = ui, server = server)

