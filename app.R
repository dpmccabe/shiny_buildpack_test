library(shiny)

ui <- function(request) {
  fluidPage(titlePanel("Test"))
}

server <- function(input, output) {
}

shinyApp(ui, server, options = list(port = 12000))
