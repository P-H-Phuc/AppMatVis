#' [--USER INTERFACE--]
#'
#' Run `header.R`
source("./components/header.R")
#' Run `sidebar.R`
source("./components/sidebar.R")
#' Run `dashboard_body.R`
source("./components/body.R")
#' 
#' UI has three parts: a header, a sidebar, and a body.

ui <- tagList(
  #' Setup theme for APP
  includeCSS(path = "www/theme/theme_custom.css"),
  shinydashboard::dashboardPage(
    #' Header
    header,
    #' Sidebae
    sidebar,
    #' Body
    body)
)
