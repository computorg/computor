#' Template for Computo articles
#'
#' A template for creating scientific articles according to the Computo format, native to the web.
#'
#' Based on distill articles, which feature attractive, reader-friendly typography, flexible
#' layout options for visualizations, and full support for footnotes and citations.
#' 
#' @inheritParams distill::distill_article
#' 
#' @import distill
#' @import reticulate
#'   
#' @export
article <- function(
                    # toc = TRUE,
                    # toc_depth = 3,
                    # fig_width = 6.5,
                    # fig_height = 4,
                    # fig_retina = 2,
                    # fig_caption = TRUE,
                    # dev = "png",
                    # smart = TRUE,
                    # self_contained = TRUE,
                    # mathjax = "default",
                    # extra_dependencies = NULL,
                    # css = NULL,
                    # includes = NULL,
                    # keep_md = FALSE,
                    # lib_dir = NULL,
                    # md_extensions = NULL,
                    # pandoc_args = NULL,
                    ...) {

  toc <- TRUE
  toc_depth <- 3
  fig_width <- 6.5
  fig_height <- 4
  fig_retina <- 2
  fig_caption <- TRUE
  dev <- "png"
  smart <- TRUE
  self_contained <- TRUE
  mathjax <- "default"
  extra_dependencies <- NULL
  css <- NULL
  includes <- NULL
  keep_md <- FALSE
  lib_dir <- NULL
  md_extensions <- NULL
  pandoc_args <- NULL
  
  
  distill::distill_article(toc = toc,
                           toc_depth = toc_depth,
                           fig_width = fig_width,
                           fig_height = fig_retina,
                           fig_retina = fig_retina,
                           fig_caption = fig_caption,
                           dev = dev,
                           smart = smart,
                           self_contained = self_contained,
                           mathjax = mathjax,
                           extra_dependencies = extra_dependencies,
                           css = css,
                           includes = includes,
                           keep_md = keep_md,
                           lib_dir = lib_dir,
                           md_extensions = md_extensions,
                           pandoc_args = pandoc_args,
                           ...) 

}
