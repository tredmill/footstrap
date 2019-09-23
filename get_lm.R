get.lm <- function(formula, data, indices) {
  return(lm(formula = formula, data = data[indices, ])$coef[,2])
}