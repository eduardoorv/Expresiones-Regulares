
function(input, output, session){
  
  data <- reactive({
    
    if(is.null(input$archivo))  return(NULL)
    
    else{
      
      conn <- file(input$archivo$datapath, "r")
      #text_lines <- readLines(conn, n = -1)
      y <- clean_file(readLines(conn, n = -1))
      close(conn)
      data_frame(y)
    
      }
  })
  
  output$stats <- renderPrint({
    
    tail(data())
    
  })
  }
