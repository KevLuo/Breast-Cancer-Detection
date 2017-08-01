

#Predicts labels using X as a feature matrix and theta as the corresponding parameter matrix
predict = function(X, theta) {
  #save the number of training examples
  m = nrow(X)
  #initialize predictions
  predictions = matrix(0, m, 1)
  #obtain probabilities
  probabilities = X %*% theta
  for (i in 1:m) {
    if (probabilities[i] >= 0) {
      predictions[i] = 1
    }
  }
  return(predictions)
}