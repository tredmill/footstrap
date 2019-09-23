#' The title goes here.
#'
#' The subtitle goes here.
#'
#' A long description that spans over multiple rows is allowed right here. 
#' Note that `roxygen2` documentation starts with `#'`. Also, spacing matters.
#'
#' @param data The argument type. Additional description for the argument.
#' @param statistic The argument type. Additional description for the argument.
#' @param replicates The argument type. Additional description for the argument.
#' @param formula The argument type. Additional description for the argument.
#'
#' @return Description about the return type of the function. Similarly, the return 
#' description can also span over multiple rows and the spacing matters.
#'
#' @examples
#' \dontrun{
#' test <- get.bootstrap(data = cars, statistic = get.lm, replicates = 1e4, formula = speed ~ dist)
#' }
#' @export
get_bootstrap <- function(data, statistic, replicates, formula) {
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