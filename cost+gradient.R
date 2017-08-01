

#Cost function. Returns cost and gradients. Provides all the tools necessary to perform optimization.
cost = function(theta, X, y) {
  #number of training examples
  m = NROW(y)
  #h is the hypothesis predictions. It is 569 x 1.
  h = sigmoid(X %*% theta)
  #Compute Cost
  J = (1/m) * ( (-1 * t(y) ) %*% log(h) - t((1-y)) %*% log(1-h))
  print(NROW(y))
  
  #Compute gradient
  grad = (1/m) * t(X) %*% (sigmoid(X %*% theta) - y)
  return(list("cost" = J, "gradient" = grad))
}