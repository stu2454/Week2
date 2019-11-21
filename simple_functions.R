addtwo <-function(x,y){
  x+y
}

aboveten<-function(x){
        use<-x>10
        x[use]
  
}

aboveN <-function(x,n){
  use<-x>n
  x[use]
}

columnMean <-function(y,removeNA = TRUE){
  nc<-ncol(y)
  means<-numeric(nc)
  for(i in 1:nc){
    means[i]<-mean(y[,i], na.rm = removeNA)
  }  
  means
}