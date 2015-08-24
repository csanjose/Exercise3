rankhospital <- function(state, outcome, num = "best") {
  
  if (outcome=="heart attack") {
    columna=11}
  else if (outcome=="heart failure") {
    columna=17}
  else if (outcome=="pneumonia") {
    columna=23}
  else stop('invalid outcome')
  
  # Read file
  datos <- read.csv("outcome-of-care-measures.csv")
  
  if(!any(state == datos$State)) stop('invalid state')
  
    # Extract data frame that matches State
  datos2 <- subset(datos, datos$State==state)
  # For managing purposes i select only necessary columns
  datos3 <- datos2[c(2,7,columna)]
  # Eliminate NA
  datos4 <- datos3[which(datos3[3] != "Not Available"), ]
  # Sort by 'columna'
  datos5 <- datos4[order(datos4[3]),]
  # Adds column with rank
  datos6 <- cbind(datos5, "Rank"=1:length(datos5[,1]))
  
  if (num=="best") {
    pos=1}
  else if (num=="worst") {
    pos=length(datos5[,1])}
  else pos=num
  
  # Returns hospital
  as.character(datos6[pos, "Hospital.Name"])
  
}