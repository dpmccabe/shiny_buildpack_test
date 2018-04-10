message("Inside run.R")

library(shiny)

shiny::runApp(
  appDir = getwd(),
  host = '127.0.0.1', 
  port = 12000
)
