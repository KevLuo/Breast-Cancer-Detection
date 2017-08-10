

#Performs regularized gradient descent to minimize cost.
regGradientDescent = function(X, y, theta, alpha, num_iterations, lambda) {
  #number of training examples
  m = NROW(y)
  #initialize a variable to record cost at each iteration
  J_history = matrix(0, num_iterations, 1)
  for (iteration in 1:num_iterations) {
    #compute regularization term
    reg_term = (lambda/m) * theta[2:NROW(theta)]
    theta[1] = theta[1] - ( (alpha/m) * t(X[, 1]) %*% (sigmoid(X %*% theta) - y) )
    theta[2:NROW(theta)] = theta[2:NROW(theta)] - alpha * ( (1/m) * t(X[, 2:NCOL(X)]) %*% (sigmoid(X %*% theta) - y) + reg_term)
    #store the cost history to ensure that cost is actually decreasing
    J_history[iteration, 1] = reg_cost(theta, X, y, 0)$cost
  }
  return(list("theta" = theta, "cost_history" = J_history))
}