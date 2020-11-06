#' [--USER INTERFACE--]
#'
#' Run `dashboard_header.R`
#' Run `dashboard_sidebar.R`
#' Run `dashboard_body.R`
#' UI has three parts: a header, a sidebar, and a body.
ui <- shinydashboard::dashboardPage(
  #' Header
  dashboard_header,
  #' Sidebae
  dashboard_sidebar,
  #' Body
  dashboard_body
)
