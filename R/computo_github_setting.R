#' @import usethis
#' 
#' @export

github_setting <- function() {
  usethis::use_github_action("computorticle_action",
                             url = "https://github.com/computorg/actions")
}
