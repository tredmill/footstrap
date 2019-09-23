#' Package title.
#'
#' @details
#' Multi-line package description.
#' 
#' @section Section name:
#' You can add multiple sections.
#'
#' @import grDevices
#' @importFrom stats lm
#'
#' @docType package
#'
#' @name footstrap
"_PACKAGE"

.onAttach <- function(libname, pkgname) {
    # Print a welcome message when the package is attached.
    cat(rep("-", 20), "\n")
    cat("Thank you for using `footstrap`!", "\n")
    cat(rep("-", 20), "\n")
}