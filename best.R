best <- function(state, outcome) {
  
  datos <- read.csv("outcome-of-care-measures.csv")
  
  if (outcome=="heart attack") columna=11
  if (outcome=="heart failure") columna=17
  if (outcome=="pneumonia") columna=23
  
  if(!any(state == datos$State)) stop('invalid state')
  
  
  datos2 <- subset(datos, datos$State==state)
  
  datos3 <- datos2[c(2,7,columna)]
  
  datos4 <- datos3[which(datos3[3] != "Not Available"), ]
  
  row <- which.min(as.numeric(as.character(unlist(datos4[3]))))
  
  as.character(datos4[row, "Hospital.Name"])
  
  
}