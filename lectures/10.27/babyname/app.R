# User can input a data and we plot the 10 most common babynames from that year
# colored by the sex of the baby
library(shiny)
library(babynames)
library(ggplot2)

ui <- fluidPage(
  sliderInput(inputId = "Year", label = "Select a range of dates",
              min = 1880, max = 2015, value = 1900),
  plotOutput(outputId = "BarChart")
)

server <- function(input, output) {
  output$BarChart <- renderPlot({
    babynames %>%
      filter(year == input$Year) %>%
      mutate(rank = rank(-prop)) %>%
      arrange(rank) %>%
      filter(rank <= 10) %>%
      ggplot(aes(x = reorder(name, prop), y = prop)) +
      geom_bar(stat="identity", aes(fill = sex)) +
      scale_fill_manual(values = c("Pink", "Blue")) +
      xlab("Name")
  })
}

shinyApp(ui = ui, server = server) 
