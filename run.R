message("Inside run.RR")

library(shiny)
library(RcppParallel)

shiny::runApp(
  appDir = getwd(),
  host = "127.0.0.1",
  port = 12000
)
