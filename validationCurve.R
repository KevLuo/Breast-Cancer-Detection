

validationCurve = function(X_train, y_train, Xval, yval) {
  lambda_vec = c(0, 0.1, 0.5, 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6)
  error_train = as.vector(rep(0, length(lambda_vec)))
  error_val = as.vector(rep(0, length(lambda_vec)))
  initial_theta = matrix(0, 32, 1)
  for(i in 1:length(lambda_vec)) {
    
    theta = regGradientDescent(X_train, y_train, initial_theta, 0.05, 400, lambda_vec[i])$theta
    error_train[i] = reg_cost(theta, X_train, y_train, 0)$cost
    error_val[i] = reg_cost(theta, Xval, yval, 0)$cost
  }
  
  return(list("lambda_vec" = lambda_vec, "error_train" = error_train, "error_val" = error_val))
}