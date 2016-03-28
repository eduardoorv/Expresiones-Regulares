#setwd("/Users/natorro/Desktop/RFONDEN/githubs/eduardo/Expresiones-Regulares/")
conn <- file("CIJ_Total-ORIGINAL.res", "r") 
text_lines <- readLines(conn, n = -1)

clean_file <- function(lines_char){
  
       validated_lines <- grep ("\\s+(\\d+)\\s+(\\d+)\\s+([^=]*=\\d*\\.*\\d*|[^_]+_[^\\s]*)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s*$",
       lines_char,
       perl = TRUE)  
  
  
       clean_file <- gsub("\\s+(\\d+)\\s+(\\d+)\\s+([^=]*=\\d*\\.*\\d*|[^_]+_[^\\s]*)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s*$",
       "\\1, \\3, \\4, \\5, \\6, \\7, \\8, \\9",
       x = lines_char[validated_lines],
       perl = TRUE)
       
}

y <- clean_file(text_lines)

close(conn)
head(y)
tail(y)

data_frame <- function(clean_data){

val_matrix <- array(dim = c(length(clean_data), 8))

for(i in 1:length(clean_data)){
  
  val_matrix[i,] <- unlist(strsplit(x = clean_data[i], split = ","))
  
}

data_frame_char <- data.frame(val_matrix, stringsAsFactors = FALSE)

names(data_frame_char) <- c("Temporalidad", "Escenario", "Frecuencia", "EP", "VarP", "a", "b", "EXP")

for(i in c("Temporalidad", "Frecuencia", "EP", "VarP", "a", "b", "EXP")){
  
  data_frame_char[,i] <- as.numeric(data_frame_char[,i])
  
}

data_frame <- data_frame_char

}

val_dataframe <- data_frame(y)

tail(val_dataframe)


