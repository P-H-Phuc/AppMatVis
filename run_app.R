#' [--RUN APP--]
#'
#' Global option
source("./global_option.R")
#' Run ui.R
source("./ui.R")
#' Run server.R
source("./server.R")
shiny::shinyApp(ui, server)

