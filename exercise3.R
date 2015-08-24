best <-(state, outcome) {
  
  datos <- read.csv("outcome-of-care-measures.csv")
  
  datos2 <- subset(datos, datos$State==state)
  
}