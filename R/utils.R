template_resources = function(name, ...) {
  system.file('rmarkdown', 'templates', name, 'resources', ..., package = 'epiR')
}

# import two helper functions from knitr
is_html_output = function(...) knitr::is_html_output(...)
is_latex_output = function(...) knitr::is_latex_output(...)

gsub_fixed = function(...) gsub(..., fixed = TRUE)

readUTF8 <- function(file, ...) readLines(file, encoding = 'UTF-8', warn = FALSE, ...)
writeUTF8 <- function(text, ...) writeLines(enc2utf8(text), ..., useBytes = TRUE)
