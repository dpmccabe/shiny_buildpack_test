function(input, output) {
  output$table <- DT::renderDataTable(DT::datatable(mtcars))
}
