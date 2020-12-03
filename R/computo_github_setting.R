#' @import usethis
#' 
#' @export

github_setting <- function() {
  # initianilizing the binder folder, used by the github action after
  if (!dir.exists("binder")) {
    dir.create("binder")
  }
  if (!file.exists("binder/apt.txt")) download.file(
    "https://raw.githubusercontent.com/computorg/actions/main/apt.txt",
    "binder/apt.txt")
  if (!file.exists("binder/environment.yml")) download.file(
    "https://raw.githubusercontent.com/computorg/actions/main/environment.yml",
    "binder/environment.yml")
  if (!file.exists("binder/install.R")) download.file(
    "https://raw.githubusercontent.com/computorg/actions/main/install.R",
    "binder/install.R")
  usethis::use_github_action("computorticle_action",
                             url = "https://github.com/computorg/actions")
}
