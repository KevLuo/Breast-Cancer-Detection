

#Performs gradient descent to minimize cost.
gradientDescent = function(X, y, theta, alpha, num_iterations) {
  #number of training examples
  m = NROW(y)
  #initialize a variable to record cost at each iteration
  J_history = matrix(0, num_iterations, 1)
  
  for (iteration in 1:num_iterations) {
    theta = theta - ( (alpha/m) * t(X) %*% (sigmoid(X %*% theta) - y) )
    temp_cost = reg_cost(theta, X, y, 0)
    
    J_history[iteration, 1] = temp_cost$cost
  }
  return(list("theta" = theta, "cost_history" = J_history))
}