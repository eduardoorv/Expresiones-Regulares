library(shiny)

options(shiny.maxRequestSize = 9*1024^2)

ui <- fluidPage(
  fileInput("archivo","Archivo",multiple = F),
  verbatimTextOutput("stats")
)

server <- function(input, output, session){
  
  data <- reactive({
    if(is.null(input$archivo)) return(NULL)
    else{
      con<-file(input$archivo$datapath,"r")
      s<-readLines(con,n=-1)
      y<-gsub("\\s+(\\d+)\\s+(\\d+)\\s+([^=]*=\\d*\\.*\\d*|[^_]+_[^\\s]*)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s*$","\\1,\\2,\\3,\\4,\\5,\\6,\\7,\\8,\\9",x=s,perl=T)
      m<-array(dim = c(length(y),9))
      for(i in 1:length(y)){
        m[i,]<-unlist(strsplit(x=y[i], split = ","))
      }
      data.frame(m)
      }
  })
  
  output$stats <- renderPrint({
    tail(data())
  })
  
}

shinyApp(ui, server)