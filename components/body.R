#' [--USER INTERFACE--]

#'A dashboard has three parts: a header, a sidebar, and a body.

#' ----------------------------------------------------------------------
#' [Dashboard Body]
#' ----------------------------------------------------------------------

dashboard_body <- dashboardBody(
  
  #' Tab Item Content
  tabItems(
    #' Content tab source code
    source_code_tab,
    #' Content explore distribution
    explore_distribution_tab
  )
)