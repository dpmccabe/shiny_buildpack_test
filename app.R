library(shiny)
library(dplyr)

ui <- function(request) {
  fluidPage(titlePanel("Test"))
}

server <- function(input, output) {
}

shinyApp(ui, server)
