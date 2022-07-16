#
# This is a Plumber API. You can run the API by clicking
# the 'Run API' button above.
#
# Find out more about building APIs with Plumber here:
#
#    https://www.rplumber.io/
#

library(plumber)
library(randomForest)

#* @apiTitle Plumber Example API
#* @apiDescription Plumber example description.

#* Echo back the input
#* @param msg The message to echo
#* @get /echo
function(msg = "") {
    list(msg = paste0("The message is: '", msg, "'"))
}

modellist <- readRDS("C:\\Users\\aman singh\\OneDrive - DIT University\\Desktop\\R API\\irismodel.rds")

#* @param Sepal.Length
#* @param Sepal.Width
#* @param Petal.Length
#* @param Petal.Width

#* @get /predict 

predction <- function(Sepal.Length, Sepal.Width , Petal.Length , Petal.Width)
{
  Sepal.Length <- as.numeric(Sepal.Length)
  Sepal.Width <- as.numeric(Sepal.Width)
  Petal.Length <- as.numeric(Petal.Length)
  Petal.Width <- as.numeric(Petal.Width)
  
  x.new <- data.frame(Sepal.Length= Sepal.Length , 
                      Sepal.Width = Sepal.Width , 
                      Petal.Length = Petal.Length, 
                      Petal.Width = Petal.Width)
  y.pred <- modellist$NewPrediction(model = modellist$modelobject , newdata = x.new)
  
  return (y.pred)
  
}
