render_format <- function(name) {

  format <- rmarkdown::draft(
    file     = paste0("computo_", name, ".Rmd"), 
    template = name, 
    package  = "computoR", create_dir = TRUE, edit = FALSE)
  
  output_file <- rmarkdown::render(format, quiet = TRUE)
  
  cat(output_file)
}

render_format("article_R")
render_format("article_python")
render_format("article_julia")
