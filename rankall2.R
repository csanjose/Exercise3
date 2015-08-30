rankall <- function(outcome, num = "best") {
 
  if (outcome=="heart attack") columna=11
  else if (outcome=="heart failure") columna=17
  else columna=23
  
  data <- read.csv("outcome-of-care-measures.csv", stringsAsFactor = FALSE, na.strings = "Not Available")[, c(2,7,columna)] 
  
  colnames(data) <- c("Name", "State", "rate")
  
  newdata <- data[ order(as.numeric(data[, 3]), data[, 1], na.last = NA), ]
  
  df1 <- split(newdata, newdata[,2])
  
  df2 <- data.frame()
  df2 <- NULL
 
  for (i in 1:length(df1)) {
    
    if (num=="best") j=1
    else if (num=="worst") j=nrow(df1[[i]])
    else j=num
    
    df2 <- rbind(df2, as.data.frame(df1[[i]][j,]))
    
  }
  df2[,c(1,2)]
}