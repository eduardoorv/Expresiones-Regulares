setwd("/Users/natorro/Desktop/RFONDEN/githubs/eduardo/Expresiones-Regulares")
conn <- file("CIJ_Total-ORIGINAL.res", "r") 

text_lines <- readLines(conn, n = -1)

y <- gsub("\\s+(\\d+)\\s+(\\d+)\\s+([^=]*=\\d*\\.*\\d*|[^_]+_[^\\s]*)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s*$",
          "\\1-\\2, \\3, \\4, \\5, \\6, \\7, \\8, \\9",
          x = text_lines,
          perl = TRUE)
close(conn)
head(y)
tail(y)

val_matrix <- array(dim = c(length(y), 9l))

for(i in 1:length(y)){
  val_matrix[i,] <- unlist(strsplit(x = y[i], split = ","))
}

val_dataframe <- data.frame(val_matrix)

