	
summary.boot <- function(boot) {
    # MLE standard errors.
    se.mle <- summary(lm(formula = boot$formula, data = boot$data))$coef[, 2]
 
    # Bootstrap standard errors.
    se.boot <- apply(boot$boot.sim, 2, sd)
 
    # Put all SEs together.
    se.all <- cbind(se.mle, se.boot)
 
    # Add column names.
    colnames(se.all) <- c("MLE", "Bootstrap")
 
    # Pretty print.
    cat("Comparison between Standard Errors:", "\n")
    print(se.all)
}