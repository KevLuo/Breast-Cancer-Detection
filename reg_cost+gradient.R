

#Regularized cost function. Returns cost and gradients. Provides all the tools necessary to perform optimization.
reg_cost = function(theta, X, y, lambda) {
  #number of training examples
  m = NROW(y)
  #h is the hypothesis predictions. It is 569 x 1.
  h = sigmoid(X %*% theta)
  #compute regularization term
  reg_term = (lambda/(2*m)) * sum( theta[2:NROW(theta)]^2 )
  #Compute Cost
  J = (1/m) * ( (-1 * t(y) ) %*% log(h) - t((1-y)) %*% log(1-h)) + reg_term 
  
  #initialize gradient as 32 x 1 (same size as theta)
  grad = as.vector(rep(0, 32))
  #compute gradient regularization term
  grad_reg_term = (lambda/m) * theta[2:NROW(theta)]
  #Compute gradient
  grad[1] = (1/m) * t(X[, 1]) %*% (h - y)
  grad[2:length(grad)] = ( (1/m) * t(X[, 2:NCOL(X)]) %*% (h-y) ) + grad_reg_term

  return(list("cost" = J, "gradient" = grad))
}