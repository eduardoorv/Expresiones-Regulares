library(shiny)

options(shiny.maxRequestSize = 9*1024^2)

shinyApp(ui, server)
