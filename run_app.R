#' [--RUN APP--]
#'
#' Run ui.R
source("./ui.R")
#' Run server.R
source("./server.R")
shiny::shinyApp(ui, server)

