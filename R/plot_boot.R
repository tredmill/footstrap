plot.boot <- function(boot, breaks = 50) {
    # Get number of parameters.
    n.parameters <- dim(boot$boot.sim)[2]
 
    # Split screen.
    par(mfrow = rev(n2mfrow(n.parameters)))
 
    # Create plot template.
    for(i in 1:n.parameters) {
        hist(boot$boot.sim[, i], breaks = breaks, 
             freq = FALSE, 
             xlab = colnames(boot$boot.sim)[i], 
             main = colnames(boot$boot.sim)[i], 
             col = "papayawhip")
        box()
        abline(v = boot$obs.statistic[i], col = "red", lwd = 2, lty = 2)
        legend("topright", legend = c("MLE"), col = c("red"), lwd = 2, 
               lty = 2, ncol = 1, cex = 0.8, bty = "n")
    }
 
    mtext("Bootstrap distributions", side = 3, line = -1, outer = TRUE)
 
    # Un-split screen.
    par(mfrow = c(1, 1))
}