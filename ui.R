
ui <- fluidPage(
  fileInput("archivo","Archivo",multiple = F),
  verbatimTextOutput("stats")
)