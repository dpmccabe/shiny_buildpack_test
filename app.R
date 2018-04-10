message("Inside app.R")

library(shiny)

ui <- function(request) {
  fluidPage(titlePanel("Test"))
}

server <- function(input, output) {
}

shinyApp(ui, server, options = list(port = 12000, host = "0.0.0.0"))
