#' Template for articles (HTML)
#'
#' A template for creating HTML articles according to the our futur format.
#'
#' @inheritParams rmarkdown::pdf_document
#' @rdname epiR_article
#' @export
pdf_article <- function(...) {

    ## call the base pdf_document format with the appropriate options
    format <- rmarkdown::pdf_document(fig_width = 8, fig_height = 5, fig_crop = TRUE,
                                      dev = 'pdf', highlight = "pygments",
                                      citation_package = "natbib",
                                      template = template_resources("pdf_article", "template.tex"), ...)

    ## create knitr options (ensure opts and hooks are non-null)
    knitr_options <- rmarkdown::knitr_options_pdf(8, 5, TRUE, 'pdf')
    if (is.null(knitr_options$opts_knit))  knitr_options$opts_knit = list()
    if (is.null(knitr_options$knit_hooks)) knitr_options$knit_hooks = list()

    ## set options
    knitr_options$opts_chunk$tidy = TRUE
    knitr_options$opts_knit$width = 45

    ## set hooks for special plot output
    knitr_options$knit_hooks$plot <- function(x, options) {
        knitr::hook_plot_tex(x, options)
    }

    ## override the knitr settings of the base format and return the format
    format$knitr <- knitr_options
    format$inherits <- 'pdf_document'
    format
}
