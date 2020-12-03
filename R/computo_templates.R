create_templates <- function(name, destination = "templates/") {

  prefix <- paste0("computo_",name)
  format <- rmarkdown::draft(
    file     = paste0(prefix, ".Rmd"), 
    template = name, 
    package  = "computoR", create_dir = TRUE, edit = FALSE)
  
   rmarkdown::render(format, quiet = TRUE)

  if (!dir.exists(destination)) dir.create(destination)
  file.copy(prefix, destination, recursive = TRUE, overwrite = TRUE)
  unlink(prefix, recursive = TRUE)
  
}

# render_templates <- function(name) {
# 
#   format <- rmarkdown::draft(
#     file     = paste0("template_", name, ".Rmd"), 
#     template = name, 
#     package  = "computoR", create_dir = TRUE, edit = FALSE)
#   
#   output_file <- rmarkdown::render(format, quiet = TRUE)
#   
#   cat(output_file)
# }
# 

