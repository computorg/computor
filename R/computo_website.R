#' R Markdown site generator for Computo website (A Distill website)
#'
#' @inheritParams rmarkdown::default_site_generator
#'
#' @export
computo_website <- function(input, encoding = getOption("encoding"), ...) {
  distill::distill_website(input, encoding = getOption("encoding"), ...)
}
