con<-file("CIJ_Total-ORIGINAL (1).res","r")
s<-readLines(con,n=-1)

y<-gsub("\\s+(\\d+)\\s+(\\d+)\\s+([^=]*=\\d*\\.*\\d*|[^_]+_[^\\s]*)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s+([^\\s]+)\\s*$","\\1,\\2,\\3,\\4,\\5,\\6,\\7,\\8,\\9",x=s,perl=T)
y

m<-array(dim = c(length(y),9))

for(i in 1:length(y)){
  m[i,]<-unlist(strsplit(x=y[i], split = ","))
}

m<-data.frame(m)


