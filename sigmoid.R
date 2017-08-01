

sigmoid = function(z) {
  g = 1/(1 + exp(-1 * z))
  return(g)
}