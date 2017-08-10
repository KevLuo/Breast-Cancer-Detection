

#Performs regularized gradient descent to minimize cost.
gradientDescent = function(X, y, theta, alpha, num_iterations, lambda) {
  #number of training examples
  m = NROW(y)
  #initialize a variable to record cost at each iteration
  J_history = matrix(0, num_iterations, 1)
  #compute regularization term
  reg_term = (lambda/m) * theta[2:end]
  for (iteration in 1:num_iterations) {
    theta[1] = theta[1] - ( (alpha/m) * t(X[, 1]) %*% (sigmoid(X %*% theta) - y) )
    theta[2:end] = theta[2:end] - alpha( (1/m) * t(X[, 2:end]) %*% (sigmoid(X %*% theta) - y) + reg_term)
    temp_cost = cost(theta, X, y)
    
    J_history[iteration, 1] = temp_cost$cost
  }
  return(list("theta" = theta, "cost_history" = J_history))
}