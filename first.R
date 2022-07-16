library(dplyr)
library(randomForest)
data = iris
attach(data)
iris.rf = randomForest(Species ~ . , data = data  , ntree=100)

NewPrediction <- function(model , newdata)
{
  new.prediction <- predict(object = model , newdata= newdata)
  return(new.prediction)
}

modellist <- vector(mode = 'list')

modellist$modelobject <- iris.rf
modellist$NewPrediction <- NewPrediction
saveRDS(object = modellist , file = "irismodel.rds")
