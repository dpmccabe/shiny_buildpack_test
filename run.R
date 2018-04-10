message("Inside run.R")

library(shiny)

shiny::runApp(
  appDir = getwd(),
  host = '0.0.0.0',
  port = 12000
)
