get.bootstrap <- function(data, statistic, replicates, formula) {
    # Get the number of rows.
    n <- nrow(data)
 
    # Create random samples with replacement.
    samples <- matrix(sample(1:n, n * replicates, replace = T), nrow = replicates, ncol = n)
 
    # Run the bootstrap over the samples.
    boot.sim <- t(apply(samples, 1, function(x) statistic(formula = formula, data = data, indices = x)))
 
    # Create the output object.
    out <- list()
    out$boot.sim <- boot.sim
    out$obs.statistic <- statistic(formula = formula, data = data, indices = 1:n)
    out$data <- data
    out$formula <- formula
 
    return(out)
}