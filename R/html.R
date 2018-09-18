#' Template for articles (HTML)
#'
#' A template for creating HTML articles according to the our futur format.
#'
#' @inheritParams rmarkdown::html_document
#' @rdname epiR_article
#' @export
html_article <- function(...) {

  ## call the base html_document format with the appropriate options
  rmarkdown::html_document(theme = "united",
                            highlight = "tango",
                            toc = TRUE,
                            df_print = "paged",
                            code_folding = "show",
                            code_download = TRUE,
                            toc_float = TRUE,
                            number_sections = TRUE,
                            # css = template_resources("html_article", "template.css"),
                            # includes = rmarkdown::includes(before_body = template_resources("html_article", "header.html"))
                           )

    ## TODO: create knitr options
    ## create knitr options (ensure opts and hooks are non-null)

}
