setwd("/home/eduardo/expresionesRegulares")

conn <- file("CIJ_Total-ORIGINAL.res", "r") 
text_lines <- readLines(conn, n = -1)

clean_file <- function(lines_char){

       clean_file <- gsub("\\s+(\\d+)\\s+(\\d+)\\s+([^=]*=\\d*\\.*\\d*|[^_]+_[^\\s]*)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s*$",
       "\\1-\\2, \\3, \\4, \\5, \\6, \\7, \\8, \\9",
       x = text_lines,
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

data_frame <- data.frame(val_matrix)

}

val_dataframe <- data_frame(y)
