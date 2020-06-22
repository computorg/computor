#' Template for Computo articles (HTML)
#'
#' A template for creating scientific articles according to Computo format, native to the web.
#'
#' Based on distill articles, which feature attractive, reader-friendly typography, flexible
#' layout options for visualizations, and full support for footnotes and citations.
#' 
#' @inheritParams distill::distill_article
#' 
#' @import distill
#'   
#' @export
html_article <- function(...) {

  distill::distill_article(toc = TRUE,
                           toc_depth = 3,
                           fig_width = 6.5,
                           fig_height = 4,
                           fig_retina = 2,
                           fig_caption = TRUE,
                           dev = "png",
                           smart = TRUE,
                           self_contained = TRUE,
                           mathjax = "default",
                           extra_dependencies = NULL,
                           css = NULL,
                           includes = NULL,
                           keep_md = FALSE,
                           lib_dir = NULL,
                           md_extensions = NULL,
                           pandoc_args = NULL,
                           ...) 

}
